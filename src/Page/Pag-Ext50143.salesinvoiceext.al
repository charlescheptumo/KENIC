namespace KICD.KICD;

using Microsoft.Sales.Document;

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
}