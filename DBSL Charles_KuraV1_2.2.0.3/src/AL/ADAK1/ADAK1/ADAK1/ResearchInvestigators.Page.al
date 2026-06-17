#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65071 "Research Investigators"
{
    ApplicationArea = Basic;
    CardPageID = "Project Research Team Card";
    Editable = false;
    PageType = List;
    SourceTable = "Project Research Team";
    SourceTableView = where("Primary Role" = const('PI'));
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job No field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Researcher ID"; Rec."Researcher ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Researcher ID field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Primary Role"; Rec."Primary Role")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Role field.';
                }
                field("Role Description"; Rec."Role Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

