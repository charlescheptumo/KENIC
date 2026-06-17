namespace KICD.KICD;

using Microsoft.Sales.Document;

pageextension 50142 "sales invoice list ext" extends "Sales Invoice List"
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