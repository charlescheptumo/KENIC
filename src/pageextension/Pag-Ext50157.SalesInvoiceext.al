 
pageextension 50143 "sales invoice ext" extends "Sales Invoice"
{
    layout
    {
        addafter("Your Reference")
        {
            field("LPO/LSO"; Rec."LPO/LSO")
            {
                ApplicationArea = All;
               
                ToolTip = 'Specifies the LPO/LSO number for this sales invoice.';
            }
        }
    }
 
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
                begin
                    if Rec.Status <> Rec.Status::Released then begin
                        Error('The document must be fully approved before sending to registry');
                    end else begin
                        customFunction.SyncFromSalesInvoice(Rec);
 
                    end;
                end;
            }
        }
    }
}