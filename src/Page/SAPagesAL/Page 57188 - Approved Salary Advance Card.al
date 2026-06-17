#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
page 57188 "Approved Salary Advance Card"
{
    DeleteAllowed = false;
    InsertAllowed = false;
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
                    Editable = false;
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Date of Joining"; Rec."Date of Joining")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date of Joining field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Unit Name';
                    ToolTip = 'Specifies the value of the Unit Name field.';
                }
                field("Salary Last Drawn"; Rec."Salary Last Drawn")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Basic Pay';
                    ToolTip = 'Specifies the value of the Basic Pay field.';
                }
                field("Salary Advance"; Rec."Salary Advance")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Salary Advance field.';
                }
                field("No of months deducted"; Rec."No of months deducted")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No of months deducted field.';
                }
                field("Monthly Installment"; Rec."Monthly Installment")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Monthly Installment field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Amount Pending"; Rec."Amount Pending")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Amount Pending field.';
                }
                field("Recovery Start Month"; Rec."Recovery Start Month")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Recovery Start Month field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Amount Approved"; Rec."Amount Approved")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Approved field.';
                }
                field("Effective from Month"; Rec."Effective from Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective from Month field.';
                }
                field("Reasons to Reopen"; Rec."Reasons to Reopen")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reasons to Reopen field.';
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
            action(Print)
            {
                Image = PrintForm;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.SETRANGE("No.", Rec."No.");
                    REPORT.RUN(57015, TRUE, TRUE, Rec)
                end;
            }
            action(Post)
            {
                Caption = 'P&ost';
                Image = PostOrder;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ShortCutKey = 'F9';
                Visible = false;
                ToolTip = 'Executes the P&ost action.';

                trigger OnAction()
                begin

                    PaymentsPost.PostSalaryAdvance(Rec);
                end;
            }
            action("Create Payment Voucher")
            {
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Create Payment Voucher action.';

                trigger OnAction()
                begin
                    CreatePaymentVoucher(Rec);
                end;
            }
            action("Re-Open")
            {
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Re-Open action.';

                trigger OnAction()
                begin
                    Rec.TESTFIELD("Reasons to Reopen");
                    Rec.Status := Rec.Status::Open;
                    Rec.MODIFY();
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
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
            //Employee.CALCFIELDS("Job Title");
            //  Designation := Employee."Job Title";
            Rec."Date of Joining" := Employee."Employment Date";
            Rec."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
            Rec."Shortcut Dimension 2 Code" := Employee."Global Dimension 2 Code";
            Rec.VALIDATE("Shortcut Dimension 2 Code");
            Rec.VALIDATE("Shortcut Dimension 1 Code");

        END;
    end;

    var
        Usersetup: Record 91;
        Employee: Record 5200;
        PaymentsPost: Codeunit 57000;
        FileNo: Code[50];
        PVNo: Code[50];
        NoSeriesMgt: Codeunit "No. Series";
        CashMgt: Record 57004;
        text027: Label 'Approved Salary Advance amount cannot be 0. Please confirm the amount and try again.';

    local procedure CreatePaymentVoucher(AdvanceNo: Record 57000)
    var
        Payments: Record 57000;
        PVLines: Record 57006;
        TEXT001: Label 'The payment document for the advance request is already created,the No. is :- %1';
    begin
        IF Rec."Amount Approved" = 0 THEN
            ERROR(text027);
        Rec.TESTFIELD("Posting Date");

        Payments.RESET;
        Payments.SETRANGE("Applies- To Doc No.", AdvanceNo."No.");
        IF NOT Payments.FINDSET THEN BEGIN
            Payments.INIT;
            Payments."No." := '';
            Payments."File No." := '';
            PVNo := '';
            // FileNo:='';
            CashMgt.GET();
            CashMgt.TESTFIELD("PV Nos");
            CashMgt.TESTFIELD("PV File Numbering");
            IF Payments."No." = '' THEN
                Payments."No." := NoSeriesMgt.GetNextNo(CashMgt."PV Nos", WorkDate(), TRUE);
            // NoSeriesMgt.InitSeries(CashMgt."PV Nos", Payments."No. Series", 0D, PVNo, Payments."No. Series");
            /* IF Payments."File No."='' THEN
                NoSeriesMgt.InitSeries(CashMgt."PV File Numbering",Payments."File No. Series",0D,FileNo,Payments."File No. Series");*/
            Payments."No." := PVNo;
            //Payments."File No.":=FileNo;
            Payments."Payment Type" := Payments."Payment Type"::"Payment Voucher";
            Payments."Document Type" := Payments."Document Type"::"Payment Voucher";
            Payments."Payment Narration" := AdvanceNo.Purpose;
            Payments."Shortcut Dimension 1 Code" := AdvanceNo."Shortcut Dimension 1 Code";
            Payments."Shortcut Dimension 2 Code" := AdvanceNo."Shortcut Dimension 2 Code";
            Payments."Shortcut Dimension 3 Code" := AdvanceNo."Shortcut Dimension 3 Code";
            Payments."Applies- To Doc No." := AdvanceNo."No.";
            Payments.Date := AdvanceNo.Date;
            Payments."Created By" := USERID;
            Payments.INSERT;
            PVLines.INIT;
            PVLines.No := Payments."No.";
            PVLines."Account Type" := PVLines."Account Type"::Employee;
            PVLines."Account No" := AdvanceNo."Account No.";
            PVLines.VALIDATE("Account No");
            PVLines.Amount := AdvanceNo."Salary Advance";
            PVLines."Net Amount" := PVLines.Amount;
            PVLines."Applies to Doc. No" := AdvanceNo."No.";
            PVLines."S/Advance No" := AdvanceNo."No.";
            PVLines.INSERT;
            PAGE.RUN(57001, Rec, Payments."No.");
            /*AdvanceNo.Posted:=TRUE;
            AdvanceNo."Posted By":=USERID;
            AdvanceNo."Posted Date":=TODAY;
            AdvanceNo.MODIFY(TRUE);*/

        END ELSE
            ERROR(TEXT001, Payments."No.");

    end;
}

