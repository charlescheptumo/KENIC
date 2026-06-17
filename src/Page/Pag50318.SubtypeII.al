namespace KICD.KICD;

page 50318 SubtypeII
{
    ApplicationArea = All;
    Caption = 'SubtypeII';
    PageType = List;
    SourceTable = "Memo subtypeII";
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
                    Editable = false;
                }
                field("Subtype "; Rec."Subtype")
                {
                    ToolTip = 'Specifies the value of the Subtype field.', Comment = '%';
                }
                field("No series"; Rec."No series")
                {
                    ToolTip = 'Specifies the value of the No series field.', Comment = '%';
                }
            }
        }
    }
}
