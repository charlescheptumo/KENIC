pageextension 50198 "CompanyInfoPageExt" extends "Company Information"
{
    layout
    {
        addfirst(factboxes)
        {
            part(EstablishmentStats; "EstablishmentStatsFactBox")
            {
                ApplicationArea = All;
                SubPageLink = "Primary Key" = field("Primary Key");
            }
        }
    }
    
    actions
    {
        
        addlast(processing)
        {
            group("Employer Profile")
            {
                Caption = 'Employer Profile';
                Image = Document; 

                action("Core Values")
                {
                    ApplicationArea = All;
                    Caption = 'Core Values';
                    Image = Walton; 
                    RunObject = Page "Core Values";
                    ToolTip = 'View the core values of the organization.';
                }
                action("Departments")
                {
                    ApplicationArea = All;
                    Caption = 'Departments';
                    Image = ServiceDepartment; 
                    RunObject = Page "Responsibility Center List";
                    ToolTip = 'View the departments and responsibility centers.';
                }
                action("Job Grades")
                {
                    ApplicationArea = All;
                    Caption = 'Job Grades';
                    Image = CostAccountingSetup; 
                    RunObject = Page "Job Grades";
                    ToolTip = 'View the job grading structure.';
                }
                action("Positions")
                {
                    ApplicationArea = All;
                    Caption = 'Positions';
                    Image = Job; 
                    RunObject = Page "Positions";
                    ToolTip = 'View all established positions.';
                }
                action("Duty Stations")
                {
                    ApplicationArea = All;
                    Caption = 'Duty Stations';
                    Image = Allocations; 
                    RunObject = Page "Duty Station";
                    ToolTip = 'View all duty stations.';
                }
                action("Terms of Service")
                {
                    ApplicationArea = All;
                    Caption = 'Terms of Service';
                    Image = Certificate; 
                    RunObject = Page "Terms of Service";
                    ToolTip = 'View all terms of service.';
                }
                action("Work Shifts")
                {
                    ApplicationArea = All;
                    Caption = 'Work Shifts';
                    Image = WorkCenter; 
                    RunObject = Page "Employee Work Shift";
                    ToolTip = 'View all work shifts.';
                }
                action("Employer Profile Report")
                {
                    ApplicationArea = All;
                    Caption = 'Employer Profile';
                    Image = Report;
                    
                    RunObject = report "Employer Profile Reports";
                    ToolTip = 'View the Employer Profile & Establishment Report.';
                }
            }
        }
    }
}