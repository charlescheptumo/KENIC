/// <summary>
/// List page over eTimsPushCredit showing queued eTIMS credit note/invoice JSON payloads, with actions to manually push a credit note or push a sales invoice update to eTIMS via ETimsWebService.
/// </summary>
page 50726 "eTimsPushCredit"
{
    ApplicationArea = Basic;
    Caption = 'eTimsPushCredit';
    PageType = List;
    SourceTable = eTimsPushCredit;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Json; Rec.Json)
                {
                    ToolTip = 'Specifies the value of the Json field.';
                    MultiLine = true;
                }
                field("CU Invoice Number"; Rec."CU Invoice Number")
                {
                    ToolTip = 'Specifies the value of the CU Invoice Number field.';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Internal Data"; Rec."Internal Data")
                {
                    ToolTip = 'Specifies the value of the Internal Data field.';
                }
                field("Invoice Number"; Rec."Invoice Number")
                {
                    ToolTip = 'Specifies the value of the Invoice Number field.';
                }
                field(QRCodeUrl; Rec.QRCodeUrl)
                {
                    ToolTip = 'Specifies the value of the QRCodeUrl field.';
                }
                field("SCU ID"; Rec."SCU ID")
                {
                    ToolTip = 'Specifies the value of the SCU ID field.';
                }
                field("Posted to Etims"; Rec."Posted to Etims")
                {
                    ToolTip = 'Specifies the value of the Posted to Etims field.';
                }
                field("Receipt Signature"; Rec."Receipt Signature")
                {
                    ToolTip = 'Specifies the value of the Receipt Signature field.';
                }
                field("Time"; Rec."Time")
                {
                    ToolTip = 'Specifies the value of the Time field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = Basic;
                Caption = 'Push Credit Note';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = PurchaseCreditMemo;
                trigger OnAction()
                var
                    webservice: Codeunit ETimsWebService;
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    webservice.pushCreditManually(Rec.Json);
                end;
            }

            action(PushInvoice)
            {
                ApplicationArea = Basic;
                Caption = 'Push Sales Invoice';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = PurchaseCreditMemo;
                trigger OnAction()
                var
                    webservice: Codeunit ETimsWebService;
                    Msg: Text;
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    Msg := webservice.updateInvoiceReport(Rec.Code, Rec."Internal Data", Rec."Receipt Signature", Rec."SCU ID", Rec."CU Invoice Number", Rec.QRCodeUrl, Rec.Date);
                    if Msg = 'Success' then
                        Message('Invoice updated successfully')
                    else
                        Message('Could not update invoice, please try again later');
                end;
            }
        }
    }
}
