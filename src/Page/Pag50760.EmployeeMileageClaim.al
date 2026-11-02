page 50760 "Employee Mileage Claim"
{
    // Employee Mileage Reimbursement Form (Paul, 2 Nov 2026). A Staff Claim with
    // "Mileage Claim" = true: same numbering, approval workflow and posting as staff claims.
    Caption = 'Employee Mileage Reimbursement Form';
    PageType = Card;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const("Staff Claim"),
                            "Mileage Claim" = const(true),
                            Posted = const(false));
    DeleteAllowed = false;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = IsOpen;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Director/Employee ID';
                    ShowMandatory = true;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Director/Employee Name';
                    Editable = false;
                }
                field("Mileage Period From"; Rec."Mileage Period From")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Mileage Period To"; Rec."Mileage Period To")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purpose';
                    ShowMandatory = true;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group(Vehicle)
            {
                Caption = 'Vehicle';
                field("Vehicle Model"; Rec."Vehicle Model")
                {
                    ApplicationArea = Basic;
                    Editable = IsOpen;
                    ShowMandatory = true;
                }
                field("Vehicle Engine CC"; Rec."Vehicle Engine CC")
                {
                    ApplicationArea = Basic;
                    Editable = IsOpen;
                    ShowMandatory = true;
                }
                field("Vehicle Reg. No."; Rec."Vehicle Reg. No.")
                {
                    ApplicationArea = Basic;
                    Editable = IsOpen;
                    ShowMandatory = true;
                }
                field("Mileage Rate"; Rec."Mileage Rate")
                {
                    // Entered by the approver (open the record from Approval Entries /
                    // Requests to Approve), then Approve.
                    ApplicationArea = Basic;
                    Editable = True;
                    ShowMandatory = RateEditable;

                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Reimbursement';
                    Editable = false;
                }
                field("Staff Claim No."; Rec."Staff Claim No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'The Staff Claim created for payment when this form was approved.';
                }
            }
            part(MileageLines; "Employee Mileage Claim Lines")
            {
                ApplicationArea = Basic;
                Caption = 'Trips';
                Editable = IsOpen;
                SubPageLink = No = field("No.");
                UpdatePropagation = Both;
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Doc. Attachment List Factbox1")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(57000), "No." = field("No.");
            }
            systempart(Notes; Notes)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                Enabled = not OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    CustomApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    CheckBeforeApproval();
                    VarVariant := Rec;
                    if CustomApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovalsMgmt.OnSendDocForApproval(VarVariant);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';
                Enabled = OpenApprovalEntriesExist;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    CustomApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    VarVariant := Rec;
                    CustomApprovalsMgmt.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action(Approve)
            {
                ApplicationArea = Basic;
                Caption = 'Approve';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = OpenApprovalEntriesExistForCurrUser;
                ToolTip = 'Approve. The final approver must have entered the Mileage Rate.';

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    CurrPage.SaveRecord();
                    ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    CurrPage.Update(false);
                end;
            }
            action(Reject)
            {
                ApplicationArea = Basic;
                Caption = 'Reject';
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                Visible = OpenApprovalEntriesExistForCurrUser;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    CurrPage.Update(false);
                end;
            }
            action(Delegate)
            {
                ApplicationArea = Basic;
                Caption = 'Delegate';
                Image = Delegate;
                Promoted = true;
                PromotedCategory = Process;
                Visible = OpenApprovalEntriesExistForCurrUser;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action(PrintForm)
            {
                ApplicationArea = Basic;
                Caption = 'Print Mileage Form';
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    MileageClaim: Record payments;
                begin
                    MileageClaim.SetRange("No.", Rec."No.");
                    Report.Run(Report::"Employee Mileage Reimbursement", true, false, MileageClaim);
                end;
            }
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Document';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    DMSDocuments: Record "DMS Documents";
                    DMSManagement: Codeunit "DMS Management";
                begin
                    Rec.TestField("Shortcut Dimension 1 Code");
                    DMSManagement.UploadStaffClaimDocuments(DMSDocuments."document type"::"Staff Claim", Rec."No.", 'Staff Claim', Rec.RecordId, Rec."Shortcut Dimension 1 Code");
                end;
            }
        }
        area(navigation)
        {
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                ShortCutKey = 'Shift+Ctrl+D';

                trigger OnAction()
                begin
                    Rec.ShowDocDim();
                    CurrPage.SaveRecord();
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."Payment Type"::"Staff Claim";
        Rec."Account Type" := Rec."Account Type"::Employee;
        Rec."Document Type" := Rec."Document Type"::"Staff Claims";
        Rec."Mileage Claim" := true;
        Rec.Date := Today;
        Rec."Payment Narration" := 'Mileage reimbursement';
    end;

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance();
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance();
    end;

    var
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        IsOpen: Boolean;
        RateEditable: Boolean;
        NoTripsErr: Label 'Enter at least one trip with kilometres before sending the mileage form for approval.';
        NoVoteItemErr: Label 'Trip %1 (%2) has no Vote Item. Enter the Vote Item the mileage is charged to.', Comment = '%1 = trip date, %2 = description';
        BalanceErr: Label 'This employee %1 has an outstanding balance of %2. Please contact your immediate supervisor.', Comment = '%1 = employee no., %2 = balance';

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        IsOpen := Rec.Status = Rec.Status::Open;
        // The approver types the Mileage Rate while the form is with them.
        RateEditable := IsOpen or ((Rec.Status = Rec.Status::"Pending Approval") and OpenApprovalEntriesExistForCurrUser);
    end;

    local procedure CheckBeforeApproval()
    var
        MileageLine: Record "PV Lines";
        Employee: Record Employee;
    begin
        Rec.TestField("Account No.");
        Rec.TestField("Account Name");
        Rec.TestField("Mileage Period From");
        Rec.TestField("Mileage Period To");
        Rec.TestField("Vehicle Model");
        Rec.TestField("Vehicle Engine CC");
        Rec.TestField("Vehicle Reg. No.");
        // Mileage Rate is entered by the approver.
        Rec.TestField("Payment Narration");
        Rec.TestField("Shortcut Dimension 1 Code");

        MileageLine.SetRange(No, Rec."No.");
        MileageLine.SetFilter(Kilometres, '<>%1', 0);
        if MileageLine.IsEmpty() then
            Error(NoTripsErr);
        if MileageLine.FindSet() then
            repeat
                if MileageLine."Account No" = '' then
                    Error(NoVoteItemErr, MileageLine.Date, MileageLine.Description);
                MileageLine.TestField(Description);
            until MileageLine.Next() = 0;

        if Employee.Get(Rec."Account No.") then begin
            Employee.CalcFields(Balance);
            if Employee.Balance < 0 then
                Error(BalanceErr, Employee."No.", Abs(Employee.Balance));
        end;
    end;
}
