page 50273 "Personnel Dept Lookup List"
{
    ApplicationArea = All;
    Caption = 'Personnel Dept Lookup List';
    PageType = List;
    SourceTable = "Personnel Dept Lookup Buffer";
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
                field("Personnel Buffer"; Rec."Personnel Buffer")
                {
                    Caption = 'Education Projects';
                    ApplicationArea = Basic; ToolTip = 'Specifies the value of the Personnel Buffer field.', Comment = '%';
                }
            }
        }
    }
}
