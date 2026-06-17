namespace KICD.KICD;

using Microsoft.Purchases.Document;

pageextension 50052 "Purch. Order Subform Ext." extends "Purchase Order Subform"
{
    layout
    {
        addafter(Description)
        {
            field("Item Category Code"; Rec."Item Category Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Item Category Code field.';
            }
            field("Item Category"; Rec."Item Category")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Item Category field.';
            }
        }
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
