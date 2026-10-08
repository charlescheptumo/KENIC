/// <summary>
/// List/setup page for maintaining eTims-Stock In Out codes (code, name, description) used to classify stock movement types for KRA eTIMS stock reporting.
/// </summary>
page 50722 "eTims-Stock In Out List"
{
    ApplicationArea = Basic;
    Caption = 'eTims-Stock In Out List';
    PageType = List;
    SourceTable = "eTims-Stock In Out";
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
                }
                field("Code Description"; Rec."Code Description")
                {
                    ToolTip = 'Specifies the value of the Code Description field.';
                }
            }
        }
    }
}
