namespace KICD.KICD;

report 50092 "Recruitment Plan Report"
{
    ApplicationArea = All;
    Caption = 'Recruitment Plan Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Recruitmentplan.rdlc';
    dataset
    {
        dataitem(RecruitmentPlan; "Recruitment Plan")
        {
            column(AnnualRecruitmentPlanNo; "Annual Recruitment Plan No.")
            {
            }
            column(ApprovalStatus; "Approval Status")
            {
            }
            column(ApprovedStaffEstablishment; "Approved Staff Establishment")
            {
            }
            column(AverageCostHire; "Average Cost/Hire")
            {
            }
            column(CorporateStrategicPlanID; "Corporate Strategic Plan ID")
            {
            }
            column(CreatedBY; "Created BY")
            {
            }
            column(CreatedOn; "Created On")
            {
            }
            column(Description; Description)
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(EstimatedAnnualSalary; "Estimated Annual Salary")
            {
            }
            column(ExternalDocumentNo; "External Document No")
            {
            }
            column(FinancialYearCode; "Financial Year Code")
            {
            }
            column(FunctionalPlannedHires; "Functional Planned Hires")
            {
            }
            column(GlobalDimension1; "Global Dimension 1")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2; "Global Dimension 2")
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(JobNo; "Job No")
            {
            }
            column(NoofPlannedNewHires; "No. of Planned New Hires")
            {
            }
            column(NoofRecruitmentRequisition; "No. of Recruitment Requisition")
            {
            }
            column(NoofVacancies; "No. of Vacancies")
            {
            }
            column(PlanningEndDate; "Planning End Date")
            {
            }
            column(PlanningStartDate; "Planning Start Date")
            {
            }
            column(RecruitmentPlanType; "Recruitment Plan Type")
            {
            }
            column(TotalRecruitmentBudgetLCY; "Total Recruitment Budget (LCY)")
            {
            }
            dataitem(RecruitmentPlanPosition;"Recruitment Plan Position")
            {
                DataItemLink = "Recruitment Plan ID" = field("Document No.");
                column(CurrentHeadcount_RecruitmentPlanPosition; "Current Headcount")
                {
                }
                column(Department_RecruitmentPlanPosition; Department)
                {
                }
                column(DesignationGroup_RecruitmentPlanPosition; "Designation Group")
                {
                }
                column(Directorate_RecruitmentPlanPosition; Directorate)
                {
                }
                column(JobTitleDesignation_RecruitmentPlanPosition; "Job Title/Designation")
                {
                }
                column(PositionID_RecruitmentPlanPosition; "Position ID")
                {
                }
                column(RecruitmentBudgetCostLCY_RecruitmentPlanPosition; "Recruitment Budget Cost (LCY)")
                {
                }
                column(RecruitmentPlanID_RecruitmentPlanPosition; "Recruitment Plan ID")
                {
                }
                column(StaffEstablishment_RecruitmentPlanPosition; "Staff Establishment")
                {
                }
                column(TargetCandidateSource_RecruitmentPlanPosition; "Target Candidate Source")
                {
                }
                column(TotalPlannedNewHires_RecruitmentPlanPosition; "Total Planned New Hires")
                {
                }
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
}
