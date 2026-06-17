namespace KICD.KICD;
using Microsoft.Finance.GeneralLedger.Journal;
using Microsoft.Foundation.Company;
using Microsoft.Foundation.Navigate;
using Microsoft.Purchases.Payables;

page 50330 "Batch Check Voucher"
{
    ApplicationArea = All;
    Caption = 'Batch Check Voucher';
    PageType = Card;
    SourceTable = "Batch Check Voucher";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.', Comment = '%';
                }
                field("Pay Mode "; Rec."Pay Mode")
                {
                    ToolTip = 'Specifies the value of the Pay Mode field.', Comment = '%';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ToolTip = 'Specifies the value of the Paying Bank Account field.', Comment = '%';
                }
                field("Paying Bank Account Name"; Rec."Paying Bank Account Name")
                {
                    ToolTip = 'Specifies the value of the Paying Bank Account Name field.', Comment = '%';
                }
                field(Payee; Rec.Payee)
                {
                    ToolTip = 'Specifies the value of the Payee field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Physical Check No"; Rec."Physical Check No")
                {
                    ToolTip = 'Specifies the value of the Physical Check No. field.', Comment = '%';
                    ApplicationArea = all;
                }
                field("Check No"; Rec."Check No")
                {
                    ToolTip = 'Specifies the value of the Check No. field.', Comment = '%';
                    ApplicationArea = all;
                }
                field(Posted; Rec.Posted)
                {
                    ToolTip = 'Specifies the value of the Posted field.', Comment = '%';
                    Editable = false;
                }
                field("Check Printed"; Rec."Check Printed")
                {
                    ToolTip = 'Specifies the value of the Check Printed field.', Comment = '%';
                    Editable = Rec.Posted = false;
                }


            }

            part("Check Imprest Voucher Lines"; "Batch Check Lines")
            {
                ApplicationArea = All;
                Caption = 'Batch Imprest Voucher Lines';
                SubPageLink = "Document No" = field("No.");
                Editable = false;
            }
        }
    }
    actions
    {
        area(processing)
        {

            action(PostBatchCheck)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = Rec.Posted = false;
                ToolTip = 'Post the Batch Check Voucher.';

                trigger OnAction()
                begin
                    PaymentsPost.PostBatchCheck(Rec);
                    CurrPage.Update(false);
                end;
            }
            action(Navigate)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Find Entries';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Find all entries and documents related to this posted batch check voucher.';

                trigger OnAction()
                var
                    NavigatePage: Page Navigate;
                begin
                    Rec.TestField(Posted);
                    NavigatePage.SetDoc(Rec."Posting Date", Rec."No.");
                    NavigatePage.Run();
                end;
            }
            action(PreviewCheck)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'P&review Check';
                Image = ViewCheck;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Preview the check before printing it.';

                trigger OnAction()
                begin
                    if Rec."Pay Mode" = 'CHEQUE' then begin
                        GenJnLine.DeleteAll;
                        LineNo := 1000;
                        GenJnLine.Init;
                        if CMSetup.Get then
                            GenJnLine."Journal Template Name" := CMSetup."PV Journal Template";
                        GenJnLine."Journal Batch Name" := CMSetup."PV Journal Batch Name";
                        GenJnLine."Line No." := LineNo;
                        PVLines.SetRange("Document No", Rec."No.");
                        if PVLines.FindFirst() then begin
                            GenJnLine."Account Type" := GenJnLine."Account Type"::Vendor;
                            GenJnLine."Account No." := PVLines."Vendor No";
                            GenJnLine.Validate(GenJnLine."Account No.");
                            GenJnLine."Posting Date" := Rec."Posting Date";
                            GenJnLine."Document No." := Rec."No.";
                            GenJnLine."External Document No." := Rec."Cheque No";
                            GenJnLine."Payment Method Code" := Rec."Pay Mode";
                            GenJnLine.Validate("Currency Code");
                            GenJnLine.Amount := Rec.Amount;
                            // GenJnLine.Description := CopyStr((Rec."Payment Narration"), 50);
                            GenJnLine."Bal. Account Type" := GenJnLine."account type"::"Bank Account";
                            GenJnLine."Bal. Account No." := Rec."Paying Bank Account";
                            GenJnLine."Bank Payment Type" := GenJnLine."bank payment type"::"Computer Check";
                            GenJnLine.Validate("Currency Code");
                            GenJnLine.Validate(GenJnLine.Amount);
                            GenJnLine.Validate("Bal. Account No.");
                        end;
                        GenJnLine.Insert(true);
                        Page.Run(404, GenJnLine, Rec."No.");
                    end
                end;
            }
            action(PrintCheck)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Print Check';
                Image = PrintCheck;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Print check.';
                Enabled = (Rec."Pay Mode" = 'CHEQUE');

                trigger OnAction()
                var
                begin
                    Rec.TestField("Check Printed", false);
                    PaymentsPost.PrintBatchCheck(Rec);
                end;

            }
            action(CheckAnalysisReport)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Check Analysis Report';
                Image = Report;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'View the Check Analysis Report for this batch check voucher.';
                visible = false; // This will be enabled when the report is ready.

                trigger OnAction()
                var
                    CheckAnalysisReport: Report "Check Analysis Report";
                    VendorLedgerEntry: Record "Vendor Ledger Entry";
                begin
                    CheckAnalysisReport.SetChequeBatch(Rec."No.");
                    VendorLedgerEntry.SetRange("Document No.", Rec."No.");
                    VendorLedgerEntry.SetRange("Payment Method Code", 'CHEQUE');
                    CheckAnalysisReport.SetTableView(VendorLedgerEntry);
                    CheckAnalysisReport.Run();
                end;
            }

            action("Cheque Analysis Report")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cheque Analysis Report';
                Image = Report;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'View the Cheque Analysis Report for this batch check voucher.';

                trigger OnAction()
                var
                    MemberRec: record "Batch Check Voucher";
                    SchemeVarSetup: record "Company Information";
                begin
                    SchemeVarSetup.Get();
                    MemberRec.Reset();
                    MemberRec.SetRange("No.", Rec."No.");
                    Report.Run(Report::"Check Analysis Report", true, true, MemberRec);
                    //Report.Run(Report::"Vendor - Detail Trial Balance", true, true, MemberRec);
                end;
            }


        }

    }
    var
        GenJnLine: Record "Gen. Journal Line";
        PaymentsPost: Codeunit "Payments-Post";
        LineNo: Integer;
        CMSetup: Record "Cash Management Setup";
        PVLines: Record "Batch Check Lines";

}
