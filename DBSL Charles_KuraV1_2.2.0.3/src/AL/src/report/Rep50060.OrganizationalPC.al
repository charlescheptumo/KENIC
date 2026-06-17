report 50060 "Organizational PC"
{
    ApplicationArea = All;
    Caption = 'Perfomance Contract';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Organizationalpc.rdlc';
    dataset
    {
        dataitem(AnnualStrategyWorkplan; "Annual Strategy Workplan")
        {
            RequestFilterFields = No;
            column(AnnualStrategyType; "Annual Strategy Type")
            {
            }
            column(AnnualWorkplan; "Annual Workplan")
            {
            }
            column(ApprovalStatus; "Approval Status")
            {
            }
            column(ApprovedBudget; "Approved Budget")
            {
            }
            column(Archived; Archived)
            {
            }
            column(ArchivedBy; "Archived By")
            {
            }
            column(ArchivedOn; "Archived On")
            {
            }
            column(CreatedBy; "Created By")
            {
            }
            column(Createdat; "Created at")
            {
            }
            column(CurrentAWP; "Current AWP")
            {
            }
            column(Department; Department)
            {
            }
            column(DepartmentName; "Department Name")
            {
            }
            column(Description; Description)
            {
            }
            column(EndDate; "End Date")
            {
            }
            column(FunctionalProcurmentPlanNo; "Functional Procurment Plan No")
            {
            }
            column(No; No)
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(NoofDepartmentPcs; "No. of Department Pcs")
            {
            }
            column(NoofDirectorsPCs; "No. of Directors PCs")
            {
            }
            column(NoofStaffPCs; "No. of Staff PCs")
            {
            }
            column(OrganiztionalPC; "Organiztional PC")
            {
            }
            column(PlanningBudgetType; "Planning Budget Type")
            {
            }
            column(Posted; Posted)
            {
            }
            column(PrimaryDirectorate; "Primary Directorate")
            {
            }
            column(StartDate; "Start Date")
            {
            }
            column(StrategyFramework; "Strategy Framework")
            {
            }
            column(StrategyPlanID; "Strategy Plan ID")
            {
            }
            column(SystemCreatedAt; SystemCreatedAt)
            {
            }
            column(SystemCreatedBy; SystemCreatedBy)
            {
            }
            column(SystemId; SystemId)
            {
            }
            column(SystemModifiedAt; SystemModifiedAt)
            {
            }
            column(SystemModifiedBy; SystemModifiedBy)
            {
            }
            column(TotalDepartmentsCount; "Total  Departments Count")
            {
            }
            column(TotalAssignedPCWeight; "Total Assigned PC Weight(%)")
            {
            }
            column(TotalAssignedWeight; "Total Assigned Weight(%)")
            {
            }
            column(TotalBudget; "Total Budget")
            {
            }
            column(TotalWeight; "Total Weight(%)")
            {
            }
            column(UnitofMeasure; "Unit of Measure")
            {
            }
            column(WorkplanNo; "Workplan No")
            {
            }
            column(YearReportingCode; "Year Reporting Code")
            {
            }
            dataitem("Company Information"; "Company Information")
            {
                column(Name_CompanyInformation; "Company Information".Name)
                {
                }
                column(Name2_CompanyInformation; "Company Information"."Name 2")
                {
                }
                column(Address_CompanyInformation; "Company Information".Address)
                {
                }
                column(Address2_CompanyInformation; "Company Information"."Address 2")
                {
                }
                column(City_CompanyInformation; "Company Information".City)
                {
                }
                column(Picture_CompanyInformation; "Company Information".Picture)
                {
                }
                column(PostCode_CompanyInformation; "Company Information"."Post Code")
                {
                }
                column(County_CompanyInformation; "Company Information".County)
                {
                }
            }
            dataitem(BoardActivities; "Board Activities")
            {
                DataItemLink = "AWP No" = FIELD(No);
                column(AchievedTargets_BoardActivities; "Achieved Targets")
                {
                }
                column(ActivityCode_BoardActivities; "Activity Code")
                {
                }
                column(ActivityDescription_BoardActivities; "Activity Description")
                {
                }
                column(AnnualWorkplanAchievedTarget_BoardActivities; "AnnualWorkplan Achieved Target")
                {
                }
                column(AWPNo_BoardActivities; "AWP No")
                {
                }
                column(BoardActivityCode_BoardActivities; "Board Activity Code")
                {
                }
                column(BoardActivityDescription_BoardActivities; "Board Activity Description")
                {
                }
                column(FrameworkPerspective_BoardActivities; "Framework Perspective")
                {
                }
                column(ItemCode_BoardActivities; "Item Code")
                {
                }
                column(KeyPerformanceIndicator_BoardActivities; "Key Performance Indicator")
                {
                }
                column(OutcomePerformanceIndicator_BoardActivities; "Outcome Performance Indicator")
                {
                }
                column(PreviousAnnualTargetQty_BoardActivities; "Previous Annual Target Qty")
                {
                }
                column(PrimaryDepartment_BoardActivities; "Primary Department")
                {
                }
                column(PrimaryDirectorate_BoardActivities; "Primary Directorate")
                {
                }
                column(StrategyFramework_BoardActivities; "Strategy Framework")
                {
                }
                column(SystemCreatedAt_BoardActivities; SystemCreatedAt)
                {
                }
                column(SystemCreatedBy_BoardActivities; SystemCreatedBy)
                {
                }
                column(SystemId_BoardActivities; SystemId)
                {
                }
                column(SystemModifiedAt_BoardActivities; SystemModifiedAt)
                {
                }
                column(SystemModifiedBy_BoardActivities; SystemModifiedBy)
                {
                }
                column(Target_BoardActivities; Target)
                {
                }
                column(UnitofMeasure_BoardActivities; "Unit of Measure")
                {
                }
                column(WT_BoardActivities; "WT(%)")
                {
                }
                column(Variance; Variance)
                {

                }
                // trigger OnAfterGetRecord()

                // begin
                //     BoardActivities.RESET;
                //     BoardActivities.SETRANGE("Activity Code","PC Objective"."Initiative No.");
                //     IF BoardActivities.FINDFIRST THEN BEGIN
                //        TextDescription:=BoardActivities."Board Activity Description";
                //     END;
                // end;
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;

                begin
                    Variance := BoardActivities.Target - BoardActivities."AnnualWorkplan Achieved Target";

                end;
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        // TextDescription: Text;
        Variance: Decimal;
}
