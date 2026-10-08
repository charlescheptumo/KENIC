/// <summary>
/// Read-only list of KRA eTIMS item classification codes (class code/level/name, taxation type, usage flags), used as the reference data set for classifying items.
/// </summary>
page 50719 "eTims-Item Class List"
{
    ApplicationArea = Basic;
    Caption = 'eTims-Item Class List';
    PageType = List;
    SourceTable = "eTims-Item Class";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Frequently Used"; Rec."Frequently Used")
                {
                    ToolTip = 'Specifies the value of the Frequently Used field.';
                }
                field("In Use"; Rec."In Use")
                {
                    ToolTip = 'Specifies the value of the In Use field.';
                }
                field("Item Class Code"; Rec."Item Class Code")
                {
                    ToolTip = 'Specifies the value of the Item Class Code field.';
                }
                field("Item Class Level"; Rec."Item Class Level")
                {
                    ToolTip = 'Specifies the value of the Item Class Level field.';
                }
                field("Item Class Name"; Rec."Item Class Name")
                {
                    ToolTip = 'Specifies the value of the Item Class Name field.';
                }
                field("Manual Entry"; Rec."Manual Entry")
                {
                    ToolTip = 'Specifies the value of the Manual Entry field.';
                }
                field("Taxation Type Code"; Rec."Taxation Type Code")
                {
                    ToolTip = 'Specifies the value of the Taxation Type Code field.';
                }
            }
        }
    }
}
