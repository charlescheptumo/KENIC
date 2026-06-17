#pragma warning disable AA0005, AA0008, AA0018,AL0603, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
page 57184 "Salary Advance Card"
{
    PageType = Card;
    SourceTable = 57000;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Salary Advance Memo No"; Rec."Salary Advance Memo No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Salary Advance Memo No field.', Comment = '%';
                }
                field("Salary Type"; Rec."Salary Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Type field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }

                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Date of Joining"; Rec."Date of Joining")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date of Joining field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pay Mode field.', Comment = '%';
                }
                field("Project Name"; Rec."Project Name")
                {
                    Caption = 'Branch Name';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Branch Name field.';
                }
                field("Salary Last Drawn"; Rec."Salary Last Drawn")
                {
                    ApplicationArea = All;
                    Caption = 'Basic Pay';
                    ToolTip = 'Specifies the value of the Basic Pay field.';
                }
                field("Salary Advance"; Rec."Salary Advance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Salary Advance field.';
                }
                field("No of months deducted"; Rec."No of months deducted")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of months deducted field.';
                }
                field("Monthly Installment"; Rec."Monthly Installment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Monthly Installment field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Amount Pending"; Rec."Amount Pending")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount Pending field.';
                }
                field("Recovery Start Month"; Rec."Recovery Start Month")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Recovery Start Month field.';
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Payroll Deduction Code"; Rec."Payroll Deduction Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll Deduction Code field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
            }
        }
        area(factboxes)
        {
            part(Attachments; "Doc. Attachment List Factbox")
            {
                ApplicationArea = Basic;
                SubPageLink = "Table ID" = const(Database::Payments), "No." = field("No.");
            }
        }
    }

    actions
    {
        area(creation)
        {
            group("Payment Voucher")
            {
                Caption = 'Payment Voucher';
                Image = "Order";
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(56000),
                                              "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Approvals action.';

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin

                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;
                    ToolTip = 'Executes the Send A&pproval Request action.';

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.TestField(Status, Rec.Status::Open);//status must be open.
                        Rec.TestField("Created By", UserId); //control so that only the initiator of the document can send for approval

                        Rec.TestField("Salary Advance");
                        Rec.TestField(Purpose);
                        Rec.TestField("No of months deducted");
                        Rec.TestField("Recovery Start Month");
                        // Rec.TestField("Salary Advance Memo No");

                        // if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                        //     ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                        Rec.TestField("Created By", UserId); //control so that only the initiator of the document can send for approval
                        // ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }


                separator(Action30)
                {
                }
            }
            group(ActionGroup29)
            {
                Caption = 'Print';
                Image = Print;
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Print action.';

                    trigger OnAction()
                    begin
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57015, true, true, Rec)
                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Executes the Re&lease action.';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        Usersetup.Get(UserId);
                        Usersetup.TestField(Usersetup."Reopen Document", Usersetup."Reopen Document" = true);
                        ReopenPV.PerformManualReopen(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    ToolTip = 'Executes the Re&open action.';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        Usersetup.Get(UserId);
                        Usersetup.TestField(Usersetup."Reopen Document", Usersetup."Reopen Document" = true);
                        Rec.TestField("Reasons to Reopen");
                        ReopenPV.PerformManualReopen(Rec);
                    end;
                }
                separator(Action24)
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Payment Type" := Rec."Payment Type"::"Salary Advance";
        Rec."Document Type" := Rec."Document Type"::"Salary Advance";

        Rec.Date := TODAY;
        Rec."Created By" := USERID;
        Rec."Account Type" := Rec."Account Type"::Employee;

        Usersetup.RESET;
        Usersetup.SETRANGE("User ID", Rec."Created By");
        IF Usersetup.FINDSET THEN BEGIN

            Rec."Account No." := Usersetup."Employee No.";
            Rec."Account Name" := Usersetup."Employee Name";
        END;

        Employee.RESET;
        Employee.SETRANGE("No.", Rec."Account No.");
        IF Employee.FINDSET THEN BEGIN
            // Employee.CALCFIELDS("Job Title");
            //  Designation := Employee."Job Title";
            Rec."Date of Joining" := Employee."Employment Date";
            Rec."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
            Rec."Shortcut Dimension 2 Code" := Employee."Global Dimension 2 Code";
        END;
    end;

    var
        // Usersetup: Record 91;
        // Employee: Record "5200";
        // ApprovalsMgmt: Codeunit 1535;
        // OpenApprovalEntriesExist: Boolean;
        // ApprovalEntry: Record "454";
        // pvLines: Record "57006";
        // pvheader: Record "57000";
        // ReopenPV: Codeunit 57003;
        // DMSManagement: Codeunit 50009;
        // Payroll3: Codeunit 69002;

        Usersetup: Record "User Setup";
        Employee: Record Employee;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        ApprovalEntry: Record "Approval Entry";
        pvLines: Record "PV Lines";
        pvheader: Record payments;
        ReopenPV: Codeunit Payments;
}

