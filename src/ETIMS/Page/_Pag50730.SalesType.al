/// <summary>
/// Simple setup list page for maintaining "Sales Type Code" records used to classify sales types for eTIMS reporting.
/// </summary>
page 50730 "Sales Type"
{
    ApplicationArea = Basic;
    Caption = 'Sales Type';
    PageType = List;
    SourceTable = "Sales Type Code";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
