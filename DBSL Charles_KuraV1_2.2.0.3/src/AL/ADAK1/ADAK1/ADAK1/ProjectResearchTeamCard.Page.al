#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65039 "Project Research Team Card"
{
    CardPageID = "Project Research Team List";
    PageType = Card;
    SourceTable = "Project Research Team";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job No field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                    Editable = false;
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the Role Description field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Default Payment Mentod"; Rec."Default Payment Mentod")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Payment Mentod field.';
                }
            }
        }
    }

    actions
    {
    }
}

