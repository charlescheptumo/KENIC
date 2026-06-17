namespace KICD.KICD;

page 50333 "Ethnic Regions"
{
    ApplicationArea = All;
    Caption = 'Ethnic Regions';
    PageType = List;
    SourceTable = "Ethnic Region";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for the ethnic region.';
                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the ethnic region.';
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    
                    ToolTip = 'Specifies additional description for the ethnic region.';
                }
            }
        }
    }
}
