namespace ADAK.ADAK;
using Microsoft.Foundation.Company;

report 53948 "Employer Profile Reports"
{
    ApplicationArea = All;
    Caption = 'Employer Profile Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './ADAK PHASE 2/Layouts/Employerr Profile Report.rdlc';

    dataset
    {
        //statory info
        dataitem(CompanyInfo; "Company Information")
        {
            column(CompanyName; Name)
            {
            }
            column(CompanyName2; "Name 2")
            {
            }
            column(CreatedBy; UserId)
            { 

            }
             column(CreatedDate; CurrentDateTime) 
             { 
                
             }
            column(Address; Address)
            {
            }
            column(Address2; "Address 2")
            {
            }
            column(City; City)
            {
            }
            column(PostCode; "Post Code")
            {
            }
            column(County; County)
            {
            }
            column(CountryRegionCode; "Country/Region Code")
            {
            }
            column(PhoneNo; "Phone No.")
            {
            }
            column(FaxNo; "Fax No.")
            {
            }
            column(Email; "E-Mail")
            {
            }
            column(HomePage; "Home Page")
            {
            }
            column(RegistrationNo; "Registration No.")
            {
            }
            column(VATRegistrationNo; "VAT Registration No.")
            {
            }
            column(Picture; Picture)
            {
            }

            column(CompActiveStaffCount; "Active Staff Count")
            {
            }
            column(CompEstablishedPositions; "Established Positions")
            {
            }
            column(CompDateEstablished; "Date Established")
            {
            }
            column(CompTotalJobGrades; "Total Job Grades")
            {
            }
            column(CompApprovedDutyStations; "Approved Duty Stations")
            {
            }

            trigger OnAfterGetRecord()
            begin

                CompanyInfo.CalcFields("Active Staff Count", "Established Positions", "Total Job Grades", "Approved Duty Stations");
            end;
        }

        //job grading structure
        dataitem(JobGrade; "Salary Scales")
        {
            DataItemTableView = sorting(Scale);

            column(JobGradeID; Scale)
            {
            }
            column(JobGradeDescription; Description)
            {
            }
            column(OverallAppointmentAuthority; '')
            {
            }
            column(DefaultSeniorityLevel; '')
            {
            }
            column(NoOfValidPositions; '')
            {
            }
            column(JobGradeActiveStaffCount; '')
            {
            }
        }

        //position management
        dataitem(Position; "Company Positions")
        {
            DataItemTableView = sorting("Position ID");

            column(PositionID; "Position ID")
            {
            }
            column(JobTitle; "Job Title")
            {
            }
            column(DesignationGroup; "Designation Group")
            {
            }
            column(PosJobGradeID; "Job Grade ID")
            {
            }
            column(Department; Department)
            {
            }
            column(PositionActiveStaffCount; '')
            {
            }
        }
        //terms of service
        dataitem(TermsOfService; "Terms of Service")
        {
            DataItemTableView = sorting(Code);

            column(TermsCode; Code)
            {
            }
            column(TermsDescription; Description)
            {
            }
            column(EmploymentType; "Employment Type")
            {
            }
            column(MinAge; "Minumum Employment Age (Years)")
            {
            }
            column(MaxAge; "Maximum Employment Age (Years)")
            {
            }
            column(TermsActiveStaffCount; "No. of Active Employees")
            {
            }
        }

        //Duty section
        dataitem(DutyStation; "Duty Station")
        {
            DataItemTableView = sorting(Code);

            column(DutyStationCode; Code)
            {
            }
            column(DutyStationDescription; Description)
            {
            }
            column(RegionID; "Region ID")
            {
            }
            column(DutyActiveStaffCount; "No. of Active Employees")
            {
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

}