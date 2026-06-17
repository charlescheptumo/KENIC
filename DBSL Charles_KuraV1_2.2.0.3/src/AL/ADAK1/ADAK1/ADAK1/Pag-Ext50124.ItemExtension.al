namespace KICD.KICD;

using Microsoft.Inventory.Item;

pageextension 50124 "Item Extension" extends "Item Card"
{
    layout
    {
        addafter("Item Brand Code")
        {
            field("Location Code"; Rec."Location Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the No. of People field.';
            }
        }
    }
}
