codeunit 50760 "Mileage Claim Mgt."
{
    // Employee Mileage Reimbursement Form (Paul, 2 Nov 2026):
    //  - "Record" on Approval Entries / Requests to Approve opens the mileage form, so the
    //    approver can type the Mileage Rate before approving.
    //  - On final approval: a Staff Claim is created for payment (one line per trip), the
    //    employee is emailed the approved amount, and the mileage form is closed.
    Permissions = tabledata payments = rimd,
                  tabledata "PV Lines" = rimd;

    var
        RateMissingErr: Label 'Enter the Mileage Rate on mileage form %1 before approving it.', Comment = '%1 = mileage form no.';
        NothingToPayErr: Label 'Mileage form %1 has no trips with an amount. Check the kilometres and the Mileage Rate.', Comment = '%1 = mileage form no.';
        NarrationTxt: Label 'Mileage reimbursement %1', Comment = '%1 = mileage form no.';
        TripTxt: Label '%1 %2 - %3 (%4 km)', Comment = '%1 = date, %2 = start, %3 = end, %4 = km', Locked = true;
        EmailSubjectTxt: Label 'Mileage reimbursement %1 approved', Comment = '%1 = mileage form no.';

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Management", 'OnAfterGetPageID', '', false, false)]
    local procedure OpenMileageFormFromApprovals(var RecordRef: RecordRef; var PageID: Integer; ForceListPage: Boolean)
    var
        MileageClaim: Record payments;
    begin
        if ForceListPage then
            exit;
        if RecordRef.Number <> Database::payments then
            exit;
        RecordRef.SetTable(MileageClaim);
        if MileageClaim."Mileage Claim" and not MileageClaim.Posted then
            PageID := Page::"Employee Mileage Claim";
    end;

    [EventSubscriber(ObjectType::Table, Database::payments, 'OnAfterValidateEvent', 'Status', false, false)]
    local procedure OnMileageClaimReleased(var Rec: Record payments; var xRec: Record payments; CurrFieldNo: Integer)
    begin
        // The approval workflow releases the document with Validate(Status, Released) and then
        // saves it, so the changes made here (Staff Claim No., Status Closed) are saved with it.
        if not Rec."Mileage Claim" then
            exit;
        if Rec.Status <> Rec.Status::Released then
            exit;
        if Rec."Staff Claim No." <> '' then
            exit;
        CreateStaffClaim(Rec);
        NotifyEmployee(Rec);
        // The Staff Claim is what gets paid; closing the form keeps it out of Approved Staff Claims.
        Rec.Status := Rec.Status::Closed;
    end;

    procedure CreateStaffClaim(var MileageClaim: Record payments)
    var
        StaffClaim: Record payments;
        Trip: Record "PV Lines";
        ClaimLine: Record "PV Lines";
    begin
        if MileageClaim."Mileage Rate" = 0 then
            Error(RateMissingErr, MileageClaim."No.");
        MileageClaim.CalcFields("Total Amount");
        if MileageClaim."Total Amount" <= 0 then
            Error(NothingToPayErr, MileageClaim."No.");

        StaffClaim.Init();
        StaffClaim."Payment Type" := StaffClaim."Payment Type"::"Staff Claim";
        StaffClaim."Document Type" := StaffClaim."Document Type"::"Staff Claims";
        StaffClaim."Account Type" := StaffClaim."Account Type"::Employee;
        StaffClaim.Insert(true);

        StaffClaim.Validate("Account No.", MileageClaim."Account No.");
        StaffClaim.Date := Today;
        StaffClaim."Payment Narration" := CopyStr(StrSubstNo(NarrationTxt, MileageClaim."No."), 1, MaxStrLen(StaffClaim."Payment Narration"));
        StaffClaim."Shortcut Dimension 1 Code" := MileageClaim."Shortcut Dimension 1 Code";
        StaffClaim."Shortcut Dimension 2 Code" := MileageClaim."Shortcut Dimension 2 Code";
        StaffClaim."Dimension Set ID" := MileageClaim."Dimension Set ID";
        StaffClaim."Mileage Claim No." := MileageClaim."No.";
        // Already approved on the mileage form: ready for payment in Approved Staff Claims.
        StaffClaim.Status := StaffClaim.Status::Released;
        StaffClaim.Modify(true);

        Trip.SetRange(No, MileageClaim."No.");
        Trip.SetFilter(Amount, '<>%1', 0);
        if Trip.FindSet() then
            repeat
                ClaimLine.Init();
                ClaimLine.No := StaffClaim."No.";
                ClaimLine.Date := Trip.Date;
                if Trip."Type of Expense" <> '' then
                    ClaimLine.Validate("Type of Expense", Trip."Type of Expense")
                else begin
                    ClaimLine."Account Type" := Trip."Account Type";
                    ClaimLine."Account No" := Trip."Account No";
                end;
                ClaimLine.Description := CopyStr(StrSubstNo(TripTxt, Trip.Date, Trip."Start Location", Trip."End Location", Trip.Kilometres), 1, MaxStrLen(ClaimLine.Description));
                ClaimLine."Start Location" := Trip."Start Location";
                ClaimLine."End Location" := Trip."End Location";
                ClaimLine.Kilometres := Trip.Kilometres;
                ClaimLine.Validate(Amount, Trip.Amount);
                ClaimLine."Shortcut Dimension 1 Code" := StaffClaim."Shortcut Dimension 1 Code";
                ClaimLine."Shortcut Dimension 2 Code" := StaffClaim."Shortcut Dimension 2 Code";
                ClaimLine.Insert(true);
            until Trip.Next() = 0;

        MileageClaim."Staff Claim No." := StaffClaim."No.";
    end;

    local procedure NotifyEmployee(var MileageClaim: Record payments)
    var
        Employee: Record Employee;
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        ToAddress: Text;
        Body: Text;
    begin
        // Email to the employee; the approval still goes through if there is no address.
        if not Employee.Get(MileageClaim."Account No.") then
            exit;
        ToAddress := Employee."Company E-Mail";
        if ToAddress = '' then
            ToAddress := Employee."E-Mail";
        if (StrPos(ToAddress, '@') = 0) or (StrPos(ToAddress, '.') = 0) then
            exit;

        MileageClaim.CalcFields("Total Amount");
        Body := 'Dear ' + MileageClaim."Account Name" + ',<br><br>' +
                'Your Employee Mileage Reimbursement Form <b>' + MileageClaim."No." + '</b>' +
                ' for the period ' + Format(MileageClaim."Mileage Period From") + ' to ' + Format(MileageClaim."Mileage Period To") +
                ' has been approved.<br><br>' +
                'Approved amount: <b>KES ' + Format(MileageClaim."Total Amount", 0, '<Precision,2:2><Standard Format,0>') + '</b>' +
                ' (Mileage Rate KES ' + Format(MileageClaim."Mileage Rate", 0, '<Precision,2:2><Standard Format,0>') + ' per km).<br>' +
                'Staff Claim <b>' + MileageClaim."Staff Claim No." + '</b> has been created for payment.<br><br>' +
                'Regards,<br>' + CompanyName();
        EmailMessage.Create(ToAddress, StrSubstNo(EmailSubjectTxt, MileageClaim."No."), Body, true);
        // Was: always Email.Enqueue, which schedules a background task. Users whose licence or
        // permissions do not allow scheduled tasks then got "You do not have permission to
        // create or run scheduled tasks" and could not approve. Queue it when the approver may
        // schedule tasks; otherwise send it now. A failed send is kept in the Email Outbox and
        // never stops the approval.
        if TaskScheduler.CanCreateTask() then
            Email.Enqueue(EmailMessage, Enum::"Email Scenario"::Default)
        else
            if not Email.Send(EmailMessage, Enum::"Email Scenario"::Default) then;
    end;
}
