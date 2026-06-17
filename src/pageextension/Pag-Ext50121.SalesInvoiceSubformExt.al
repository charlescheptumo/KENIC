namespace KICD.KICD;

using Microsoft.Sales.Document;

pageextension 50121 "Sales Invoice Subform Ext." extends "Sales Invoice Subform"
{
    layout
    {
        addafter("Unit of Measure Code")
        {
            field("No. of People"; Rec."No. of People")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the No. of People field.';
            }
            field("No. of Days"; Rec."No. of Days")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the No. of Days field.';
            }
        }
    }
}
