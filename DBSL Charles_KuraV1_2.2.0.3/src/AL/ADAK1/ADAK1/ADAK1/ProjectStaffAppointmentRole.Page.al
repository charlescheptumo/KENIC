#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72220 "Project Staff Appointment Role"
{
    PageType = List;
    SourceTable = "Project Staff Appointment Role";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff Role Code"; Rec."Staff Role Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Role Code field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Category field.';
                }
                field("Min  No. of Recommended Staff"; Rec."Min  No. of Recommended Staff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min  No. of Recommended Staff field.';
                }
                field("Actual No. of Appointed Staff"; Rec."Actual No. of Appointed Staff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual No. of Appointed Staff field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup12)
            {
                action("Project Staff Template Exp")
                {
                    ApplicationArea = Basic;
                    Caption = 'Required Qualification';
                    Image = PlanningWorksheet;
                    Promoted = true;
                    RunObject = Page "Project Staff Template Expe";
                    RunPageLink = "Project Role Code" = field("Staff Role Code");
                    ToolTip = 'Executes the Required Qualification action.';
                }
                action("Project Staff Template Qualif")
                {
                    ApplicationArea = Basic;
                    Caption = 'Required Experience';
                    Image = QualificationOverview;
                    Promoted = true;
                    RunObject = Page "Project Staff Template Qualify";
                    RunPageLink = "Staff Role Code" = field("Staff Role Code");
                    ToolTip = 'Executes the Required Experience action.';
                }
                action("Project Staff Functions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Functions';
                    Image = QualificationOverview;
                    Promoted = true;
                    RunObject = Page "Project Role Function";
                    RunPageLink = "Document No." = field("Staff Role Code");
                    ToolTip = 'Executes the Staff Functions action.';
                }
            }
        }
    }
}

