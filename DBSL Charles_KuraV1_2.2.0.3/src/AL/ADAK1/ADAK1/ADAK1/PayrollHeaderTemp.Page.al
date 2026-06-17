#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69151 "Payroll Header Temp"
{
    PageType = Card;
    SourceTable = "Payroll HeaderT";
    SourceTableView = where("Account Type" = const(Casuals),
                            Status = filter(<> Released));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field("Gross Pay"; Rec."Gross Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gross Pay field.';
                }
                field("Net Pay"; Rec."Net Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Pay field.';
                }
                field("Total Deductions"; Rec."Total Deductions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Deductions field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Time Created field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Time Posted field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }

        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup16)
            {
                action("Insert SV Lines")
                {
                    ApplicationArea = Basic;
                    Image = Recalculate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Insert SV Lines action.';

                    trigger OnAction()
                    var
                        emp: Record Employee;
                    begin
                        EmpT.SetFilter(EmpT."Pay Period Filter", Format(Rec."Payroll Period"));
                        //REPORT.RUN(69400,TRUE,TRUE,EmpT);

                        PayrollHeaderT.SetRange(PayrollHeaderT."No.", Rec."No.");
                        Report.Run(69406, true, true, PayrollHeaderT)
                    end;
                }
                action("Master Roll")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Master Roll action.';

                    trigger OnAction()
                    begin
                        EmpT.SetFilter(EmpT."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(69402, true, true, EmpT)
                    end;
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;
                    ToolTip = 'Executes the &Print action.';

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);


                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(69001, true, true, Rec)
                    end;
                }
            }
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
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Send A&pproval Request action.';

                    trigger OnAction()
                    begin
                        //MESSAGE('%1',ApprovalsMgmt.CheckTSalaryApprovalsWorkflowEnabled(Rec));
                        // if ApprovalsMgmt.CheckTSalaryApprovalsWorkflowEnabled(Rec) then
                        //   ApprovalsMgmt.OnSendTSalaryForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';

                    trigger OnAction()
                    begin
                        // ApprovalsMgmt.OnCancelTSalaryApprovalRequest(Rec);
                    end;
                }
                separator(Action29)
                {
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Approvals action.';

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        //  ApprovalEntries.Setfilters(DATABASE::"Payroll HeaderT",19,"No.");
                        //  

                        // ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                    end;
                }
                action(Release)
                {
                    ApplicationArea = Basic;
                    Image = Check;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Release action.';

                    trigger OnAction()
                    begin
                        //OpenDoc.ReopenPayroll(Rec)
                        Rec.Status := Rec.Status::Released;
                        Rec.Modify;
                        CurrPage.Close;
                    end;
                }
                action("Re-Open")
                {
                    ApplicationArea = Basic;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Re-Open action.';

                    trigger OnAction()
                    begin
                        //OpenDoc.ReopenPayroll(Rec)
                    end;
                }
            }
            group(ActionGroup26)
            {
                action("&Navigate")
                {
                    ApplicationArea = Basic;
                    Caption = '&Navigate';
                    Image = Navigate;
                    Promoted = true;
                    PromotedCategory = Process;
                    Scope = Repeater;
                    Visible = false;
                    ToolTip = 'Executes the &Navigate action.';

                    trigger OnAction()
                    begin
                        Navigate.SetDoc(Rec."Payroll Period", Rec."No.");
                        Navigate.Run;
                    end;
                }
                action("General Ledger Entries")
                {
                    ApplicationArea = Basic;
                    Image = LedgerBook;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "General Ledger Entries";
                    RunPageLink = "Document No." = field("No."),
                                  "Posting Date" = field("Payroll Period");
                    Visible = false;
                    ToolTip = 'Executes the General Ledger Entries action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    // RunObject = Page "Default Dimensions";
                    //  RunPageLink = "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    Visible = false;
                    ToolTip = 'Executes the Dimensions action.';
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    ToolTip = 'Executes the Co&mments action.';
                }
            }
            group("Payroll Reconcilliation Reports")
            {
                Caption = 'Payroll Reconcilliation Reports';
                action("Master Roll Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Master Roll Report';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Master Roll Report action.';
                    // RunObject = Report "Master Roll Report Temporary E";

                    trigger OnAction()
                    begin
                        EmpT.SetFilter(EmpT."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(69405, true, true, EmpT)
                    end;
                }
                action("Payroll Reconciliation Summary")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Payroll Reconciliation Summary action.';
                    // RunObject = Report "Payroll Reconciliation SummarT";

                    trigger OnAction()
                    begin
                        EmpT.SetFilter(EmpT."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(69405, true, true, EmpT)
                    end;
                }
                action("Payroll Reconciliation Detailed")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Payroll Reconciliation Detailed action.';
                    // RunObject = Report "Payroll Reconciliation DetailT";

                    trigger OnAction()
                    begin
                        EmpT.SetFilter(EmpT."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(69405, true, true, EmpT)
                    end;
                }
                action("Monthly PAYE Report")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Monthly PAYE Report action.';
                    // RunObject = Report "Monthly PAYE Report Export";

                    trigger OnAction()
                    begin
                        EmpT.SetFilter(EmpT."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(69405, true, true, EmpT)
                    end;
                }
                action("NHIF Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'NHIF Report';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the NHIF Report action.';
                    // RunObject = Report "NHIF T";

                    trigger OnAction()
                    begin
                        EmpT.SetFilter(EmpT."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(69405, true, true, EmpT)
                    end;
                }
                action("NSSF Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'NSSF Report';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the NSSF Report action.';
                    // RunObject = Report "NSSF Report T";

                    trigger OnAction()
                    begin
                        EmpT.SetFilter(EmpT."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(69405, true, true, EmpT)
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if Rec.Status = Rec.Status::Released then
            CurrPage.Editable := false;
        Rec."Account Type" := Rec."account type"::Casuals;
    end;

    trigger OnAfterGetRecord()
    begin
        if Rec.Status = Rec.Status::Released then
            CurrPage.Editable := false;
        Rec."Account Type" := Rec."account type"::Casuals;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Responsibility Center" := UserSetup."Responsibility Center";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Account Type" := Rec."account type"::Casuals;
        Rec."Responsibility Center" := UserSetup."Responsibility Center";
    end;

    trigger OnOpenPage()
    begin
        if Rec.Status = Rec.Status::Released then
            CurrPage.Editable := false;
        Rec."Account Type" := Rec."account type"::Casuals;
        UserSetup.Get(UserId);
        Rec.SetRange("Responsibility Center", UserSetup."Responsibility Center");
    end;

    var
        emp: Record "Temporary Employee";
        Assignmat: Record "Assignment Matrix-X Temp-E";
        PayrollLines: Record "Payroll Pay Mode";
        LineNo: Integer;
       // [InDataSet]
        OpenApprovalEntriesExist: Boolean;
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Navigate: Page Navigate;
        Post: Boolean;
        GenLedgerSetup: Record "General Ledger Setup";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Sclaims,"Imprest Memo","Payment Voucher","Petty Cash"," Imprest","Imprest Surrender",Payroll,"Store Requisition","Purchase Requisition","Leave Application","Bank Transfer","Transport Requisition";
        PayPeriod: Record "Payroll PeriodXT";
        DocNumber: Text;
        GLEntry: Record "G/L Entry";
        EmpT: Record "Temporary Employee";
        PayrollHeaderT: Record "Payroll HeaderT";
        UserSetup: Record "User Setup";
}

