/// <summary>
/// Read-only list of KRA eTIMS product type codes (code, name, description) used as the reference data set for classifying items.
/// </summary>
page 50714 "eTims-Product Type List"
{
    ApplicationArea = Basic;
    Caption = 'eTims-Product Type List';
    PageType = List;
    SourceTable = "eTims-Product Type";
    UsageCategory = Administration;

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
                field("Code name"; Rec."Code name")
                {
                    ToolTip = 'Specifies the value of the Code name field.';
                    Caption = 'Name';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
