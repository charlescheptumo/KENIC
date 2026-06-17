page 80564 "DCS Reporting"
{
    Caption = 'Directors Performance Reporting';
    PageType = ListPart;
    SourceTable = 80060;
    SourceTableView = WHERE("Initiative Type" = FILTER(Activity));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Initiative Type"; Rec."Initiative Type")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Initiative Type field.';
                }
                field("Initiative No."; Rec."Initiative No.")
                {
                    Caption = 'Activity No';
                    ToolTip = 'Specifies the value of the Activity No field.';
                }
                field("Objective/Initiative"; Rec."Objective/Initiative")
                {
                    Caption = 'Activity Name';
                    ToolTip = 'Specifies the value of the Activity Name field.';
                }
                field("Outcome Perfomance Indicator"; Rec."Outcome Perfomance Indicator")
                {
                    Visible = true;
                    ToolTip = 'Specifies the value of the Outcome Perfomance Indicator field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ToolTip = 'Specifies the value of the Desired Perfomance Direction field.';
                }
                field("Previous Annual Target Qty"; Rec."Previous Annual Target Qty")
                {
                    Caption = 'Previous Annual Achievements';
                    ToolTip = 'Specifies the value of the Previous Annual Achievements field.';
                }
                field("Imported Annual Target Qty"; Rec."Imported Annual Target Qty")
                {
                    Caption = 'Agreed Targets';
                    ToolTip = 'Specifies the value of the Agreed Targets field.';
                }
                field("Assigned Weight (%)"; Rec."Assigned Weight (%)")
                {
                    Editable = true;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Assigned Weight (%) field.';
                }
                field("Summary of subactivities"; Rec."Summary of subactivities")
                {
                    Caption = 'Subactivities Weight';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Subactivities Weight field.';
                }
                // field("Achieved Target";AchievedTarget)
                // {
                //     Editable = false;
                // }
                field("Start Date"; Rec."Start Date")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Primary Department field.';
                }
                field("Framework Perspective"; Rec."Framework Perspective")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Framework Perspective field.';
                }
                field("Strategy Framework"; Rec."Strategy Framework")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Strategy Framework field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field("Directors Achieved Targets"; Rec."Directors Achieved Targets")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Directors Achieved Targets field.';
                }
                field("Department Achieved Target"; Rec."Department Achieved Target")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department Achieved Target field.';
                }
                field(Budget; Rec.Budget)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Budget field.';
                }
                field("Additional Comments"; Rec."Additional Comments")
                {
                    Caption = 'Remarks';
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Planning Budget Type"; Rec."Planning Budget Type")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Planning Budget Type field.';
                }
                field("Q1 Target Qty"; Rec."Q1 Target Qty")
                {
                    ToolTip = 'Specifies the value of the Q1 Target Qty field.';
                }
                field("Q1 Actual Qty"; Rec."Q1 Actual Qty")
                {
                    ToolTip = 'Specifies the value of the Q1 Actual Qty field.';
                }
                // field("CEO Achieved Targets Q1";"CEO Achieved Targets Q1")
                // {
                // }
                field(Q1Variance; Q1Variance)
                {
                    ToolTip = 'Specifies the value of the Q1Variance field.';
                }
                field("Q2 Target Qty"; Rec."Q2 Target Qty")
                {
                    ToolTip = 'Specifies the value of the Q2 Target Qty field.';
                }
                // field("CEO Achieved Targets Q2";"CEO Achieved Targets Q2")
                // {
                // }
                field(Q2Variance; Q2Variance)
                {
                    ToolTip = 'Specifies the value of the Q2Variance field.';
                }
                field(Q2Cumulative; Q2Cumulative)
                {
                    ToolTip = 'Specifies the value of the Q2Cumulative field.';
                }
                field("Q3 Target Qty"; Rec."Q3 Target Qty")
                {
                    ToolTip = 'Specifies the value of the Q3 Target Qty field.';
                }
                // field("CEO Achieved Targets Q3";"CEO Achieved Targets Q3")
                // {
                // }
                field(Q3Variance; Q3Variance)
                {
                    ToolTip = 'Specifies the value of the Q3Variance field.';
                }
                field(Q3Cumulative; Q3Cumulative)
                {
                    ToolTip = 'Specifies the value of the Q3Cumulative field.';
                }
                field("Q4 Target Qty"; Rec."Q4 Target Qty")
                {
                    ToolTip = 'Specifies the value of the Q4 Target Qty field.';
                }
                // field("CEO Achieved Targets Q4";"CEO Achieved Targets Q4")
                // {
                // }
                field(Q4Variance; Q4Variance)
                {
                    ToolTip = 'Specifies the value of the Q4Variance field.';
                }
                field(Q4Cumulative; Q4Cumulative)
                {
                    ToolTip = 'Specifies the value of the Q4Cumulative field.';
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
                action("Select Activities")
                {
                    ToolTip = 'Executes the Select Activities action.';

                    trigger OnAction()
                    begin
                        PcLines.RESET;
                        PcLines.SETRANGE("Initiative No.", Rec."Initiative No.");
                        WorkplanInitiatives.SETTABLEVIEW(PcLines);
                        WorkplanInitiatives.LOOKUPMODE(TRUE);
                        //IF WorkplanInitiatives.RUNMODAL = ACTION::LookupOK THEN
                    end;
                }
                action("Sub-Indicators")
                {
                    RunObject = Page 80114;
                    RunPageLink = "Workplan No." = FIELD("Workplan No."),
                                  "Initiative No." = FIELD("Initiative No.");
                    ToolTip = 'Executes the Sub-Indicators action.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //AchievedTarget:=0;
        //AchievedTarget:=FnGetAchievedTargets("Workplan No.","Initiative No.");
        // CALCFIELDS("Functional Achieved Targets Q1","Functional Achieved Targets Q2","Functional Achieved Targets Q3","Functional Achieved Targets Q4");
        // Q1Variance:=("Q1 Target Qty"-"Functional Achieved Targets Q1");

        // Q2Variance:=("Q2 Target Qty"-"Functional Achieved Targets Q2");
        // Q2Cumulative:=("Functional Achieved Targets Q1"+"Functional Achieved Targets Q2");

        // Q3Variance:=("Q3 Target Qty"-"Functional Achieved Targets Q3");
        // Q3Cumulative:=("Functional Achieved Targets Q1"+"Functional Achieved Targets Q2"+"Functional Achieved Targets Q3");

        // Q4Variance:=("Q4 Target Qty"-"Functional Achieved Targets Q4");
        // Q4Cumulative:=("Functional Achieved Targets Q1"+"Functional Achieved Targets Q2"+"Functional Achieved Targets Q3"+"Functional Achieved Targets Q4");
    end;

    var
        PcLines: Record "PC Objective";
        AchievedTarget: Decimal;
        Q1Variance: Decimal;
        Q2Variance: Decimal;
        Q2Cumulative: Decimal;
        Q3Variance: Decimal;
        Q3Cumulative: Decimal;
        Q4Variance: Decimal;
        Q4Cumulative: Decimal;
        WorkplanInitiatives: Page "Workplan Initiatives";

    procedure FnGetAchievedTargets(PCNumber: Code[50]; ActivityID: Code[50]) AchievedT: Decimal
    var
        PCObjective: Record 80060;
    begin
        AchievedT := 0;
        PCObjective.RESET;
        PCObjective.SETRANGE("Workplan No.", PCNumber);
        PCObjective.SETRANGE("Initiative No.", ActivityID);
        IF PCObjective.FIND('-') THEN BEGIN
            PCObjective.CALCFIELDS("Individual Achieved Targets", "Functional Achieved Targets", "CEO Achieved Targets", "Board Achieved Targets",
                                  "Directors Achieved Targets", "Department Achieved Target");

            IF PCObjective."Individual Achieved Targets" > 0 THEN
                AchievedT := PCObjective."Individual Achieved Targets";

            IF PCObjective."Functional Achieved Targets" > 0 THEN
                AchievedT := PCObjective."Functional Achieved Targets";

            IF PCObjective."CEO Achieved Targets" > 0 THEN
                AchievedT := PCObjective."CEO Achieved Targets";

            IF PCObjective."Board Achieved Targets" > 0 THEN
                AchievedT := PCObjective."Board Achieved Targets";

            IF PCObjective."Directors Achieved Targets" > 0 THEN
                AchievedT := PCObjective."Directors Achieved Targets";

            IF PCObjective."Department Achieved Target" > 0 THEN
                AchievedT := PCObjective."Department Achieved Target";

        END;
        EXIT;
    end;
}

