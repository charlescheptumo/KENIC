namespace KICD.KICD;

using Microsoft.Sales.Document;

pageextension 50070 "Sales Quote Subform Ext." extends "Sales Quote Subform"
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
