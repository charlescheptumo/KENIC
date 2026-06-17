#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69110 "Manpower Task Lines"
{
    ApplicationArea = Basic;
    PageType = ListPart;
    SourceTable = "ManPower Plan Task Lines";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Task No"; Rec."Task No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task No field.';
                }
                field("Job Id"; Rec."Job Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Id field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Approved Establishment"; Rec."Approved Establishment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Establishment field.';
                }
                field("Actual Active"; Rec."Actual Active")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Active field.';
                }
                field(Deficit; Rec.Deficit)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Deficit field.';
                }
                field("Target No."; Rec."Target No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target No. field.';
                }
                field("Actual Recruited"; Rec."Actual Recruited")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Recruited field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Manpower Planning Lines")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Manpower Planning Lines action.';

                trigger OnAction()
                begin
                    ManPowerPlanningLine.FilterGroup(2);
                    ManPowerPlanningLine.SetRange("Manpower Plan Code", Rec."Manpower Plan Code");
                    ManPowerPlanningLine.SetRange("Task No", Rec."Task No");
                    ManPowerPlanningLine.SetRange("Job Id", Rec."Job Id");
                    ManPowerPlanningLine.FilterGroup(0);
                    ManpowerPlanningLines.SetTableview(ManPowerPlanningLine);
                    ManpowerPlanningLines.Editable := true;
                    ManpowerPlanningLines.Run;
                end;
            }
        }
    }

    var
        ManPowerPlanningLine: Record "ManPower Planning Lines";
        ManpowerPlanningLines: Page "Manpower Planning Lines";
}

