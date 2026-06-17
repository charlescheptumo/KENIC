namespace KICD.KICD;

using Microsoft.HumanResources.Employee;
using System.Email;
using System.Automation;

codeunit 50036 "Leave Approval Notifications"
{
    Subtype = Normal;
    Permissions = tabledata "Approval Entry" = RIMD;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure OnApproveApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    var
        RecRef: RecordRef;
        LeaveApp: Record "HR Leave Applications";
    begin
        if not RecRef.Get(ApprovalEntry."Record ID to Approve") then
            exit;

        if RecRef.Number <> Database::"HR Leave Applications" then
            exit;

        RecRef.SetTable(LeaveApp);
        SendApplicantApprovalMail(LeaveApp, ApprovalEntry);
    end;

    procedure SendApplicantApprovalMail(LeaveApp: Record "HR Leave Applications"; ApprovalEntry: Record "Approval Entry"): Boolean
    var
        Applicant: Record Employee;
        Approver: Record Employee;
        NextApprover: Record Employee;
        EmailMsg: Codeunit "Email Message";
        Email: Codeunit Email;
        Subject: Text;
        Body: Text;
        ApproverName: Text;
        NextApproverName: Text;
        StepNo: Integer;
        TotalSteps: Integer;
        SupervisorEmail: Text;
        HREmail: Text;
        HREmailParams: Record "Hr E-Mail Parameters";
    begin
        Applicant.Reset();
        Applicant.SetRange("No.", LeaveApp."Employee No");
        if not Applicant.FindFirst() then
            exit(false);

        if Applicant."Company E-Mail" = '' then
            exit(false);

        Approver.Reset();
        Approver.SetRange("User ID", ApprovalEntry."Approver ID");
        if Approver.FindFirst() then
            ApproverName := Approver."First Name" + ' ' + Approver."Middle Name" + ' ' + Approver."Last Name"
        else
            ApproverName := ApprovalEntry."Approver ID";

        CalculateApprovalSteps(ApprovalEntry, StepNo, TotalSteps);

        SupervisorEmail := LeaveApp."Supervisor Email";

        HREmailParams.Reset();
        if HREmailParams.FindFirst() then
            HREmail := HREmailParams."Sender Address";

        if StepNo < TotalSteps then begin
            NextApproverName := GetNextApproverName(ApprovalEntry);

            Subject := 'Leave Application Approval Update - Step ' + Format(StepNo) + ' of ' + Format(TotalSteps);
            Body :=
                '<html><body>' +
                '<p>Dear ' + Applicant."First Name" + ',</p>' +
                '<p>Your leave application <strong>' + LeaveApp."Application Code" + '</strong> has been approved by <strong>' + ApproverName + '</strong>.</p>' +
                '<p><strong>Approval Progress:</strong> Step ' + Format(StepNo) + ' of ' + Format(TotalSteps) + '</p>' +
                '<p>The application is awaiting approval from <strong>' + NextApproverName + '</strong>.</p>' +
                '<br>' +
                '<p>Regards,<br>Human Resources Department</p>' +
                '</body></html>';
        end else begin
            Subject := 'Leave Application Fully Approved - ' + LeaveApp."Application Code";
            Body :=
                '<html><body>' +
                '<p>Dear ' + Applicant."First Name" + ',</p>' +
                '<p>Congratulations! Your leave application <strong>' + LeaveApp."Application Code" + '</strong> has been <strong>fully approved</strong>.</p>' +
                '<p><strong>Final approval by:</strong> ' + ApproverName + '</p>' +
                '<p><strong>Leave Details:</strong></p>' +
                '<ul>' +
                '<li>Application Code: ' + LeaveApp."Application Code" + '</li>' +
                '<li>Start Date: ' + Format(LeaveApp."Start Date") + '</li>' +
                '<li>End Date: ' + Format(LeaveApp."End Date") + '</li>' +
                '<li>Return Date: ' + Format(LeaveApp."Return Date") + '</li>' +
                '<li>Days Applied: ' + Format(LeaveApp."Days Applied") + '</li>' +
                '</ul>' +
                '<br>' +
                '<p>Regards,<br>Human Resources Department</p>' +
                '</body></html>';
        end;

        EmailMsg.Create(Applicant."Company E-Mail", Subject, Body, true);

        if SupervisorEmail <> '' then
            EmailMsg.AddRecipient(Enum::"Email Recipient Type"::Cc, SupervisorEmail);
        if HREmail <> '' then
            EmailMsg.AddRecipient(Enum::"Email Recipient Type"::Cc, HREmail);

        if Email.Send(EmailMsg, Enum::"Email Scenario"::Default) then
            exit(true)
        else
            exit(false);
    end;

    procedure GetNextApproverName(CurrentApprovalEntry: Record "Approval Entry"): Text
    var
        NextApprovalEntry: Record "Approval Entry";
        NextApprover: Record Employee;
        NextApproverName: Text;
    begin
        NextApprovalEntry.Reset();
        NextApprovalEntry.SetRange("Record ID to Approve", CurrentApprovalEntry."Record ID to Approve");
        NextApprovalEntry.SetFilter(Status, '%1|%2', NextApprovalEntry.Status::Open, NextApprovalEntry.Status::Created);
        NextApprovalEntry.SetFilter("Sequence No.", '>%1', CurrentApprovalEntry."Sequence No.");

        if NextApprovalEntry.FindFirst() then begin
            NextApprover.Reset();
            NextApprover.SetRange("User ID", NextApprovalEntry."Approver ID");
            if NextApprover.FindFirst() then
                NextApproverName := NextApprover."First Name" + ' ' + NextApprover."Middle Name" + ' ' + NextApprover."Last Name"
            else
                NextApproverName := NextApprovalEntry."Approver ID";
        end else begin
            NextApproverName := 'the next approver';
        end;

        exit(NextApproverName);
    end;

    procedure CalculateApprovalSteps(ApprovalEntry: Record "Approval Entry"; var StepNo: Integer; var TotalSteps: Integer)
    var
        AE: Record "Approval Entry";
    begin
        AE.Reset();
        AE.SetRange("Record ID to Approve", ApprovalEntry."Record ID to Approve");
        TotalSteps := AE.Count();

        AE.SetRange(Status, AE.Status::Approved);
        StepNo := AE.Count();
    end;

    procedure TestEmailForLeaveApplication(ApplicationCode: Code[20])
    var
        LeaveApp: Record "HR Leave Applications";
        ApprovalEntry: Record "Approval Entry";
        RecRef: RecordRef;
    begin
        if not LeaveApp.Get(ApplicationCode) then begin
            Message('Leave Application %1 not found!', ApplicationCode);
            exit;
        end;

        Message('Found Leave Application: %1 for Employee: %2', LeaveApp."Application Code", LeaveApp."Employee No");

        RecRef.GetTable(LeaveApp);

        ApprovalEntry.Reset();
        ApprovalEntry.SetRange("Record ID to Approve", RecRef.RecordId);

        if not ApprovalEntry.FindSet() then begin
            Message('No approval entries found for this leave application!');
            exit;
        end;

        Message('Found %1 approval entry(ies)', ApprovalEntry.Count);

        repeat
            Message('Approval Entry %1: Sequence No: %2, Status: %3, Approver: %4',
                ApprovalEntry."Entry No.",
                ApprovalEntry."Sequence No.",
                ApprovalEntry.Status,
                ApprovalEntry."Approver ID");
        until ApprovalEntry.Next() = 0;

        ApprovalEntry.Reset();
        ApprovalEntry.SetRange("Record ID to Approve", RecRef.RecordId);
        ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Approved);

        if not ApprovalEntry.FindLast() then begin
            Message('No approved entries found! Please approve the leave application first.');
            exit;
        end;

        Message('Testing email with Approval Entry: %1, Approver: %2',
            ApprovalEntry."Entry No.",
            ApprovalEntry."Approver ID");

        if SendApplicantApprovalMail(LeaveApp, ApprovalEntry) then
            Message('Email sent successfully!')
        else
            Message('Email sending failed.');
    end;

    procedure CheckEmployeeEmail(EmployeeNo: Code[20])
    var
        Employee: Record Employee;
    begin
        Employee.Reset();
        Employee.SetRange("No.", EmployeeNo);

        if not Employee.FindFirst() then begin
            Message('Employee %1 not found!', EmployeeNo);
            exit;
        end;

        Message('Employee Found: No: %1 Name: %2 %3 Email: %4',
            Employee."No.",
            Employee."First Name",
            Employee."Last Name",
            Employee."Company E-Mail");

        if Employee."Company E-Mail" = '' then
            Message('WARNING: Employee has no email address!')
        else
            Message('Email address exists: %1', Employee."Company E-Mail");
    end;

    procedure CheckEmailConfiguration()
    var
        EmailAccount: Record "Email Account";
        HREmailParams: Record "Hr E-Mail Parameters";
    begin
        if EmailAccount.FindFirst() then
            Message('Email Account found: %1', EmailAccount.Name)
        else
            Message('No Email Account configured!');

        HREmailParams.Reset();
        if HREmailParams.FindFirst() then
            Message('HR Email Parameters found: Sender: %1 Sender Address: %2',
                HREmailParams."Sender Name",
                HREmailParams."Sender Address")
        else
            Message('No HR Email Parameters configured');
    end;
}