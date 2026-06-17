pageextension 50146 DimensionsExt extends Dimensions
{
    layout
    {
        addbefore(Blocked)
        {
            field("Affects Budget"; Rec."Affects Budget")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Affects Budget field.';
            }
        }
    }



    var
        myInt: Integer;
}