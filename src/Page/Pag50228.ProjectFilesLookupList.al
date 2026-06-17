page 50280 "Project Files Lookup List"
{
    ApplicationArea = All;
    Caption = 'Project Files Lookup List';
    PageType = List;
    SourceTable = "Project Files Lookup Buffer";
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
                field("Project Files Buffer"; Rec."Project Files Buffer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Files Buffer field.', Comment = '%';
                }
            }
        }
    }
}
