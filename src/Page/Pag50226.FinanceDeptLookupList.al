page 50278 "Finance Dept Lookup List"
{
    ApplicationArea = All;
    Caption = 'Finance Dept Lookup List';
    PageType = List;
    SourceTable = "Finance Dept Lookup Buffer";
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
                field("Finance Buffer"; Rec."Finance Buffer")
                {
                    ApplicationArea = Basic; ToolTip = 'Specifies the value of the Finance Buffer field.', Comment = '%';
                }
            }
        }
    }
}
