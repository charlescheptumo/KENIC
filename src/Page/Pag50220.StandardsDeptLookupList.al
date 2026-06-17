page 50274 "Standards Dept Lookup List"
{
    ApplicationArea = All;
    Caption = 'Standards Dept Lookup List';
    PageType = List;
    SourceTable = "Standards Dept Lookup Buffer";
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
                field("Standards Buffer"; Rec."Standards Buffer")
                {
                    ApplicationArea = Basic; ToolTip = 'Specifies the value of the Standards Buffer field.', Comment = '%';
                }
            }
        }
    }
}
