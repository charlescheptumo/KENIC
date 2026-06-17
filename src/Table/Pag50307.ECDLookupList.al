namespace KICD.KICD;

page 50307 "ECD Lookup List"
{
    ApplicationArea = All;
    Caption = 'ECD Lookup List';
    PageType = List;
    SourceTable = ECDLookupBuffer;
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
                field("ECD Buffer"; Rec."ECD Buffer")
                {
                    ToolTip = 'Specifies the value of the ECD Buffer field.', Comment = '%';
                }
            }
        }
    }
}
