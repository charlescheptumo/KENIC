/// <summary>
/// Card page over the "Update Etims Documents" table for manually keying in eTIMS response data (CU invoice number, internal data, receipt signature, SCU ID, QR code) and pushing a credit note update to eTIMS via ETimsWebService.
/// </summary>
page 50729 "Update Etims Documents"
{
    ApplicationArea = Basic;
    Caption = 'Update Etims Documents';
    PageType = Card;
    SourceTable = "Update Etims Documents";

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

                field("CU Invoice Number"; Rec."CU Invoice Number")
                {
                    ToolTip = 'Specifies the value of the CU Invoice Number field.', Comment = '%';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.', Comment = '%';
                }
                field("Internal Data"; Rec."Internal Data")
                {
                    ToolTip = 'Specifies the value of the Internal Data field.', Comment = '%';
                }
                field("Invoice Number"; Rec."Invoice Number")
                {
                    ToolTip = 'Specifies the value of the Invoice Number field.', Comment = '%';
                }
                field(QRCodeUrl; Rec.QRCodeUrl)
                {
                    ToolTip = 'Specifies the value of the QRCodeUrl field.', Comment = '%';
                }
                field("Receipt Signature"; Rec."Receipt Signature")
                {
                    ToolTip = 'Specifies the value of the Receipt Signature field.', Comment = '%';
                }
                field("SCU ID"; Rec."SCU ID")
                {
                    ToolTip = 'Specifies the value of the SCU ID field.', Comment = '%';
                }
                field("Time"; Rec."Time")
                {
                    ToolTip = 'Specifies the value of the Time field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Update Credit Note")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                var
                    webservice: Codeunit ETimsWebService;
                begin
                    Message(webservice.updatecreditNote(Rec."No.", Rec."Internal Data", Rec."Receipt Signature", Rec."SCU ID", Rec."Invoice Number", Rec.QRCodeUrl, Rec.Date));
                end;
            }
        }
    }
}
