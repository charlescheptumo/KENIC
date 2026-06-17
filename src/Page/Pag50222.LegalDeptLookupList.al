page 50284 "Legal Dept Lookup List"
{
    ApplicationArea = All;
    Caption = 'Legal Dept Lookup List';
    PageType = List;
    SourceTable = "Legal Dept Lookup Buffer";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = Basic; ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field("Legal Buffer"; Rec."Legal Buffer")
                {
                    Caption = 'Records, Facilities, Projects and Security';
                    ApplicationArea = Basic; ToolTip = 'Specifies the value of the Legal Buffer field.', Comment = '%';
                }
            }
        }
    }
}
