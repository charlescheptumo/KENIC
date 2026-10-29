namespace KENICmain.KENICmain;

using Microsoft.Sales.Document;
using Microsoft.Sales.History;

pageextension 50156 "Sales Credit Memo Ext" extends "Sales Credit Memo"
{
    actions
    {
        addlast(Processing)
        {
            action(sendToRegistry)
            {
                Caption = 'Send to Registry';
                ApplicationArea = All;
                Image = PostSendTo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = false;

                trigger OnAction()
                var
                    customFunction: Codeunit "Custom Function";
                    salesHeader: Record "Sales Invoice Header";
                begin

                    //if Rec.Status <> Rec.Status::Released then begin
                    //     Error('The document must be fully approved before sending to registry');
                    // end else begin

                    Rec.TestField("Applies-to Doc. No.");
                    salesHeader.Reset();
                    salesHeader.SetRange(salesHeader."No.", Rec."Applies-to Doc. No.");
                    if salesHeader.FindFirst then begin

                        //if DT2Date(Rec."Created Date Time") - salesHeader."Posting Date" < 30 then begin
                        if Today - salesHeader."Posting Date" < 30 then begin

                            customFunction.SyncFromSalesCrMemo(Rec);
                        end else begin

                            Error('The original invoice number %1 was raised on date %2. You can only send credit memos raised within 30 days of the invoice date', salesHeader."No.", salesHeader."Posting Date");
                        end;

                    end;
                    // end;

                end;
            }
        }
    }
}