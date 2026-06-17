namespace KICD.KICD;

page 50313 "Media and technical services "
{
    ApplicationArea = All;
    Caption = 'Media and technical services';
    PageType = List;
    SourceTable = "Media and technical services";
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
                field("Media and technical services Buffer"; Rec."Media and technical services Buffer")
                {
                    ToolTip = 'Specifies the value of the Media and technical services Buffer field.', Comment = '%';
                }
            }
        }
    }
}
