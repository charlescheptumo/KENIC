page 50277 "Corporate Dept Lookup List"
{
    ApplicationArea = All;
    Caption = 'Corporate Dept Lookup List';
    PageType = List;
    SourceTable = "Corporate Dept Lookup Buffer";
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
                field("Corporate Buffer"; Rec."Corporate Buffer")
                {
                    ApplicationArea = Basic; ToolTip = 'Specifies the value of the Corporate Buffer field.', Comment = '%';
                }
            }
        }
    }
}
