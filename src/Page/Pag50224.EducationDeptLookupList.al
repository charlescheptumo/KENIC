page 50276 "Education Dept Lookup List"
{
    ApplicationArea = All;
    Caption = 'Education Dept Lookup List';
    PageType = List;
    SourceTable = "Education Dept Lookup Buffer";
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
                field("Education Buffer"; Rec."Education Buffer")
                {
                    Caption = 'Curriculum Research and Consultancy Services';
                    ApplicationArea = Basic; ToolTip = 'Specifies the value of the Education Buffer field.', Comment = '%';
                }
            }
        }
    }
}
