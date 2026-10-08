/// <summary>
/// Read-only list of KRA eTIMS packaging unit codes (code, name, description) used as the reference data set for tagging item packaging.
/// </summary>
page 50713 "eTims-Packaging Unit List"
{
    ApplicationArea = Basic;
    Caption = 'eTims-Packaging Unit List';
    PageType = List;
    SourceTable = "eTims-Packaging Unit";
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
                field("Code Name"; Rec."Code Name")
                {
                    ToolTip = 'Specifies the value of the Code Name field.';
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
