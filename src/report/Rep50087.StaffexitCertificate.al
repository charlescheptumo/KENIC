namespace KICD.KICD;
using Microsoft.HumanResources.Employee;
using Microsoft.Foundation.Company;
using Microsoft.Finance.Dimension;
using Microsoft.Inventory.Location;
using Microsoft.Foundation.Address;

report 50087 "Staff exit Certificate"
{
    ApplicationArea = All;
    Caption = 'Staff exit Certificate';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/CertificateofService.rdlc';
    dataset
    {
        dataitem(StaffExit; "Staff Exit")
        {
            RequestFilterFields = "No.","Employee No.";
            column(Address; Address)
            {
            }
            column(Address2; "Address 2")
            {
            }
            column(Age; Age)
            {
            }
            column(AllowReEmploymentInFuture; "Allow Re-Employment In Future")
            {
            }
            column(ApprovalStatus; "Approval Status")
            {
            }
            column(Balance; Balance)
            {
            }
            column(Closed; Closed)
            {
            }
            column(ClosedBy; "Closed By")
            {
            }
            column(DateOfBirth; "Date Of Birth")
            {
            }
            column(DateofLeaving; "Date of Leaving")
            {
            }
            column(DepartmentCode; "Department Code")
            {
            }
            column(DepartmentName; "Department Name")
            {
            }
            column(DivisionName; "Division Name")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(DocumentType; "Document Type")
            {
            }
            column(EMail; "E-Mail")
            {
            }
            column(EmployeeCategory; "Employee Category")
            {
            }
            column(EmployeeName; "Employee Name")
            {
            }
            column(EmployeeNo; "Employee No.")
            {
            }
            column(EmploymentDate; "Employment Date")
            {
            }
            column(ExitDate; "Exit Date")
            {
            }
            column(ExitInterviewComments; "Exit Interview Comments")
            {
            }
            column(ExitInterviewConducted; "Exit Interview Conducted")
            {
            }
            column(ExitInterviewDate; "Exit Interview Date")
            {
            }
            column(ExitQuestionTemplate; "Exit Question Template")
            {
            }
            column(FirstName; "First Name")
            {
            }
            column(Gender; Gender)
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(HasTerminalBenefits; "Has Terminal Benefits")
            {
            }
            column(HasTerminationGrounds; "Has Termination Grounds")
            {
            }
            column(IDNumber; "ID Number")
            {
            }
            column(JobTitle; "Job Title")
            {
            }
            column(LastDateModified; "Last Date Modified")
            {
            }
            column(LastName; "Last Name")
            {
            }
            column(LastWorkingDate; "Last Working Date")
            {
            }
            column(LeaveBalance; "Leave Balance")
            {
            }
            column(LeaveOutstandingBal; "Leave Outstanding Bal")
            {
            }
            column(MiddleName; "Middle Name")
            {
            }
            column(NHIFNo; "N.H.I.F No")
            {
            }
            column(NoofLeaveDaystoUse; "No of Leave Days to Use")
            {
            }
            column(No; "No.")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(NoticePeriod; "Notice Period")
            {
            }
            column(NoticeStartDate; "Notice Start Date")
            {
            }
            column(PIN; "P.I.N")
            {
            }
            column(PhoneNo; "Phone No.")
            {
            }
            column(Position; Position)
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(RegionCode; "Region Code")
            {
            }
            column(RegionName; "Region Name")
            {
            }
            column(RequiresClearance; "Requires Clearance")
            {
            }
            column(RequiresExitInterview; "Requires Exit Interview")
            {
            }
            column(RequiresNotice; "Requires Notice")
            {
            }
            column(RetirementDate; "Retirement Date")
            {
            }
            column(SalaryScale; "Salary Scale")
            {
            }
            column(SocialSecurityNo; "Social Security No.")
            {
            }
            column(StaffExitCode; "Staff Exit Code")
            {
            }
            column(StaffExitDescription; "Staff Exit Description")
            {
            }
            column(UseLeaveDays; "Use Leave Days")
            {
            }
            column(Workstation; Workstation)
            {
            }
            column(Start_Position; Position)
            {
            }
            column(Names;Names)
            {
            }
            column(End_Position; Position1)
            {
            }
            column(CompanyPicture; CompanyInformation.Picture)
            {
            }
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyMotto; CompanyInformation.Motto)
            {
            }

             trigger OnAfterGetRecord()
            begin
                CompanyInformation.get();
                CompanyInformation.CalcFields(Picture);
                FormatAddr.GetCompanyAddr('', ResponsibilityCenter, CompanyInformation, CompanyAddr);
                Employee.Reset;
                Employee.SetRange("No.","Employee No.");
                if Employee.FindFirst() then
                Names:= Employee.FullName();

               
                EmployeeHistory.Reset();
                EmployeeHistory.SetRange("Employee No.", Employee."No.");
                EmployeeHistory.SetRange("Current Organization", true);
                if EmployeeHistory.FindFirst then
                    Positions.Reset();
                Positions.SetRange("Position ID", EmployeeHistory."Job Position");
                if Positions.Find('-') then
                    Position := Positions."Job Title";

                EmployeeHistory1.Reset();
                EmployeeHistory1.SetRange("Employee No.", Employee."No.");
                EmployeeHistory1.SetRange("Current Organization", true);
                if EmployeeHistory1.FindLast then
                    Positions1.Reset();
                Positions1.SetRange("Position ID", EmployeeHistory1."Job Position");
                if Positions1.Find('-') then
                    Position1 := Positions1."Job Title";

                DimensionVal.Reset();
                DimensionVal.SetRange(Code, "Global Dimension 1 Code");
                if DimensionVal.Find('-') then
                    Employee."Region Name" := DimensionVal.Name;
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
    var
        CompanyInformation: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: array[8] of Text[100];
        ResponsibilityCenter: Record "Responsibility Center";
        Names: Text[100];
        EmployeeHistory: Record "Employment History";
        EmployeeHistory1: Record "Employment History";
        Employee: Record Employee;
        Positions: Record Positions;
        Positions1: Record Positions;
        Position: Text[100];
        Position1: Text[100];
        DimensionVal: Record "Dimension Value";
    
}
