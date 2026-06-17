#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72214 "Project Staffing Template Line"
{
    PageType = ListPart;
    SourceTable = "Project Staff Template Lines";
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
                field("Team Type"; Rec."Team Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Team Type field.';
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
                field("Min No. of Recommended Staff"; Rec."Min No. of Recommended Staff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min No. of Recommended Staff field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = 'Line';
                action("Project Staff Template Exp")
                {
                    ApplicationArea = Basic;
                    Caption = 'Required Experience';
                    Image = PlanningWorksheet;
                    
                    RunObject = Page "Project Staff Template Expe";
                    RunPageLink = "Key Staff Template ID" = field("Key Staff Template ID"),
                                  "Project Role Code" = field("Staff Role Code");
                    ToolTip = 'Executes the Required Experience action.';
                }
                action("Project Staff Template Qualif")
                {
                    ApplicationArea = Basic;
                    Caption = 'Required Qualifications';
                    Image = QualificationOverview;
                    
                    RunObject = Page "Project Staff Template Qualify";
                    RunPageLink = "Key Staff Template ID" = field("Key Staff Template ID"),
                                  "Staff Role Code" = field("Staff Role Code");
                    ToolTip = 'Executes the Required Qualifications action.';
                }
                action("Project Staff Functions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Functions';
                    Image = QualificationOverview;
                    
                    RunObject = Page "Staff Appointment Function";
                    RunPageLink = "Document No." = field("Key Staff Template ID"),
                                  "Staff Role Code" = field("Staff Role Code");
                    ToolTip = 'Executes the Staff Functions action.';
                }
            }
        }
    }
}

