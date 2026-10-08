/// <summary>
/// Editable list page over Sales Invoice Header showing the eTIMS response data (date, time, SCU ID, CU invoice number, internal data, receipt signature, QR code) recorded for each posted sales invoice submitted to eTIMS.
/// </summary>
page 50727 "etims Posted Sales Invoince"
{
    ApplicationArea = Basic;
    Caption = 'etims Posted Sales Invoince';
    PageType = List;
    SourceTable = "Sales Invoice Header";
    Editable = true;
    ModifyAllowed = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the record.';
                }
                field("Date"; Rec.EtimsDate)
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Time"; Rec.EtimsTime)
                {
                    ToolTip = 'Specifies the value of the Time field.';
                }
                field("SCU ID"; Rec."SCU ID")
                {
                    ToolTip = 'Specifies the value of the SCU ID field.';
                }
                field("CU Invoice Number"; Rec."CU Invoice Number")
                {
                    ToolTip = 'Specifies the value of the CU Invoice Number field.';
                }
                field("Internal Data"; Rec."Internal Data")
                {
                    ToolTip = 'Specifies the value of the Internal Data field.';
                }
                field("Receipt Signature"; Rec."Receipt Signature")
                {
                    ToolTip = 'Specifies the value of the Receipt Signature field.';
                }
                field("Invoice Number"; Rec."Invoice Number")
                {
                    ToolTip = 'Specifies the value of the Invoice Number field.';
                }
                field(QRCodeUrl; Rec.QRCodeUrl)
                {
                    ToolTip = 'Specifies the value of the QRCodeUrl field.';
                }
            }
        }
    }
}
