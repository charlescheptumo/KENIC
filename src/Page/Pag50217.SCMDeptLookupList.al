page 50271 "SCM Dept Lookup List"
{
    ApplicationArea = All;
    Caption = 'SCM Dept Lookup List';
    PageType = List;
    SourceTable = "SCM Dept Lookup Buffer";
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
                field("SCM Buffer"; Rec."SCM Buffer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SCM Buffer field.', Comment = '%';
                }
            }
        }
    }
}
