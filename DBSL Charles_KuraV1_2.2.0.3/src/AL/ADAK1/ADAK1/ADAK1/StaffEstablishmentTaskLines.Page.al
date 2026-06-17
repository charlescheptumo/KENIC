#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69105 "Staff Establishment Task Lines"
{
    PageType = ListPart;
    SourceTable = "Staff Establishment Task Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("No. of Posts"; Rec."No. of Posts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Posts field.';
                }
                field("Staff Established"; Rec."Staff Established")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Established field.';
                }
                field("Actual Active"; Rec."Actual Active")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Active field.';
                }
                field("Actual Terminated"; Rec."Actual Terminated")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Terminated field.';
                }
                field("Actual Suspended"; Rec."Actual Suspended")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Suspended field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Planning Lines")
            {
                ApplicationArea = Basic;
                Image = JobLines;
                ToolTip = 'Executes the Planning Lines action.';

                trigger OnAction()
                begin
                    StaffEstablishmentPlanLines.FilterGroup(2);
                    StaffEstablishmentPlanLines.SetRange("Task No", Rec."Entry No.");
                    StaffEstablishmentPlanLines.SetRange("Job ID", Rec."Job ID");
                    StaffEstablishmentPlanLines.FilterGroup(0);
                    StaffEstablishmentPlanLine.SetTableview(StaffEstablishmentPlanLines);
                    StaffEstablishmentPlanLine.Editable := true;
                    StaffEstablishmentPlanLine.Run;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        TotalEstablished := 0;
        PlanLines.Reset;
        PlanLines.SetRange("Job ID", Rec."Job ID");
        PlanLines.SetRange("Task No", Rec."Entry No.");
        if PlanLines.FindSet then begin
            repeat
                TotalEstablished := TotalEstablished + PlanLines."Approved Establishment";
            until PlanLines.Next = 0;
        end;
        Rec."No. of Posts" := TotalEstablished;
    end;

    var
        StaffEstablishmentPlanLines: Record "Staff Est Plan Lines";
        StaffEstablishmentPlanLine: Page "Staff Establishment Plan Lines";
        PlanLines: Record "Staff Est Plan Lines";
        TotalEstablished: Integer;
}

