page 50272 "Audit Dept Lookup List"
{
    ApplicationArea = All;
    Caption = 'Audit Dept Lookup List';
    PageType = List;
    SourceTable = "Audit Dept Lookup Buffer";
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
                field("Audit Buffer"; Rec."Audit Buffer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Buffer field.', Comment = '%';
                }
            }
        }
    }
}
