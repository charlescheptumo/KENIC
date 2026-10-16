#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80408 "Staff Workplan Initiatives"
{
    Caption = 'Intiatives & Performance Indicators';
    PageType = ListPart;
    SourceTable = "PC Objective";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Framework Perspective"; Rec."Framework Perspective")
                {
                    ApplicationArea = Basic;
                    Caption = 'Perspective';
                    ToolTip = 'Specifies the perspective.';
                }
                field("Key Result area"; Rec."Key Result Area")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Key Result Area field.';
                }
                field("Objective/Initiative"; Rec."Objective/Initiative")
                {
                    ApplicationArea = Basic;
                    Caption = 'Objective';
                    ToolTip = 'Specifies the objective.';
                }
                field("Assigned Weight (%)"; Rec."Assigned Weight (%)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Objective %';
                    ToolTip = 'Specifies the objective weight.';
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Activity';
                    ToolTip = 'Specifies the activity.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Line Functions")
            {
                // action("Select Activities")
                // {
                //     ApplicationArea = Basic;


                //     trigger OnAction()
                //     begin
                //         PcLines.SetRange("Initiative No.", '<>%1', '');
                //         WorkplanInitiatives.SetTableview(PcLines);
                //         WorkplanInitiatives.LookupMode(true);
                //         if WorkplanInitiatives.RunModal = Action::LookupOK then;
                //     end;

                // }
                action("Sub-Activity")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Sub Objectives/Intiatives";
                    RunPageLink = "Strategy Plan ID" = field("Strategy Plan ID"),
                                  "Workplan No." = field("Workplan No."),
                                  "Initiative No." = field("Initiative No.");
                    ToolTip = 'Executes the Sub-Activity action.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        AchievedTarget := 0;
        AchievedTarget := FnGetAchievedTargets(Rec."Workplan No.", Rec."Initiative No.");
    end;

    var
        PcLines: Record "PC Objective";
        WorkplanInitiatives: Page "Workplan Initiatives";
        AchievedTarget: Decimal;


    procedure FnGetAchievedTargets(PCNumber: Code[50]; ActivityID: Code[50]) AchievedT: Decimal
    var
        PCObjective: Record "PC Objective";
    begin
        AchievedT := 0;
        PCObjective.Reset;
        PCObjective.SetRange("Workplan No.", PCNumber);
        PCObjective.SetRange("Initiative No.", ActivityID);
        if PCObjective.Find('-') then begin
            PCObjective.CalcFields("Individual Achieved Targets", "Functional Achieved Targets", "CEO Achieved Targets", "Board Achieved Targets",
                                  "Directors Achieved Targets", "Department Achieved Target");

            if PCObjective."Individual Achieved Targets" > 0 then
                AchievedT := PCObjective."Individual Achieved Targets";

            if PCObjective."Functional Achieved Targets" > 0 then
                AchievedT := PCObjective."Functional Achieved Targets";

            if PCObjective."CEO Achieved Targets" > 0 then
                AchievedT := PCObjective."CEO Achieved Targets";

            if PCObjective."Board Achieved Targets" > 0 then
                AchievedT := PCObjective."Board Achieved Targets";

            if PCObjective."Directors Achieved Targets" > 0 then
                AchievedT := PCObjective."Directors Achieved Targets";

            if PCObjective."Department Achieved Target" > 0 then
                AchievedT := PCObjective."Department Achieved Target";

        end;
        exit;
    end;
}

