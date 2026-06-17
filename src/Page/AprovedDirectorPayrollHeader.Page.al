#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69103 "AprovedDirector Payroll Header"
{
    ApplicationArea = Basic;
    Caption = 'Approved Directors Payroll Header';
    PageType = Card;
    SourceTable = "Payroll Header";
    SourceTableView = where(
                            Status = filter(Released),
                            "Payroll Type" = filter(Director));
    UsageCategory = Documents;

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
                field("Meeting Details"; Rec."Meeting Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Details field.';
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
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
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
                    Editable = false;
                    Visible = true;
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
            part(Control14; "ApprovedDirector Payroll Lines")
            {
                SubPageLink = "Payroll Header" = field("No.");
            }
        }
        area(factboxes)
        {
            part("Attached Documents1"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(69030), "No." =
                FIELD("No.");
            }
            systempart(Control1000000017; Notes)
            {
            }
            systempart(Control1000000018; MyNotes)
            {
            }
            systempart(Control1000000019; Links)
            {
            }

        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup47)
            {
                action("Run Payroll")
                {
                    ApplicationArea = Basic;
                    Image = Recalculate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Run Payroll action.';

                    trigger OnAction()
                    var
                        emp: Record Employee;
                    begin
                        //CurrPage.SETSELECTIONFILTER(FORMAT("Payroll Period"));
                        //REPORT.RUNMODAL(69004,TRUE,FALSE,REC);


                        emp.SetFilter(emp."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(69004, true, true, emp);
                        Report.Run(69007, true, true, emp)

                        /*
                        Assignmat.RESET;
                        Assignmat.SETRANGE(Assignmat.Type,Assignmat.Type::Payment);
                        Assignmat.SETRANGE(Assignmat."Payroll Period","Payroll Period");
                        IF Assignmat.FIND('-') THEN BEGIN
                         REPEAT
                           LineNo:=LineNo+1000;
                           PayrollLines."Line No":=LineNo;
                           PayrollLines."Payroll Header":="No.";
                           PayrollLines."Payroll Group":=Assignmat."Posting Group Filter";
                           PayrollLines."Annuitant Name":=Assignmat."First Name"+' '+Assignmat."Last Name"+' '+Assignmat."Middle Name";
                           //PayrollLines."Basic Arrears":=Assignmat."Basic Pay Arrears";
                           PayrollLines."Basic Pension":=Assignmat."Basic Pay";
                           PayrollLines."Gross Pay":=Assignmat.Amount;
                           PayrollLines.Netpay:=Assignmat.Amount;
                           PayrollLines.Wtax:=Assignmat.Amount;
                           PayrollLines."Annuitant No":=Assignmat."Employee No";
                           PayrollLines."Payroll Period":="Payroll Period";
                           PayrollLines.INSERT;
                         UNTIL Assignmat.NEXT=0;
                        END;
                        */

                    end;
                }
            }
            group(Process)
            {
                Caption = 'Process';
                Image = Print;
                action("Post Payroll")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post to Payroll Jounal';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Post to Payroll Jounal action.';

                    trigger OnAction()
                    begin
                        PayPeriod.Reset;
                        PayPeriod.SetFilter(PayPeriod."Starting Date", Format(Rec."Payroll Period"));

                        Vendor.Reset;
                        Vendor.SetFilter(Vendor."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(Report::"Transfer Director to Journal", true, true, Vendor); //New report to transfer individual lines

                        //REPORT.RUN(89034,TRUE,TRUE,Vendor); - Old report for posting block figures
                    end;
                }
                action("Create Voucher")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Voucher';
                    Image = PostedOrder;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Create Voucher action.';

                    trigger OnAction()
                    var
                        txtConfirm: label 'Do you wish to create a payment voucher?';
                    begin
                        if Confirm(txtConfirm, true) = false then exit;
                        PayrollLines.Reset();
                        PayrollLines.SetRange(PayrollLines."Payroll Header", Rec."No.");
                        if PayrollLines.FindSet(false, false) then
                            repeat
                                Rec.CalcFields("Net Pay");
                                PVHeader.Init();
                                PVHeader."Payment Type" := PVHeader."payment type"::"Payment Voucher";
                                PVHeader."No." := '';
                                PVHeader."Pay Mode" := 'EFT';
                                PVHeader."Cheque Date" := Today();
                                PVHeader."Created By" := UserId;
                                PVHeader.Date := Today;
                                PVHeader."Dimension Set ID" := Rec."Dimension Set ID";
                                PVHeader.Validate("Dimension Set ID");
                                //PVHeader."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                                //PVHeader.VALIDATE("Shortcut Dimension 1 Code");
                                //PVHeader."Shortcut Dimension 2 Code":="Global Dimension 2 Code";
                                //PVHeader.VALIDATE("Shortcut Dimension 2 Code");
                                //PVHeader."Shortcut Dimension 3 Code":="Shortcut Dimension 1 Code";
                                //PVHeader.VALIDATE("Shortcut Dimension 3 Code");
                                PVHeader."Payment Narration" := Rec."Meeting Details";
                                PVHeader.Status := PVHeader.Status::Released; //Added
                                PVHeader.Insert(true);



                                PVLines.Init();
                                PVLines.No := PVHeader."No.";
                                PVLines.Type := 'VENDOR N';
                                PVLines.Validate(Type);
                                PVLines."Account Type" := PVLines."account type"::Vendor;
                                PVLines.Validate("Account Type");
                                PVLines."Account No" := PayrollLines."Personal No.";
                                PVLines.Validate("Account No");
                                PVLines.Amount := PayrollLines."Gross Pay";
                                PVLines.Validate(Amount);
                                PVLines.Validate("Net Amount");
                                PVLines.Description := Rec."Meeting Details";
                                ;
                                PVLines."PAYE Amount" := Abs(PayrollLines."Total Deduction");
                                PVLines.Validate("PAYE Amount");
                                PVLines."PAYE Code" := 'PAYE';
                                PVLines.Validate("Net Amount");
                                PVLines."Applies to Doc. No" := Format(Rec."Payroll Period") + '-DIR';
                                PVLines.Validate("Applies to Doc. No");
                                PVLines.Insert();


                            until PayrollLines.Next = 0;


                        if Confirm('Vocuher [ %1 ] has been created and released. Do you wish to open it now?', true, PVHeader."No.") = true then begin
                            PVHeader2.Reset();
                            PVHeader2.Get(PVHeader."No.");
                            Page.Run(Page::"Approved Payment Voucher", PVHeader2);
                        end;


                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Date Created" := Today;
                        Rec."Time Posted" := Time;
                        Rec.Modify;
                    end;
                }
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the &Print action.';

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);


                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(69001, true, true, Rec)
                    end;
                }
                action(AttachDocuments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = true;
                    ToolTip = 'Executes the Attach Document action.';

                    trigger OnAction()
                    begin
                        DMSManagement.UploadPaymentsDocuments(Rec."No.", 'Director Payroll Header', Rec.RecordId, Rec."Shortcut Dimension 1 Code");
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Approvals action.';

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalMgt.OpenApprovalEntriesPage(rec.RecordId);
                    end;
                }
                separator(Action39)
                {
                }
                // action("Payroll Reconciliation Report")
                // {
                //     ApplicationArea = Basic;
                //     Image = "Report";
                //     Promoted = true;
                //     PromotedCategory = "Report";
                //     RunObject = Report 69075;
                // }
                // action("Master Roll Report")
                // {
                //     ApplicationArea = Basic;
                //     Image = "Report";
                //     Promoted = true;
                //     PromotedCategory = "Report";
                //     RunObject = Report "Director Master Roll Report";
                // }

                action("Re-Open")
                {
                    ApplicationArea = Basic;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Re-Open action.';

                    trigger OnAction()
                    begin
                        //OpenDoc.ReopenPayroll(Rec)
                    end;
                }
            }
            group(ActionGroup30)
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
                action(Action27)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "No." = field("No.");
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
                Visible = false;
                // action("Payroll Cost Analysis")
                // {
                //     ApplicationArea = Basic;
                //     Caption = ' Payroll Cost Analysis';
                //     Image = "Report";
                //     RunObject = Report "Payroll Cost Analysis";

                //     trigger OnAction()
                //     begin
                //         emp.SetFilter(emp."Pay Period Filter",Format("Payroll Period"));
                //         Report.Run(69055,true,true,emp)
                //     end;
                // }
                action("Zero Earnings Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Zero Earnings Report';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Zero Earnings Report";
                    ToolTip = 'Executes the Zero Earnings Report action.';
                }
                action("Zero Deductions Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Zero Deductions Report';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Zero Deductions Report";
                    ToolTip = 'Executes the Zero Deductions Report action.';
                }
                action("Employees Joining Payroll")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employees Joining Payroll';
                    Image = "Report";
                    Promoted = false;
                    ToolTip = 'Executes the Employees Joining Payroll action.';
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    //   RunObject = Report "Employees Joining Payroll";
                }
                action("Employees Leaving Payroll")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employees Leaving Payroll';
                    Image = "Report";
                    Promoted = false;
                    ToolTip = 'Executes the Employees Leaving Payroll action.';
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    //  RunObject = Report "Employees Leaving Payroll";
                }
                action("Master Roll")
                {
                    ApplicationArea = Basic;
                    Caption = 'Master Roll';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Employee Master Roll";
                    ToolTip = 'Executes the Master Roll action.';
                }
                action("Payroll Reconciliation Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Reconciliation Summary';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Payroll Reconciliation Summary";
                    ToolTip = 'Executes the Payroll Reconciliation Summary action.';
                }
                action("Payroll Reconciliation Earning Detailed")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Reconciliation Earning Detailed';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Payroll Reconciliation Earnin";
                    ToolTip = 'Executes the Payroll Reconciliation Earning Detailed action.';
                }
                action("<Report Payroll Reconciliation D")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Reconciliation Deduction Detailed';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Payroll Reconciliation Deduc.";
                    ToolTip = 'Executes the Payroll Reconciliation Deduction Detailed action.';
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if Rec.Status = Rec.Status::Released then
            CurrPage.Editable := false
    end;

    trigger OnAfterGetRecord()
    begin
        if Rec.Status = Rec.Status::Released then
            CurrPage.Editable := false
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payroll Type" := Rec."payroll type"::Director;
    end;

    trigger OnOpenPage()
    begin
        if Rec.Status = Rec.Status::Released then
            CurrPage.Editable := false
    end;

    var
        PVHeader: Record payments;
        PVLines: Record "PV Lines";
        emp: Record Employee;
        Assignmat: Record "Assignment Matrix-X";
        PayrollLinesS: Record "Payroll Pay Mode";
        LineNo: Integer;
        //[InDataSet]
        OpenApprovalEntriesExist: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Navigate: Page Navigate;
        Post: Boolean;
        GenLedgerSetup: Record "General Ledger Setup";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Sclaims,"Imprest Memo","Payment Voucher","Petty Cash"," Imprest","Imprest Surrender",Payroll,"Store Requisition","Purchase Requisition","Leave Application","Bank Transfer","Transport Requisition";
        PayPeriod: Record "Payroll PeriodX";
        DocNumber: Text;
        GLEntry: Record "G/L Entry";
        Vendor: Record Vendor;
        DMSManagement: Codeunit "DMS Management";
        DirectorPayrollPeriod: Record "Director Payroll Period";
        GenJnLine: Record "Gen. Journal Line";
        HRSetup: Record "Human Resources Setup";
        JnlTemp: Record "Gen. Journal Batch";
        PayrollLines: Record "Payroll Lines";
        PVHeader2: Record payments;
        PayrollHeader: Record "Payroll Header";
}

#pragma implicitwith restore

