pageextension 58172 "Board Meeting Card Ext" extends "Board Meeting Card"
{
    layout
    {
        addafter("Meeting group")
        {
            field("Convener No."; Rec."Convener No.")
            {
                ApplicationArea = All;
                Caption = 'Convener No.';
            }
        }
    }
}