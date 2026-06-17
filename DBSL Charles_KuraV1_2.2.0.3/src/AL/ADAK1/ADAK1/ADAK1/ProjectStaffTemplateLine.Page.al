#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75105 "Project Staff Template Line"
{
    PageType = ListPart;
    SourceTable = "Project Staff Template Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project Role Code"; Rec."Project Role Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Role Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Title Designation Description';
                    ToolTip = 'Specifies the value of the Title Designation Description field.';
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Category field.';
                }
                field("Min No. of Recomm Staff"; Rec."Min No. of Recomm Staff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min No. of Recomm Staff field.';
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
                    Caption = 'Required Qualification';
                    Image = PlanningWorksheet;
                    
                    RunObject = Page "Project Staff Template Exp";
                    RunPageLink = "Key Staff Template ID" = field("Key Staff Template ID"),
                                  "Project Role Code" = field("Project Role Code");
                    ToolTip = 'Executes the Required Qualification action.';
                }
                action("Project Staff Template Qualif")
                {
                    ApplicationArea = Basic;
                    Caption = 'Required Experience';
                    Image = QualificationOverview;
                    RunObject = Page "Project Staff Template Qualif";
                    ToolTip = 'Executes the Required Experience action.';
                }
            }
        }
    }
}

