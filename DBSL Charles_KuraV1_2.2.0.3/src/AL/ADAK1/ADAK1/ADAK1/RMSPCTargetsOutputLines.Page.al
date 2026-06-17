#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72719 "RMS PC Targets&Output Lines"
{
    PageType = ListPart;
    SourceTable = "RMS PC Target Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Project Type"; Rec."Project Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Type field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Project Code"; Rec."Project Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Workplanned Length"; Rec."Workplanned Length")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplanned Length field.';
                }
                field("Progress %"; Rec."Progress %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Progress % field.';
                }
                field("Financial Year Target"; Rec."Financial Year Target")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year Target field.';
                }
                field("Q1 Target"; Rec."Q1 Target")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q1 Target field.';
                }
                field("Q1 Output"; Rec."Q1 Output")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q1 Output field.';
                }
                field("Q2 Target"; Rec."Q2 Target")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q2 Target field.';
                }
                field("Q2 Output"; Rec."Q2 Output")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q2 Output field.';
                }
                field("Q3 Target"; Rec."Q3 Target")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q3 Target field.';
                }
                field("Q3 Output"; Rec."Q3 Output")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q3 Output field.';
                }
                field("Q4 Target"; Rec."Q4 Target")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q4 Target field.';
                }
                field("Q4 Output"; Rec."Q4 Output")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q4 Output field.';
                }
                field("Financial Year Output"; Rec."Financial Year Output")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year Output field.';
                }
            }
        }
    }

    actions
    {
    }
}

