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
 
                    if Rec.Status <> Rec.Status::Released then begin
                        Error('The document must be fully approved before sending to registry');
                    end else begin
 
                        Rec.TestField("Applies-to Doc. No.");
                        salesHeader.Reset();
                        salesHeader.SetRange(salesHeader."No.", Rec."Applies-to Doc. No.");
                        if salesHeader.FindFirst then begin
 
                            if Rec."Posting Date" - salesHeader."Posting Date" > 30 then begin
 
                                customFunction.SyncFromSalesCrMemo(Rec);
                            end else begin
 
                                Error('The original invoice number %1 was raised more than 30 days ago. You cannot raise a credit memo for it', salesHeader."No.");
                            end;
 
 
 
                        end;
                    end;
 
                end;
            }
        }
    }
}