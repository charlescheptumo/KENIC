page 58153 "Declaration Interest Types"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Declaration Interest Type";
    Caption = 'Declaration Interest Types';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for the interest type.';
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the interest type.';
                }
                field("Blocked"; Rec."Blocked")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if this interest type is blocked from new selections.';
                }
            }
        }
    }
}