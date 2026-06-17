namespace KICD.KICD;
using Microsoft.HumanResources.Employee;
using Microsoft.Foundation.Company;

report 50094 "Disciplinary Per Year"
{
    Caption = 'Disciplinary Per Year';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR DisciplinaryCases Per Year.rdlc';

    dataset
    {
        dataitem(HRDisciplinaryCases; "HR Disciplinary Cases")
        {
            RequestFilterFields = "Financial Year";
            column(Accuser; Accuser)
            {
            }
            column(AccuserIsStaff; "Accuser Is Staff")
            {
            }
            column(ActionTaken; "Action Taken")
            {
            }
            column(ActionTakenDate; "Action Taken Date")
            {
            }
            column(AppealDate; "Appeal Date")
            {
            }
            column(BodyHandlingTheComplaint; "Body Handling The Complaint")
            {
            }
            column(CaseCreated; "Case Created")
            {
            }
            column(CaseDescription; "Case Description")
            {
            }
            column(CaseDiscussion; "Case Discussion")
            {
            }
            column(CaseNumber; "Case Number")
            {
            }
            column(CaseSeverity; "Case Severity")
            {
            }
            column(ClosedBy; "Closed By")
            {
            }
            column(Comments; Comments)
            {
            }
            column(DateToDiscussCase; "Date To Discuss Case")
            {
            }
            column(DateofComplaint; "Date of Complaint")
            {
            }
            column(DisciplinaryCommitee; "Disciplinary Commitee")
            {
            }
            column(DisciplinaryHearing; "Disciplinary Hearing")
            {
            }
            column(DisciplinaryHearingDate; "Disciplinary Hearing Date")
            {
            }
            column(DisciplinaryRemarks; "Disciplinary Remarks")
            {
            }
            column(Disciplinarystatus; "Disciplinary status")
            {
            }
            column(DocumentLink; "Document Link")
            {
            }
            column(EmployeeNo; "Employee No")
            {
            }
            column(HRPayrollImplications; "HR/Payroll Implications")
            {
            }
            column(HandledBy; "Handled By")
            {
            }
            column(InsertedtoPayroll; "Inserted to Payroll")
            {
            }
            column(LegalCaseNo; "Legal Case No.")
            {
            }
            column(LegalCaseRecommendation; "Legal Case Recommendation")
            {
            }
            column(ModeofLodgingtheComplaint; "Mode of Lodging the Complaint")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(PolicyGuidlinesInEffect; "Policy Guidlines In Effect")
            {
            }
            column(Recomendations; Recomendations)
            {
            }
            column(RecommendationActionDate; "Recommendation Action Date")
            {
            }
            column(RecommendedAction; "Recommended Action")
            {
            }
            column(ResponsetoShowCause; "Response to Show Cause")
            {
            }
            column(ResponsibilityCenter; "Responsibility Center")
            {
            }
            column(Selected; Selected)
            {
            }
            column(Status; Status)
            {
            }
            column(SupportDocuments; "Support Documents")
            {
            }
            column(TypeofDisciplinaryCase; "Type of Disciplinary Case")
            {
            }
            column(Witness; Witness)
            {
            }
            column(Witness2; "Witness #2")
            {
            }
            column(Witness1Staff; "Witness#1 Staff")
            {
            }
            column(Witness2Staff; "Witness#2 Staff")
            {
            }
            column(Department;Department)
            {

            }
            column(EmployeeName;EmployeeName)
            {

            }
            column(CompLogo;CompInfo.Picture)
            {

            }
            column(CoName;CompInfo.Name)
            {

            }
            column(FinancialYear;"Financial Year")
            {
                
            }
            trigger OnAfterGetRecord()
            var
            begin
                Employee.Reset();
                Employee.SetRange("No.","Employee No");
                if Employee.FindFirst() then
                Department := Employee.Department;  
                EmployeeName := Employee.FullName();
            end;
            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                CompInfo.Get;
                CompInfo.CalcFields(Picture);
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
    Department: Text;
    Employee: Record Employee;
    CompInfo: Record "Company Information";
    EmployeeName: Text;
}
