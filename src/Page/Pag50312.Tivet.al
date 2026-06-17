namespace KICD.KICD;

page 50312 Tivet
{
    ApplicationArea = All;
    Caption = 'Tivet';
    PageType = List;
    SourceTable = Tivet;
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
                field("Tivet Buffer"; Rec."Tivet Buffer")
                {
                    ToolTip = 'Specifies the value of the Tivet Buffer field.', Comment = '%';
                }
            }
        }
    }
}
