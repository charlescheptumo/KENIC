namespace KICD.KICD;

page 50311 COFS
{
    ApplicationArea = All;
    Caption = 'COFS';
    PageType = List;
    SourceTable = COFS;
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
                field("COFS Buffer"; Rec."COFS Buffer")
                {
                    ToolTip = 'Specifies the value of the COFS Buffer field.', Comment = '%';
                }
            }
        }
    }
}
