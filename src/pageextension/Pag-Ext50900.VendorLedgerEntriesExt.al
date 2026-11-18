namespace KICD.KICD;
using Microsoft.Purchases.Payables;
using Microsoft.Purchases.Setup;
using Microsoft.Foundation.NoSeries;
pageextension 50900 "Vendor Ledger Entries Ext" extends "Vendor Ledger Entries"

{
    layout
    {
        addbefore("Posting Date")
        {
            field(Selected; Rec.Selected)
            {
                ApplicationArea = all;

            }
        }
        modify("Vendor Name")
        {
            Visible = true;
        }
    }
    actions
    {
        addbefore("Show Document")
        {
            action(PayVendor)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Pay Vendor Invoices';
                Ellipsis = true;
                Image = VendorPayment;
                Scope = Repeater;
                ToolTip = 'Pay vendor invoices.';
                enabled = True;
                Promoted = true;

                trigger OnAction()
                var
                    vendLedRec: Record "Vendor Ledger Entry";
                    PVLines: Record "PV Lines";
                    Payments: Record Payments;
                    NoSeriesManagement: Codeunit "No. Series";
                    CashMgt: Record "Cash Management Setup";
                    PurchSetup: Record "Purchases & Payables Setup";
                    DocNo: Code[100];
                    LineNo: Integer;
                    appPV: Page "Approved Payment Vouchers";

                begin

                    //vendLedRec.CopyFilters(Rec);
                    vendLedRec.Reset;
                    vendLedRec.SetRange(vendLedRec.Selected, true);
                    vendLedRec.SetRange(vendLedRec.Open, true);
                    vendLedRec.SetRange(vendLedRec."Document Type", vendLedRec."Document Type"::Invoice);
                    if vendLedRec.FindSet then begin

                        repeat
                            Payments.Init();
                            Payments."No." := NoSeriesManagement.GetNextNo(CashMgt."PV Nos", WorkDate(), true);
                            Payments."Created By" := UserId;
                            Payments.Date := Today;
                            Payments."Posting Date" := Today;
                            Payments."Pay Mode" := 'BANK';
                            Payments."Paying Bank Account" := CashMgt.NCBA;
                            Payments."Payment Narration" := vendLedRec.Description;
                            Payments.Job := CashMgt."Current Budget";
                            payments.JobNo := CashMgt."Current Budget";
                            Payments.Status := payments.Status::Released;
                            Payments.Select := True;
                            Payments.Insert(true);

                            DocNo := Payments."No.";
                            LineNo := 10000;

                            PVLines.Init();
                            PVLines.No := DocNo;
                            PVLines."Line No" := LineNo;
                            PVLines.Description := vendLedRec.Description;
                            PVLines."Document Description" := vendLedRec.Description;
                            PVLines."Project No" := CashMgt."Current Budget";
                            //PVLines."Net Amount" := Payments."Total Net Amount";
                            PVLines.Insert();

                            PVLines.Reset();
                            PVLines.SetRange(PVLines.No, DocNo);
                            PVLines.SetRange(PVLines."Line No", LineNo);
                            if PVLines.FindSet then begin
                                PVLines."Account Type" := PVLines."Account Type"::Vendor;
                                PVLines."Account No" := vendLedRec."Vendor No.";
                                PVLines.Validate("Account No");
                                PVLines."Applies-to Doc. No." := vendLedRec."Document No.";
                                PVLines.Validate("Applies-to Doc. No.");
                                PVLines."Applies to Doc. No" := vendLedRec."Document No.";
                                PVLines.Validate("Applies to Doc. No");
                                PVLines.Modify();
                            end;

                            LineNo += 10000;                            

                        until vendLedRec.next = 0;
                        
                        vendLedRec.ModifyAll(vendLedRec.Selected, false);
                        appPV.CreateBatchEFT();

                    end else begin
                        Error('No Payment Voucher has been selected.');

                    end;

                end;
            }

        }
    }
    var

}
