page 50275 "Human Cap Dept Lookup List"
{
    ApplicationArea = All;
    Caption = 'Human Cap Dept Lookup List';
    PageType = List;
    SourceTable = "Human Cap Dept Lookup Buffer";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = Basic; ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field("Human Capital Buffer"; Rec."Human Capital Buffer")
                {
                    ApplicationArea = Basic; ToolTip = 'Specifies the value of the Human Capital Buffer field.', Comment = '%';
                }
            }
        }
    }
}
