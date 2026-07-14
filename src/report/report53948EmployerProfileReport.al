namespace ADAK.ADAK;

using Microsoft.Foundation.Company;
using Microsoft.HumanResources.Employee;

report 53948 "Employer Profile Reports"
{
    ApplicationArea = All;
    Caption = 'Employer Profile Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './ADAK PHASE 2/Layouts/Employerr Profile Report.rdlc';

    dataset
    {
        // SECTION A: STATUTORY INFORMATION & SECTION B: ESTABLISHMENT SUMMARY
        dataitem(CompanyInfo; "Company Information")
        {
            column(CompanyName; Name) { }
            column(CompanyName2; "Name 2") { }
            column(CreatedBy; UserId) { }
            column(CreatedDate; CurrentDateTime) { }
            column(Address; Address) { }
            column(Address2; "Address 2") { }
            column(City; City) { }
            column(PostCode; "Post Code") { }
            column(County; County) { }
            column(CountryRegionCode; "Country/Region Code") { }
            column(PhoneNo; "Phone No.") { }
            column(FaxNo; "Fax No.") { }
            column(Email; "E-Mail") { }
            column(HomePage; "Home Page") { }
            column(RegistrationNo; "Registration No.") { }
            column(VATRegistrationNo; "VAT Registration No.") { }
            column(Picture; Picture) { }

            column(CompActiveStaffCount; "Active Staff Count") { }
            column(CompEstablishedPositions; "Established Positions") { }
            column(CompDateEstablished; "Date Established") { }
            column(CompTotalJobGrades; "Total Job Grades") { }
            column(CompApprovedDutyStations; "Approved Duty Stations") { }

            trigger OnAfterGetRecord()
            begin
                CompanyInfo.CalcFields("Active Staff Count", "Established Positions", "Total Job Grades", "Approved Duty Stations", Picture);
            end;
        }

        // JOB GRADING STRUCTURE
        dataitem(JobGrade; "Salary Scales")
        {
            DataItemTableView = sorting(Scale) where(Blocked = const(false));

            column(JobGradeID; Scale) { }
            column(JobGradeDescription; Description) { }
            column(OverallAppointmentAuthority; "Overall Appointment Authority") { }
            column(DefaultSeniorityLevel; "Default Seniority Level") { }
            column(NoOfValidPositions; "No. of Valid Positions") { }
            column(JobGradeActiveStaffCount; "No. of Active Employees") { }

            trigger OnAfterGetRecord()
            begin
                JobGrade.CalcFields("No. of Valid Positions", "No. of Active Employees");
            end;
        }

        // SECTION C: POSITION MANAGEMENT
        dataitem(Position; "Company Positions")
        {
            DataItemTableView = sorting("Position ID") where(Blocked = const(false));

            column(PositionID; "Position ID") { }
            column(JobTitle; "Job Title") { }
            column(DesignationGroup; "Designation Group") { }
            column(PosJobGradeID; "Job Grade ID") { }
            column(Department; Department) { }
            column(PositionActiveStaffCount; PositionActiveStaffCount) { }

            trigger OnAfterGetRecord()
            begin
                // Calculates the active employees holding this specific position
                PositionActiveStaffCount := CalculatePositionActiveStaff("Position ID");
            end;
        }

        // SECTION D: TERMS OF SERVICE
        dataitem(TermsOfService; "Terms of Service")
        {
            DataItemTableView = sorting(Code);

            column(TermsCode; Code) { }
            column(TermsDescription; Description) { }
            column(EmploymentType; "Employment Type") { }
            column(MinAge; "Minumum Employment Age (Years)") { }
            column(MaxAge; "Maximum Employment Age (Years)") { }
            column(TermsActiveStaffCount; "No. of Active Employees") { }

            trigger OnAfterGetRecord()
            begin
                TermsOfService.CalcFields("No. of Active Employees");
            end;
        }

        // SECTION E: DUTY STATIONS
        dataitem(DutyStation; "Duty Station")
        {
            DataItemTableView = sorting(Code) where(Blocked = const(false));

            column(DutyStationCode; Code) { }
            column(DutyStationDescription; Description) { }
            column(RegionID; "Region ID") { }
            column(DutyActiveStaffCount; "No. of Active Employees") { }

            trigger OnAfterGetRecord()
            begin
                DutyStation.CalcFields("No. of Active Employees");
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName) { }
            }
        }
        actions
        {
            area(Processing) { }
        }
    }

    var
        PositionActiveStaffCount: Integer;

    local procedure CalculatePositionActiveStaff(PositionCode: Code[20]): Integer
    var
        Employee: Record Employee;
    begin
        Employee.Reset();
        
        Employee.SetRange("Current Position ID", PositionCode); 
        Employee.SetRange(Status, Employee.Status::Active);
        exit(Employee.Count());
    end;

}