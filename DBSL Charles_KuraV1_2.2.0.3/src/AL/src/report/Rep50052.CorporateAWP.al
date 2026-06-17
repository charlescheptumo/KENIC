report 50052 "Corporate AWP"
{
    ApplicationArea = All;
    Caption = 'Corporate Annual Workplan Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Corporate AWP Reporting.rdlc';

    dataset
    {
        dataitem("Annual Strategy Workplan"; "Annual Strategy Workplan")
        {
            RequestFilterFields = No;
            column(No; No)
            {
            }
            column(Description; Description)
            {
            }
            column(StrategyPlanID; "Strategy Plan ID")
            {
            }
            column(WorkplanNo; "Workplan No")
            {
            }
            column(Start_Date; "Start Date") { }
            column(End_Date; "End Date") { }
            column(YearReportingCode; "Year Reporting Code")
            {
            }
            dataitem(StrategyWorkplanLines; "Strategy Workplan Lines")
            {
                DataItemLink = "No" = field(No), "Strategy Plan ID" = field("Strategy Plan ID");
                column(PrimaryDirectorate; "Primary Directorate")
                {
                }
                column(PrimaryDirectorateName; "Primary Directorate Name")
                {
                }
                column(PrimaryDepartment; "Primary Department")
                {
                }
                column(PrimaryDepartmentName; "Primary Department Name")
                {
                }
                column(KeyPerformanceIndicator; "Key Performance Indicator")
                {
                }
                column(UnitofMeasure; "Unit of Measure")
                {
                }
                column(ImportedAnnualBudgetEst; "Imported Annual Budget Est.")
                {
                }
                column(ImportedAnnualTargetQty; "Imported Annual Target Qty")
                {
                }
                column(PerfomanceIndicator; "Perfomance Indicator")
                {
                }
                column(DescriptionSW; Description) { }
                column(Q1Budget; "Q1 Budget")
                {
                }
                column(Q1Target; "Q1 Target")
                {
                }
                column(Q2Budget; "Q2 Budget")
                {
                }
                column(Q2Target; "Q2 Target")
                {
                }
                column(Q3Budget; "Q3 Budget")
                {
                }
                column(Q3Target; "Q3 Target")
                {
                }
                column(Q4Budget; "Q4 Budget")
                {
                }
                column(Q4Target; "Q4 Target")
                {
                }
                column(Q1Variance; Q1Variance)
                {
                }
                column(Q2Variance; Q2Variance)
                {
                }
                column(Q2Cumulative; Q2Cumulative)
                {
                }
                column(Q3Variance; Q3Variance)
                {
                }
                column(Q3Cumulative; Q3Cumulative)
                {
                }
                column(Q4Variance; Q4Variance)
                {
                }
                column(Q4Cumulative; Q4Cumulative)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    "PC Objective".Reset();
                    "PC Objective".SetRange("PC Objective"."Strategy Plan ID", StrategyWorkplanLines."Strategy Plan ID");
                    //TotalDepartmentalBudget:=0;
                    "PC Objective".SetRange("PC Objective"."Initiative No.", StrategyWorkplanLines."Activity ID");
                    "PC Objective".SetRange("PC Objective"."Primary Directorate", StrategyWorkplanLines."Primary Directorate");
                    "PC Objective".SetRange("PC Objective"."Primary Department", StrategyWorkplanLines."Primary Department");
                    if "PC Objective".FindSet() then begin
                        "PC Objective".CalcFields("Q1 Actual Qty", "Q2 Actual Qty", "Q3 Actual Qty", "Q4 Actual Qty");
                        Q1Variance := ("PC Objective"."Q1 Target Qty" - "PC Objective"."Q1 Actual Qty");

                        Q2Variance := ("PC Objective"."Q2 Target Qty" - "PC Objective"."Q2 Actual Qty");
                        Q2Cumulative := ("PC Objective"."Q1 Actual Qty" + "PC Objective"."Q2 Actual Qty");

                        Q3Variance := ("PC Objective"."Q3 Target Qty" - "PC Objective"."Q3 Actual Qty");
                        Q2Cumulative := ("PC Objective"."Q1 Actual Qty" + "PC Objective"."Q2 Actual Qty" + "PC Objective"."Q3 Actual Qty");

                        Q4Variance := ("PC Objective"."Q4 Target Qty" - "PC Objective"."Q4 Actual Qty");
                        Q4Cumulative := ("PC Objective"."Q4 Actual Qty" + "PC Objective"."Q4 Actual Qty" + "PC Objective"."Q4 Actual Qty");
                    end;
                end;
            }
        }
    }
    var
        "PC Objective": record "PC Objective";
        TotalDepartmentalBudget: Decimal;
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
}
