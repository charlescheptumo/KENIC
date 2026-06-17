namespace KICD.KICD;

page 50310 Research
{
    ApplicationArea = All;
    Caption = 'Research';
    PageType = List;
    SourceTable = Research;
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field("Research Documents"; Rec."Research Documents")
                {
                    ToolTip = 'Specifies the value of the Research Documents field.', Comment = '%';
                }
            }
        }
    }
}
