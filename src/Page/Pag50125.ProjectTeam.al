page 50125 "Project Team"
{
    ApplicationArea = All;
    Caption = 'Project Team';
    PageType = Card;
    SourceTable = "Project Teams";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Code"; Rec."Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field("Team Name"; Rec."Team Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Team Name field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Team Member No"; Rec."Team Member No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Team Member No field.', Comment = '%';
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                    Visible = false;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.', Comment = '%';
                }
                field("Sub Department"; Rec."Sub Department")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub Department field.', Comment = '%';
                }
                field("No of Members"; Rec."No of Members")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Members field.', Comment = '%';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.', Comment = '%';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Date field.', Comment = '%';
                }
            }
            part("Project Team Members"; "Project Team Members")
            {
                SubPageLink = "Code" = field("Code");
            }
        }
    }
}
