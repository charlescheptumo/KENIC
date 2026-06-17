namespace KICD.KICD;

page 50290 "Managerial Attributes"
{
    ApplicationArea = All;
    Caption = 'Managerial Attributes';
    PageType = List;
    CardPageId = "Managerial Attribute";
    SourceTable = "Managerial Attributes";
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
