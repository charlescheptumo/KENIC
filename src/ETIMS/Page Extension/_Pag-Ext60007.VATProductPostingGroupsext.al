pageextension 60007 "VAT Product Posting Groups ext" extends "VAT Product Posting Groups"
{
    layout
    {
        addafter(Description)
        {
            field("Tax Type Code"; Rec."Tax Type Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Tax Type Code field.';
            }
        }
    }
}
