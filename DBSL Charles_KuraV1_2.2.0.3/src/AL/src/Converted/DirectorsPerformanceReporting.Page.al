#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80547 "DirectorsPerformance Reporting"
{
    Caption = 'Directors Performance Reporting';
    PageType = ListPart;
    SourceTable = "PC Objective";
    SourceTableView = where("Initiative Type" = filter(Activity));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Initiative Type"; Rec."Initiative Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Initiative Type field.';
                }
                field("Initiative No."; Rec."Initiative No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Activity No';
                    ToolTip = 'Specifies the value of the Activity No field.';
                }
                field("Objective/Initiative"; Rec."Objective/Initiative")
                {
                    ApplicationArea = Basic;
                    Caption = 'Activity Name';
                    ToolTip = 'Specifies the value of the Activity Name field.';
                }
                field("Outcome Perfomance Indicator"; Rec."Outcome Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Outcome Perfomance Indicator field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Desired Perfomance Direction field.';
                }
                field("Previous Annual Target Qty"; Rec."Previous Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Previous Annual Achievements';
                    ToolTip = 'Specifies the value of the Previous Annual Achievements field.';
                }
                field("Imported Annual Target Qty"; Rec."Imported Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Agreed Targets';
                    ToolTip = 'Specifies the value of the Agreed Targets field.';
                }
                field("Assigned Weight (%)"; Rec."Assigned Weight (%)")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Assigned Weight (%) field.';
                }
                field("Summary of subactivities"; Rec."Summary of subactivities")
                {
                    ApplicationArea = Basic;
                    Caption = 'Subactivities Weight';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Subactivities Weight field.';
                }
                field("Achieved Target"; AchievedTarget)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the AchievedTarget field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Primary Department field.';
                }
                field("Framework Perspective"; Rec."Framework Perspective")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Framework Perspective field.';
                }
                field("Strategy Framework"; Rec."Strategy Framework")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Strategy Framework field.';
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Strategy Plan ID field.';
                }
                field("Directors Achieved Targets"; Rec."Directors Achieved Targets")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Directors Achieved Targets field.';
                }
                field("Department Achieved Target"; Rec."Department Achieved Target")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department Achieved Target field.';
                }
                field(Budget; Rec.Budget)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Budget field.';
                }
                field("Additional Comments"; Rec."Additional Comments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Remarks';
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Planning Budget Type"; Rec."Planning Budget Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Planning Budget Type field.';
                }
                field("Q1 Target Qty"; Rec."Q1 Target Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q1 Target Qty field.';
                }
                field("Q1 Actual Qty"; Rec."Q1 Actual Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q1 Actual Qty field.';
                }
                field(Q1Variance; Q1Variance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q1Variance field.';
                }
                field("Q2 Target Qty"; Rec."Q2 Target Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q2 Target Qty field.';
                }
                field("Q2 Actual Qty"; Rec."Q2 Actual Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q2 Actual Qty field.';
                }
                field(Q2Variance; Q2Variance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q2Variance field.';
                }
                field(Q2Cumulative; Q2Cumulative)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q2Cumulative field.';
                }
                field("Q3 Target Qty"; Rec."Q3 Target Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q3 Target Qty field.';
                }
                field("Q3 Actual Qty"; Rec."Q3 Actual Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q3 Actual Qty field.';
                }
                field(Q3Variance; Q3Variance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q3Variance field.';
                }
                field(Q3Cumulative; Q3Cumulative)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q3Cumulative field.';
                }
                field("Q4 Target Qty"; Rec."Q4 Target Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q4 Target Qty field.';
                }
                field("Q4 Actual Qty"; Rec."Q4 Actual Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q4 Actual Qty field.';
                }
                field(Q4Variance; Q4Variance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Q4Variance field.';
                }
                field(Q4Cumulative; Q4Cumulative)
                {
                    ApplicationArea = Basic;
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
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Select Activities action.';

                    trigger OnAction()
                    begin
                        PcLines.Reset;
                        PcLines.SetRange("Initiative No.", Rec."Initiative No.");
                        WorkplanInitiatives.SetTableview(PcLines);
                        WorkplanInitiatives.LookupMode(true);
                        if WorkplanInitiatives.RunModal = Action::LookupOK then
;
                    end;
                }
                action("Sub-Indicators")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Sub Objectives/Intiatives";
                    RunPageLink = "Workplan No." = field("Workplan No."),
                                  "Initiative No." = field("Initiative No.");
                    ToolTip = 'Executes the Sub-Indicators action.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //AchievedTarget:=0;
        //AchievedTarget:=FnGetAchievedTargets("Workplan No.","Initiative No.");
        Rec.CalcFields("Q1 Actual Qty", "Q2 Actual Qty", "Q3 Actual Qty", "Q4 Actual Qty");
        Q1Variance := (Rec."Q1 Target Qty" - Rec."Q1 Actual Qty");

        Q2Variance := (Rec."Q2 Target Qty" - Rec."Q2 Actual Qty");
        Q2Cumulative := (Rec."Q1 Actual Qty" + Rec."Q2 Actual Qty");

        Q3Variance := (Rec."Q3 Target Qty" - Rec."Q3 Actual Qty");
        Q2Cumulative := (Rec."Q1 Actual Qty" + Rec."Q2 Actual Qty" + Rec."Q3 Actual Qty");

        Q4Variance := (Rec."Q4 Target Qty" - Rec."Q4 Actual Qty");
        Q4Cumulative := (Rec."Q4 Actual Qty" + Rec."Q4 Actual Qty" + Rec."Q4 Actual Qty");
    end;

    var
        PcLines: Record "PC Objective";
        WorkplanInitiatives: Page "Workplan Initiatives";
        AchievedTarget: Decimal;
        Q1Variance: Decimal;
        Q2Variance: Decimal;
        Q2Cumulative: Decimal;
        Q3Variance: Decimal;
        Q3Cumulative: Decimal;
        Q4Variance: Decimal;
        Q4Cumulative: Decimal;


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

