namespace KICD.KICD;
using Microsoft.Foundation.Company;

report 50086 "Staff Establishment"
{
    ApplicationArea = All;
    Caption = 'Staff Establishment';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Staff Establishment.rdlc';
    dataset
    {
        dataitem(StaffEstablishmentPlan; "Staff Establishment Plan")
        {
            column(Code; "Code")
            {
            }
            column(Description; Description)
            {
            }
            column(EffectiveDate; "Effective Date")
            {
            }
            column(External_Document_No_;"External Document No.")
            {

            }
            column(NoofRecruitmentPlans; "No. of Recruitment Plans")
            {
            }
            column(TotalStaffEstablishment; "Total Staff Establishment")
            {
            }
            column(Created_By;"Created By")
            {

            }
            column(Created_On;"Created On")
            {
                
            }
            column(CompLogo;CompInfo.Picture)
            {

            }
            column(CompanyName; CompInfo.Name)
            {
            }
            column(CompanyAddress; CompInfo.Address)
            {
            }
            column(CompanyAddress2; CompInfo."Address 2")
            {
            }
            column(CompanyPostCode; CompInfo."Post Code")
            {
            }
            column(CompanyCity; CompInfo.City)
            {
            }
            column(CompanyPhone; CompInfo."Phone No.")
            {
            }
            dataitem(EstablishmentPlanPosition;"Establishment Plan Position")
            {
                DataItemLink = "Staff Establishment Code" = field(Code);
                column(ActualActive_EstablishmentPlanPosition; "Actual Active")
                {
                }
                column(ActualSuspended_EstablishmentPlanPosition; "Actual Suspended")
                {
                }
                column(ActualTerminated_EstablishmentPlanPosition; "Actual Terminated")
                {
                }
                column(ApprovedNo_EstablishmentPlanPosition; "Approved No.")
                {
                }
                column(DepartmentCode_EstablishmentPlanPosition; "Department Code")
                {
                }
                column(DesignationGroup_EstablishmentPlanPosition; "Designation Group")
                {
                }
                column(DirectorateCode_EstablishmentPlanPosition; "Directorate Code")
                {
                }
                column(JobID_EstablishmentPlanPosition; "Job ID")
                {
                }
                column(JobTitle_EstablishmentPlanPosition; "Job Title")
                {
                }
                column(StaffEstablishmentCode_EstablishmentPlanPosition; "Staff Establishment Code")
                {
                }
                column(Variance_EstablishmentPlanPosition; Variance)
                {
                }
                column(YearCode_EstablishmentPlanPosition; "Year Code")
                {
                }     
            }
            trigger OnAfterGetRecord()
            begin
            CompInfo.Get;
            CompInfo.CalcFields(CompInfo.Picture) 
            end;
            
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
    CompInfo: Record "Company Information";
}
