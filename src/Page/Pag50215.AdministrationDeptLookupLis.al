page 50269 "Administration Dept Lookup Lis"
{
    ApplicationArea = All;
    Caption = 'Administration Dept Lookup Lis';
    PageType = List;
    SourceTable = "Administration Dept Lookup Buf";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field("Admin Buffer"; Rec."Admin Buffer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Admin Buffer field.', Comment = '%';
                }
            }
        }
    }
}
