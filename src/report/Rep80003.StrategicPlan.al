report 80003 StrategicPlan
{
    Caption = 'Strategic Plan';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Strategic Plan.rdl';
    ApplicationArea = All;

    dataset
    {
        dataitem("Corporate Strategic Plans"; "Corporate Strategic Plans")
        {
            RequestFilterFields = "Code";
            column(ReportForNavId_1; 1)
            {
            }
            column(Code_CorporateStrategicPlans; "Corporate Strategic Plans".Code)
            {
            }
            column(Description_CorporateStrategicPlans; "Corporate Strategic Plans".Description)
            {
            }
            column(StartDate_CorporateStrategicPlans; "Corporate Strategic Plans"."Start Date")
            {
            }
            column(EndDate_CorporateStrategicPlans; "Corporate Strategic Plans"."End Date")
            {
            }
            column(DurationYears_CorporateStrategicPlans; "Corporate Strategic Plans"."Duration (Years)")
            {
            }
            column(ImplementationStatus_CorporateStrategicPlans; "Corporate Strategic Plans"."Implementation Status")
            {
            }
            column(ApprovalStatus_CorporateStrategicPlans; "Corporate Strategic Plans"."Approval Status")
            {
            }
            dataitem("Strategic Initiative"; "Strategic Initiative")
            {
                DataItemLink = "Strategic Plan ID" = field(Code);
                column(ReportForNavId_17; 17)
                {
                }
                column(StrategicPlanID_StrategicInitiative; "Strategic Initiative"."Strategic Plan ID")
                {
                }
                column(ObjectiveID_StrategicInitiative; StrategicObjectiveDescription)
                {
                }
                column(StrategyID_StrategicInitiative; StrategyDescription)
                {
                }
                column(Code_StrategicInitiative; "Strategic Initiative".Code)
                {
                }
                column(Description_StrategicInitiative; "Strategic Initiative".Description)
                {
                }
                column(AchievedTarget_StrategicInitiative; "Strategic Initiative"."Total Achieved Target")
                {
                }
                column(KPI_StrategicInitiative; "Strategic Initiative"."Key Perfromance Indicator")
                {
                }
                column(PrimaryDirectorate_StrategicInitiative; "Strategic Initiative"."Primary Directorate")
                {
                }
                column(PrimaryDirectorateName_StrategicInitiative; "Strategic Initiative"."Primary Directorate Name")
                {
                }
                column(Total_Achieved_Target; "Total Achieved Target")
                {

                }

                trigger OnAfterGetRecord()
                begin

                    StrategicObjective.Reset;
                    StrategicObjective.SetRange("Objective ID", "Strategic Initiative"."Objective ID");
                    if StrategicObjective.Find('-') then begin
                        StrategicObjectiveDescription := StrategicObjective.Description;
                    end;

                    Strategy.Reset;
                    Strategy.SetRange("Strategy ID", "Strategic Initiative"."Strategy ID");
                    if Strategy.Find('-') then begin
                        StrategyDescription := Strategy.Description;
                    end;
                end;
            }
            dataitem(AnnualStrategyWorkplan; "Annual Strategy Workplan")
            {
                DataItemLink = "Strategy Plan ID" = field(Code);
                dataitem(StrategyWorkplanLines; "Strategy Workplan Lines")
                {
                    DataItemLink = "Strategy Plan ID" = field("Strategy Plan ID"), "Year Reporting Code" = field("Year Reporting Code");

                    column(Q1Target_StrategyWorkplanLines; Q1Target_StrategyWorkplanLines)
                    {
                    }
                    column(Q1Budget_StrategyWorkplanLines; Q1Budget_StrategyWorkplanLines)
                    {
                    }
                    column(Q2Budget_StrategyWorkplanLines; Q2Budget_StrategyWorkplanLines)
                    {
                    }
                    column(Q3Budget_StrategyWorkplanLines; Q3Budget_StrategyWorkplanLines)
                    {
                    }
                    column(Q2Target_StrategyWorkplanLines; Q2Target_StrategyWorkplanLines)
                    {
                    }
                    column(Q4Budget_StrategyWorkplanLines; Q4Budget_StrategyWorkplanLines)
                    {
                    }
                    column(Q3Target_StrategyWorkplanLines; Q3Target_StrategyWorkplanLines)
                    {
                    }
                    column(Q4Target_StrategyWorkplanLines; Q4Target_StrategyWorkplanLines)
                    {
                    }
                    column(Q1Target_StrategyWorkplanLines2; Q1Target_StrategyWorkplanLines2)
                    {
                    }
                    column(Q1Budget_StrategyWorkplanLines2; Q1Budget_StrategyWorkplanLines2)
                    {
                    }
                    column(Q2Budget_StrategyWorkplanLines2; Q2Budget_StrategyWorkplanLines2)
                    {
                    }
                    column(Q3Budget_StrategyWorkplanLines2; Q3Budget_StrategyWorkplanLines2)
                    {
                    }
                    column(Q2Target_StrategyWorkplanLines2; Q2Target_StrategyWorkplanLines2)
                    {
                    }
                    column(Q4Budget_StrategyWorkplanLines2; Q4Budget_StrategyWorkplanLines2)
                    {
                    }
                    column(Q3Target_StrategyWorkplanLines2; Q3Target_StrategyWorkplanLines2)
                    {
                    }
                    column(Q4Target_StrategyWorkplanLines2; Q4Target_StrategyWorkplanLines2)
                    {
                    }
                    column(Q1Target_StrategyWorkplanLines3; Q1Target_StrategyWorkplanLines3)
                    {
                    }
                    column(Q1Budget_StrategyWorkplanLines3; Q1Budget_StrategyWorkplanLines3)
                    {
                    }
                    column(Q2Budget_StrategyWorkplanLines3; Q2Budget_StrategyWorkplanLines3)
                    {
                    }
                    column(Q3Budget_StrategyWorkplanLines3; Q3Budget_StrategyWorkplanLines3)
                    {
                    }
                    column(Q2Target_StrategyWorkplanLines3; Q2Target_StrategyWorkplanLines3)
                    {
                    }
                    column(Q4Budget_StrategyWorkplanLines3; Q4Budget_StrategyWorkplanLines3)
                    {
                    }
                    column(Q3Target_StrategyWorkplanLines3; Q3Target_StrategyWorkplanLines3)
                    {
                    }
                    column(Q4Target_StrategyWorkplanLines3; Q4Target_StrategyWorkplanLines3)
                    {
                    }
                    column(Q1Target_StrategyWorkplanLines4; Q1Target_StrategyWorkplanLines4)
                    {
                    }
                    column(Q1Budget_StrategyWorkplanLines4; Q1Budget_StrategyWorkplanLines4)
                    {
                    }
                    column(Q2Budget_StrategyWorkplanLines4; Q2Budget_StrategyWorkplanLines4)
                    {
                    }
                    column(Q3Budget_StrategyWorkplanLines4; Q3Budget_StrategyWorkplanLines4)
                    {
                    }
                    column(Q2Target_StrategyWorkplanLines4; Q2Target_StrategyWorkplanLines4)
                    {
                    }
                    column(Q4Budget_StrategyWorkplanLines4; Q4Budget_StrategyWorkplanLines4)
                    {
                    }
                    column(Q3Target_StrategyWorkplanLines4; Q3Target_StrategyWorkplanLines4)
                    {
                    }
                    column(Q4Target_StrategyWorkplanLines4; Q4Target_StrategyWorkplanLines4)
                    {
                    }
                    column(Y1Label; Y1Label)
                    {
                    }
                    column(Y2Label; Y2Label)
                    {
                    }
                    column(Y3Label; Y3Label)
                    {
                    }
                    column(Y4Label; Y4Label)
                    {
                    }

                    trigger OnAfterGetRecord()
                    var
                        AnnualStrategyWorkplan: Record "Annual Strategy Workplan";
                        StrategyWorkplanLines: Record "Strategy Workplan Lines";
                        CSPPlannedYears: Record "CSP Planned Years";
                        i: Integer;
                    begin
                        AnnualStrategyWorkplan.Reset();
                        AnnualStrategyWorkplan.SetRange("Strategy Plan ID", "Strategy Plan ID");
                        AnnualStrategyWorkplan.SetRange("Annual Strategy Type", AnnualStrategyWorkplan."Annual Strategy Type"::Organizational);
                        if AnnualStrategyWorkplan.Find('-') then begin
                            repeat
                                CSPPlannedYears.Reset();
                                CSPPlannedYears.SetRange("CSP Code", "Strategy Plan ID");
                                CSPPlannedYears.SetRange("Annual Year Code", "Year Reporting Code");
                                if CSPPlannedYears.findset then begin
                                    if CSPPlannedYears."Year Order" = 1 then begin
                                        Y1Label := "Year Reporting Code";
                                        Q1Target_StrategyWorkplanLines := "Q1 Target";
                                        Q1Budget_StrategyWorkplanLines := "Q1 Budget";
                                        Q2Target_StrategyWorkplanLines := "Q2 Target";
                                        Q2Budget_StrategyWorkplanLines := "Q2 Budget";
                                        Q3Target_StrategyWorkplanLines := "Q3 Target";
                                        Q3Budget_StrategyWorkplanLines := "Q3 Budget";
                                        Q4Target_StrategyWorkplanLines := "Q4 Target";
                                        Q4Budget_StrategyWorkplanLines := "Q4 Budget";
                                    end;
                                    if CSPPlannedYears."Year Order" = 2 then begin
                                        Y2Label := "Year Reporting Code";
                                        Q1Target_StrategyWorkplanLines2 := "Q1 Target";
                                        Q1Budget_StrategyWorkplanLines2 := "Q1 Budget";
                                        Q2Target_StrategyWorkplanLines2 := "Q2 Target";
                                        Q2Budget_StrategyWorkplanLines2 := "Q2 Budget";
                                        Q3Target_StrategyWorkplanLines2 := "Q3 Target";
                                        Q3Budget_StrategyWorkplanLines2 := "Q3 Budget";
                                        Q4Target_StrategyWorkplanLines2 := "Q4 Target";
                                        Q4Budget_StrategyWorkplanLines2 := "Q4 Budget";
                                    end;
                                    if CSPPlannedYears."Year Order" = 3 then begin
                                        Y3Label := "Year Reporting Code";
                                        Q1Target_StrategyWorkplanLines3 := "Q1 Target";
                                        Q1Budget_StrategyWorkplanLines3 := "Q1 Budget";
                                        Q2Target_StrategyWorkplanLines3 := "Q2 Target";
                                        Q2Budget_StrategyWorkplanLines3 := "Q2 Budget";

                                    end;
                                    if CSPPlannedYears."Year Order" = 4 then begin
                                        Y4Label := "Year Reporting Code";
                                        Q1Target_StrategyWorkplanLines4 := "Q1 Target";
                                        Q1Budget_StrategyWorkplanLines4 := "Q1 Budget";
                                        Q2Target_StrategyWorkplanLines4 := "Q2 Target";
                                        Q2Budget_StrategyWorkplanLines4 := "Q2 Budget";
                                        Q3Target_StrategyWorkplanLines4 := "Q3 Target";
                                        Q3Budget_StrategyWorkplanLines4 := "Q3 Budget";
                                        Q4Target_StrategyWorkplanLines4 := "Q4 Target";
                                        Q4Budget_StrategyWorkplanLines4 := "Q4 Budget";
                                    end;
                                end;
                            until AnnualStrategyWorkplan.Next = 0;
                        end
                    end;
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        StrategicObjective: Record "Strategic Objective";
        Strategy: Record Strategy;
        StrategicObjectiveDescription: Text;
        StrategyDescription: Text;
        //Targets & Budget
        Y1Label: Text;
        Y2Label: Text;
        Y3Label: Text;
        Y4Label: Text;
        Q1Target_StrategyWorkplanLines: Decimal;
        Q1Budget_StrategyWorkplanLines: Decimal;
        Q1Target_StrategyWorkplanLines2: Decimal;
        Q1Budget_StrategyWorkplanLines2: Decimal;
        Q1Target_StrategyWorkplanLines3: Decimal;
        Q1Budget_StrategyWorkplanLines3: Decimal;
        Q1Target_StrategyWorkplanLines4: Decimal;
        Q1Budget_StrategyWorkplanLines4: Decimal;
        Q2Target_StrategyWorkplanLines: Decimal;
        Q2Budget_StrategyWorkplanLines: Decimal;
        Q2Target_StrategyWorkplanLines2: Decimal;
        Q2Budget_StrategyWorkplanLines2: Decimal;
        Q2Target_StrategyWorkplanLines3: Decimal;
        Q2Budget_StrategyWorkplanLines3: Decimal;
        Q2Target_StrategyWorkplanLines4: Decimal;
        Q2Budget_StrategyWorkplanLines4: Decimal;
        Q3Target_StrategyWorkplanLines: Decimal;
        Q3Budget_StrategyWorkplanLines: Decimal;
        Q3Target_StrategyWorkplanLines2: Decimal;
        Q3Budget_StrategyWorkplanLines2: Decimal;
        Q3Target_StrategyWorkplanLines3: Decimal;
        Q3Budget_StrategyWorkplanLines3: Decimal;
        Q3Target_StrategyWorkplanLines4: Decimal;
        Q3Budget_StrategyWorkplanLines4: Decimal;
        Q4Target_StrategyWorkplanLines: Decimal;
        Q4Budget_StrategyWorkplanLines: Decimal;
        Q4Target_StrategyWorkplanLines2: Decimal;
        Q4Budget_StrategyWorkplanLines2: Decimal;
        Q4Target_StrategyWorkplanLines3: Decimal;
        Q4Budget_StrategyWorkplanLines3: Decimal;
        Q4Target_StrategyWorkplanLines4: Decimal;
        Q4Budget_StrategyWorkplanLines4: Decimal;
}
