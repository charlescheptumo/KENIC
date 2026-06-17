namespace KICD.KICD;

page 50294 "Core Values & Attributes List"
{
    ApplicationArea = All;
    Caption = 'Core Values & Attributes List';
    PageType = List;
    CardPageId = "CoreValues&Attributes";
    SourceTable = "Core Values & Attributes";
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
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
            }
        }
    }
}
