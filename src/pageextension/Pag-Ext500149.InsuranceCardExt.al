/// <summary>
/// PageExtension Insurance Card Ext (ID 50043) extends Record Insurance Card.
/// </summary>
pageextension 50149 "Insurance Card Ext" extends "Insurance Card"
{
    layout
    {
        addafter(Blocked)
        {
            field("Insurance Details"; Rec."Insurance Details")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Insurance Details field.';
            }
        }
    }
}
