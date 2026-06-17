page 50124 "Project Teams"
{
    ApplicationArea = All;
    Caption = 'Project Teams';
    PageType = List;
    SourceTable = "Project Teams";
    UsageCategory = Lists;
    CardPageID = "Project Team";

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
                field("Team Name"; Rec."Team Name")
                {
                    ToolTip = 'Specifies the value of the Team Name field.', Comment = '%';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ToolTip = 'Specifies the value of the Creation Date field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("No of Members"; Rec."No of Members")
                {
                    ToolTip = 'Specifies the value of the No of Members field.', Comment = '%';
                }
                field("No Series"; Rec."No Series")
                {
                    ToolTip = 'Specifies the value of the No Series field.', Comment = '%';
                }
            }
        }
    }
}
