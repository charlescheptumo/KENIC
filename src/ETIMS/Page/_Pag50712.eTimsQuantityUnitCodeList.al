/// <summary>
/// Read-only list of KRA eTIMS quantity unit codes (code, name, description) used as the reference data set for tagging item quantities.
/// </summary>
page 50712 "eTims-Quantity Unit Code List"
{
    ApplicationArea = Basic;
    Caption = 'eTims-Quantity Unit Code List';
    PageType = List;
    SourceTable = "eTims-Quantity Unit Code";
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
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
            }
        }
    }
}