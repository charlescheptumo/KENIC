page 60002 "HR Role Center"
{
    Caption = 'Human Capital Role Center';
    PageType = RoleCenter;
    ApplicationArea = All;

    layout
    {
        area(rolecenter)
        {
            part(Control76; "Headline RC Business Manager")
            {
                ApplicationArea = Basic, Suite;
            }
            part("Emails"; "Email Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }
            part("Correspondence Cues"; "Correspondence Cues")
            {
                ApplicationArea = Basic, Suite;
            }

        }
    }

    actions
    {
        area(Reporting)
        {
            action(EmailPayslips)
            {
                Caption = 'Email Payslips';
                ApplicationArea = Basic;
                ToolTip = 'Sends payslips to all employees for the given pay period';
                RunObject = report "Email All Payslips";
            }
        }

        area(Sections)
        {
            group("Company Information1")
            {
                Caption = 'Company Information';
                action("Company Information")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Company Information';
                    RunObject = page "Company Information";
                    ToolTip = 'Executes the Company Information action.';
                }
                action("Base Calendar Card")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Base Calendar Card';
                    RunObject = page "Base Calendar Card";
                    ToolTip = 'Executes the Base Calendar Card action.';
                }
            }
            group("Hr Planning Management")
            {
                Caption = 'Hr Planning Management';
                action("Positions")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Positions';
                    RunObject = page "Positions";
                    ToolTip = 'Executes the Positions action.';
                }
                action("Duty Stations")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Duty Stations';
                    RunObject = page "Duty Stations";
                    ToolTip = 'Executes the Duty Stations action.';
                }
            }
            group("Employee Management")
            {

                action("Employees12")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employees';
                    RunObject = page "Employee List-HR";
                    ToolTip = 'Executes the Employees action.';
                }
                action("Employee List-Casual")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee List-Casual';
                    RunObject = page "Employee List-Casual";
                    ToolTip = 'Executes the Employee List-Casual action.';
                }
                action("Employee List-Temporary")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee List-Temporary';
                    RunObject = page "Temporary Employees List";
                    ToolTip = 'Executes the Employee List-Temporary action.';
                }

                action("Hardship Allowance Setup")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Hardship Allowance Setup';
                    RunObject = page "Hardship Allowance Setup";
                    ToolTip = 'Executes the Hardship Allowance Setup action.';
                }
                action("Employee Transfers History")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Transfers History';
                    RunObject = page "Employee Transfers History";
                    ToolTip = 'Executes the Employee Transfers History action.';
                }
                action("Staff Exits")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Exits';
                    Image = Absence;
                    RunObject = Page "Staff Exits";
                    ToolTip = 'Executes the Staff Exits action.';
                }
                action("Staff Clearance Setup")
                {
                    ApplicationArea = Basic;
                    Image = ClearLog;
                    RunObject = Page "Staff Clearance Setup";
                    ToolTip = 'Executes the Staff Clearance Setup action.';
                }
                group("Reports2")
                {
                    Caption = 'Reports and Analysis';
                    action("Employee List Per Region/Towns")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee List Per Region/Towns';
                        RunObject = page "Employee List";
                        ToolTip = 'Executes the Employee List Per Region/Towns action.';
                    }
                    action("Employee - Absences by Causes1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Absences by Causes';
                        ToolTip = 'Executes the Employee Absences by Causes action.';
                        //   RunObject = report "Employee - Absences by Causes";
                    }
                    action("Employee - Addresses1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Addresses';
                        RunObject = report "Employee - Addresses";
                        ToolTip = 'Executes the Employee Addresses action.';
                    }
                    action("Employee - Alt. Addresses1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Alt. Addresses';
                        RunObject = report "Employee - Alt. Addresses";
                        ToolTip = 'Executes the Employee Alt. Addresses action.';
                    }
                    action("Employee - Birthdays1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Birthdays';
                        RunObject = report "Employee - Birthdays";
                        ToolTip = 'Executes the Employee Birthdays action.';
                    }
                    action("Employee - Confidential Info.1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Confidential Info.';
                        RunObject = report "Employee - Confidential Info.";
                        ToolTip = 'Executes the Employee Confidential Info. action.';
                    }
                    action("Employee - Contracts1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Contracts';
                        RunObject = report "Employee - Contracts";
                        ToolTip = 'Executes the Employee Contracts action.';
                    }
                    action("Employee - Labels1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Labels';
                        RunObject = report "Employee - Labels";
                        ToolTip = 'Executes the Employee Labels action.';
                    }
                    action("Employee - List1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee List';
                        RunObject = report "Employee - List";
                        ToolTip = 'Executes the Employee List action.';
                    }
                    action("Employee - Misc. Article Info.1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Misc. Article Info.';
                        RunObject = report "Employee - Misc. Article Info.";
                        ToolTip = 'Executes the Employee Misc. Article Info. action.';
                    }
                    action("Employee - Qualifications1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Qualifications';
                        RunObject = report "Employee - Qualifications";
                        ToolTip = 'Executes the Employee Qualifications action.';
                    }
                    action("Employee - Relatives1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Relatives';
                        RunObject = report "Employee - Relatives";
                        ToolTip = 'Executes the Employee Relatives action.';
                    }
                    action("Employee - Staff Absences1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Staff Absences';
                        ToolTip = 'Executes the Staff Absences action.';
                        // RunObject = report "Employee - Staff Absences";
                    }
                    action("Employee - Unions1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Unions';
                        RunObject = report "Employee - Unions";
                        ToolTip = 'Executes the Employee Unions action.';
                    }

                }
            }
            group("Establishment")
            {
                Caption = 'Establishment';
                action("Board1")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Board';
                    RunObject = page "Board List";
                    ToolTip = 'Executes the Board action.';
                }
                action("Legal Entities")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Legal Entities';
                    RunObject = page "Legal Entity List";
                    ToolTip = 'Executes the Legal Entities action.';
                }
                action("Directorates1")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Division';
                    RunObject = page "Directorate List";
                    ToolTip = 'Executes the Division action.';
                }
                action("Departments")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Departments';
                    RunObject = page "Department List";
                    ToolTip = 'Executes the Departments action.';
                }
                action("Terms of Service")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Terms of Service';
                    RunObject = page "Terms of Service";
                    ToolTip = 'Executes the Terms of Service action.';
                }
                action("Duty Station")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Duty Station';
                    RunObject = page "Duty Station";
                    ToolTip = 'Executes the Duty Station action.';
                }
                action("Job Grades")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Job Grades';
                    RunObject = page "Job Grades";
                    ToolTip = 'Executes the Job Grades action.';
                }
                action("Designation Groups")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Designation Groups';
                    RunObject = page "Designation Groups";
                    ToolTip = 'Executes the Designation Groups action.';
                }
                action("Employee Work Shift")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Work Shift';
                    RunObject = page "Employee Work Shift";
                    ToolTip = 'Executes the Employee Work Shift action.';
                }
                action("Positions1")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Positions';
                    RunObject = page "Positions";
                    ToolTip = 'Executes the Positions action.';
                }
                action("Global Staff Establishment")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Global Staff Establishment';
                    RunObject = page "Staff Establishment Plans";
                    ToolTip = 'Executes the Global Staff Establishment action.';
                }
                action("Regions List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Regions List';
                    RunObject = page "Regions List";
                    ToolTip = 'Executes the Regions List action.';
                }
                action("Centers")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Centers';
                    RunObject = page "Center List";
                    ToolTip = 'Executes the Centers action.';
                }
                action("Sections1")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Sections';
                    RunObject = page "Section List";
                    ToolTip = 'Executes the Sections action.';
                }
                action("Organization Hierarchy")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Organization Hierarchy';
                    RunObject = page "Organization Hierarchy";
                    ToolTip = 'Executes the Organization Hierarchy action.';
                }
                action("Commitee Types")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Commitee Types';
                    RunObject = page "Commitee Types";
                    ToolTip = 'Executes the Commitee Types action.';
                }
                action("Domain Area")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Domain Area';
                    RunObject = page "Domain Area";
                    ToolTip = 'Executes the Domain Area action.';
                }
                action("HR Committee Appointment")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'HR Committee Appointment List';
                    RunObject = page "HR Committee Appointment List";
                    ToolTip = 'Executes the HR Committee Appointment List action.';
                }
                group("Reports11")
                {
                    caption = 'Reports';
                    action("Staff Establishment")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Staff Establishment';
                        ToolTip = 'Executes the Staff Establishment action.';
                        //   RunObject = report "Staff Establishment";
                    }
                    action("Detailed Staff Establishment")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Detailed Staff Establishment';
                        ToolTip = 'Executes the Detailed Staff Establishment action.';
                        //   RunObject = report "Detailed Staff Establishment";
                    }
                }


            }
            group("Recruitment  & Selection")
            {
                Caption = 'Recruitment  & Selection';
                group("Pre-Hire Preparation")
                {
                    action("HR Officers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'HR Officers';
                        RunObject = page "HR Officers";
                        ToolTip = 'Executes the HR Officers action.';
                    }
                    action("Recruitment Agencies")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Recruitment Agencies';
                        RunObject = page "Recruitment Agencies";
                        ToolTip = 'Executes the Recruitment Agencies action.';
                    }
                    action("Hr Guiding Principle")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Hr Guiding Principle';
                        RunObject = page "Hr Guiding Principle";
                        ToolTip = 'Executes the Hr Guiding Principle action.';
                    }
                    action("HR Document Template")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'HR Document Template';
                        RunObject = page "Document Template-HR";
                        ToolTip = 'Executes the HR Document Template action.';
                    }
                    action("Recruitment Reasons")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Recruitment Reasons';
                        RunObject = page "Recruitment Reasons";
                        ToolTip = 'Executes the Recruitment Reasons action.';
                    }
                    action("Job Boards")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Job Boards';
                        RunObject = page "Job Boards.";
                        ToolTip = 'Executes the Job Boards action.';
                    }
                    action("Functional Recruitment Plans")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Functional Recruitment Plans';
                        RunObject = page "Functional Recruitment Plans";
                        ToolTip = 'Executes the Functional Recruitment Plans action.';
                    }
                    action("Annual Recruitment Plans")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Annual Recruitment Plans';
                        RunObject = page "Recruitment Plans";
                        ToolTip = 'Executes the Annual Recruitment Plans action.';
                    }
                    action("Recruitment Requisitions")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Recruitment Requisitions';
                        RunObject = page "Recruitment Requisitions";
                        ToolTip = 'Executes the Recruitment Requisitions action.';
                    }
                    action("Employer Information")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employer Profile';
                        RunObject = page "Company Information";
                        ToolTip = 'Executes the Employer Profile action.';
                    }
                    action("Employee List")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee List';
                        RunObject = page "Employee List";
                        ToolTip = 'Executes the Employee List action.';
                    }
                    action("Qualifications Invetory")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Qualifications Inventory';
                        RunObject = page "Qualifications";
                        ToolTip = 'Executes the Qualifications Inventory action.';
                    }
                    action("Created Vacancies")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Created Vacancies';
                        RunObject = page "Created Vacancies";
                        ToolTip = 'Executes the Created Vacancies action.';
                    }
                    action("Career Fair Vouchers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Career Fair Vouchers';
                        RunObject = page "Career Fair Vouchers";
                        ToolTip = 'Executes the Career Fair Vouchers action.';
                    }
                    action("Vacancy Announcement Vouchers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Vacancy Announcement Vouchers';
                        RunObject = page "Vacancy Announcement Vouchers";
                        ToolTip = 'Executes the Vacancy Announcement Vouchers action.';
                    }
                    action("Recruitment Agency Vouchers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Recruitment Agency Vouchers';
                        RunObject = page "Recruitment Agency Vouchers";
                        ToolTip = 'Executes the Recruitment Agency Vouchers action.';
                    }
                    action("Partially Filled Vacancies")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Partially Filled Vacancies';
                        RunObject = page "Vacancies";
                        ToolTip = 'Executes the Partially Filled Vacancies action.';
                    }
                    action("Fully Filled Vacancies")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Fully Filled Vacancies';
                        RunObject = page "Vacancies";
                        ToolTip = 'Executes the Fully Filled Vacancies action.';
                    }
                    action("Approved Vacancy Announcement Vouchers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Approved Vacancy Announcement Vouchers';
                        RunObject = page "Approved Vacancy Ann Vouchers";
                        ToolTip = 'Executes the Approved Vacancy Announcement Vouchers action.';
                    }
                    action("Published Announcement Vouchers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Published Announcement Vouchers';
                        RunObject = page "Published Ann Vouchers";
                        ToolTip = 'Executes the Published Announcement Vouchers action.';
                    }
                    action("Declaration Setup")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Declaration Setup';
                        RunObject = page "Declaration Setup";
                        ToolTip = 'Executes the Declaration Setup action.';
                    }
                    action("Close Ended Qn Type")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Close Ended Qn Type';
                        RunObject = page "Close Ended Qn Type";
                        ToolTip = 'Executes the Close Ended Qn Type action.';
                    }
                    action("Pre-Screening Templates")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Pre-Screening Templates';
                        RunObject = page "Pre-Screening Templates";
                        ToolTip = 'Executes the Pre-Screening Templates action.';
                    }
                    action("Job Grades11")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Job Grades';
                        RunObject = page "Job Grades";
                        ToolTip = 'Executes the Job Grades action.';
                    }
                    action("Domain Area1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Domain Area';
                        RunObject = page "Domain Area";
                        ToolTip = 'Executes the Domain Area action.';
                    }
                    group("reports123")
                    {
                        caption = 'Reports';

                        action("Detailed Manpower Plan")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Detailed Manpower Plan';
                            ToolTip = 'Executes the Detailed Manpower Plan action.';
                            //  RunObject = report "Staff Establishment";
                        }
                        action("Recruitment  Requisition List")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Recruitment  Requisition List';
                            ToolTip = 'Executes the Recruitment  Requisition List action.';
                            //  RunObject = report "Staff Establishment";
                        }
                        action("Vacancies List")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Vacancies List';
                            ToolTip = 'Executes the Vacancies List action.';
                            // RunObject = report "Vacancies List";
                        }
                        action("Vacancy Announcements List")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Vacancy Announcements List';
                            ToolTip = 'Executes the Vacancy Announcements List action.';
                            // RunObject = report "Vacancy Announcements List";
                        }
                    }
                }
                group("Application & Selection")
                {
                    action("Candidates")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Candidates';
                        RunObject = page "Candidates";
                        ToolTip = 'Executes the Candidates action.';
                    }

                    action("Open Vacancies")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Open Vacancies';
                        RunObject = page "Vacancies";
                        RunPageLink = "Approval Status" = filter(Open);
                        ToolTip = 'Executes the Open Vacancies action.';
                    }
                    action("Job Applications")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Job Applications';
                        RunObject = page "Job Applications";
                        ToolTip = 'Executes the Job Applications action.';
                    }

                    action("Commitee Appointment Vouchers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Commitee Appointment Vouchers';
                        RunObject = page "Commitee Appointment Vouchers";
                        ToolTip = 'Executes the Commitee Appointment Vouchers action.';
                    }
                    action("Candidate Shortlist Criteria")
                    {
                        ApplicationArea = BasicHR;
                        RunObject = page "Candidate Shortlist Criteria";
                        ToolTip = 'Executes the Candidate Shortlist Criteria action.';
                    }
                    action("Recruitment Req Requirement")
                    {
                        ApplicationArea = BasicHR;
                        RunObject = page "Recruitment Req Requirement";
                        ToolTip = 'Executes the Recruitment Req Requirement action.';
                    }
                    action("Shortlist Vouchers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Shortlist Vouchers';
                        RunObject = page "Candidate Shortlist Vouchers";
                        ToolTip = 'Executes the Shortlist Vouchers action.';
                    }

                    action("Interview Invitations")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Interview Invitations';
                        RunObject = page "Interview Invitations";
                        ToolTip = 'Executes the Interview Invitations action.';
                    }
                    action("Interview Records")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Interview Records';
                        RunObject = page "Candidate Interview Records";
                        ToolTip = 'Executes the Interview Records action.';
                    }
                    action("Consolidated Interview Records")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Consolidated Interview Records';
                        RunObject = page "Consolidated Interview Records";
                        ToolTip = 'Executes the Consolidated Interview Records action.';
                    }
                    action("Closed Vacancies")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Closed Vacancies';
                        RunObject = page "Vacancies";
                        RunPageLink = "Vacancy Status" = filter(Closed), "Approval Status" = filter(Released);
                        ToolTip = 'Executes the Closed Vacancies action.';
                    }
                    action("Rejected Job Offers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Rejected Job Offers';
                        RunObject = page "Rejected Job Offers";
                        ToolTip = 'Executes the Rejected Job Offers action.';
                    }
                    group("Administration2121")
                    {
                        caption = 'Administration';
                        action("Job Board")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Job Board';
                            RunObject = page "Job Boards.";
                            ToolTip = 'Executes the Job Board action.';
                        }
                        action("Hobby Types")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Hobby Types';
                            RunObject = page "Hobby Types";
                            ToolTip = 'Executes the Hobby Types action.';
                        }
                        action("Disability Code")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Disability Code';
                            RunObject = page "Disability Code";
                            ToolTip = 'Executes the Disability Code action.';
                        }
                        action("Ethnic Groups")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Ethnic Groups';
                            RunObject = page "Ethnic Groups";
                            ToolTip = 'Executes the Ethnic Groups action.';
                        }
                        action("System Shortlisted Application")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'System Shortlisted Application';
                            RunObject = page "System Shortlisted Application";
                            ToolTip = 'Executes the System Shortlisted Application action.';
                        }
                        action("Background Checks")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Background Checks';
                            RunObject = page "Background Checks";
                            ToolTip = 'Executes the Background Checks action.';
                        }
                        action("Medical Check Reports")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Medical Check Reports';
                            RunObject = page "Medical Check Reports";
                            ToolTip = 'Executes the Medical Check Reports action.';
                        }
                        action("Apptitude Question")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Apptitude Question';
                            RunObject = page "Apptitude Question";
                            ToolTip = 'Executes the Apptitude Question action.';
                        }
                        action("Ability Test Responses")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Ability Test Responses';
                            RunObject = page "Ability Responses";
                            ToolTip = 'Executes the Ability Test Responses action.';
                        }
                        action("Interview Scoresheet Templates")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Interview Scoresheet Templates';
                            RunObject = page "Interview Scoresheet Templates";
                            ToolTip = 'Executes the Interview Scoresheet Templates action.';
                        }

                        action("Medical History Setup")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Medical History Setup';
                            RunObject = page "Medical History Setup";
                            ToolTip = 'Executes the Medical History Setup action.';
                        }
                        action("Medical Examination Type")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Medical Examination Type';
                            RunObject = page "Medical Examination Type";
                            ToolTip = 'Executes the Medical Examination Type action.';
                        }
                        action("Referee Recommendation")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Referee Recommendation';
                            RunObject = page "Referee Recommendation";
                            ToolTip = 'Executes the Referee Recommendation action.';
                        }
                        action("Medical Check Templates")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Medical Check Templates';
                            RunObject = page "Medical Check Templates";
                            ToolTip = 'Executes the Medical Check Templates action.';
                        }
                        action("Shortlisting Score Code")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Shortlisting Score Code';
                            RunObject = page "Shortlisting Score Code";
                            ToolTip = 'Executes the Shortlisting Score Code action.';
                        }
                        action("Published Vacancies List")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Published Vacancies List';
                            RunObject = page "All Published  Vacancies List";
                            ToolTip = 'Executes the Published Vacancies List action.';
                        }
                        action("Shortlisted Canditate Report")
                        {
                            ApplicationArea = All;
                            Caption = 'Shortlisted Canditates Report';
                            RunObject = Report "Shortlisted Canditates Report";
                        }
                    }


                }
                group("Appointment & Onboarding")
                {
                    action("Employees23")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employees';
                        RunObject = page "Employee List";
                        ToolTip = 'Executes the Employees action.';
                    }
                    action("Employee Contracts")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Contracts';
                        RunObject = page "Contract List";
                        ToolTip = 'Executes the Employee Contracts action.';
                    }
                    action("Employment Offers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employment Offers';
                        RunObject = page "Employment Offers";
                        ToolTip = 'Executes the Employment Offers action.';
                    }
                    action("Terminated Employee Contracts")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Terminated Employee Contracts';
                        RunObject = page "Employee List";
                        ToolTip = 'Executes the Terminated Employee Contracts action.';
                    }
                    action("Employee Statistics Groups1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Statistics Groups';
                        RunObject = page "Employee Statistics Groups";
                        ToolTip = 'Executes the Employee Statistics Groups action.';
                    }
                    action("Employee Contract Groups")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Contract Groups';
                        RunObject = page "Employee Statistics Groups";
                        ToolTip = 'Executes the Employee Contract Groups action.';
                    }
                    action("Employee Background Check")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Background Checks';
                        RunObject = page "Background Checks Card";
                        ToolTip = 'Executes the Employee Background Checks Card.';
                    }

                }
                group("Recruitment & Selection Reports")
                {
                    Caption = 'Reports';
                    action("Shortlisted Canditates Report")
                    {
                        ApplicationArea = All;
                        Caption = 'Shortlisted Canditates Report';
                        RunObject = Report "Shortlisted Canditates Report";
                    }


                }
            }
            group("Leave Management")
            {
                Caption = 'Leave Management';
                group("Setup")
                {
                    action("HR Leave Periods")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'HR Leave Periods';
                        RunObject = page "HR Leave Periods";
                        ToolTip = 'Executes the HR Leave Periods action.';
                    }
                    action("Base Leave Calender")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Base Leave Calender';
                        RunObject = page "Base Calendar Card";
                        ToolTip = 'Executes the Base Leave Calender action.';
                    }
                    action("HR Leave Types")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'HR Leave Types';
                        RunObject = page "HR Leave Types";
                        ToolTip = 'Executes the HR Leave Types action.';
                    }

                    action("Leave Adjustment")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Leave Adjustment';
                        RunObject = page "HR Leave Adjustment";
                        ToolTip = 'Executes the Leave Adjustment action.';
                    }
                    action("Leave Batches")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Leave Batches';
                        RunObject = page "HR Leave Batches";
                        ToolTip = 'Executes the Leave Batches action.';
                    }

                }

                group("Leave Management List")
                {
                    action("Leave Application")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Leave Applications';
                        RunObject = page "Leave Applications List";
                        ToolTip = 'Executes the Leave Applications action.';
                    }
                    action("Leave Planner List")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Leave Planner List';
                        RunObject = page "Leave Planner List";
                        ToolTip = 'Executes the Leave Planner List action.';
                    }
                    action("Employee Leave Balances")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Leave Balances';
                        RunObject = page "Employee Leave Balances";
                        ToolTip = 'Executes the Employee Leave Balances action.';
                    }

                    action("Approved Leave Applications")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Approved Leave Applications';
                        RunObject = page "Approved Leave Applications";
                        ToolTip = 'Executes the Approved Leave Applications action.';
                    }
                    action("Posted Leave Applications")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Posted Leave Applications';
                        RunObject = page "Posted Leave Applications..";
                        ToolTip = 'Executes the Posted Leave Applications action.';
                    }
                    action("Leave Recall Application")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Leave Recall Applications';
                        RunObject = page "Leave Application Recall";
                        ToolTip = 'Executes the Leave Recall Applications action.';
                    }

                    action("Additional Leave Days Memos")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Additional Leave Days Memos';
                        RunObject = page "Additional Leave Days Memos";
                        ToolTip = 'Executes the Additional Leave Days Memos action.';
                    }
                    action("Approved Additional Leave Days Memos")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Approved Additional Leave Days Memos';
                        RunObject = page "App. Add. Leave Days Memos";
                        ToolTip = 'Executes the Approved Additional Leave Days Memos action.';
                    }
                    action("Posted Additional Leave Days Memos")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Posted Additional Leave Days Memos';
                        RunObject = page "Posted Add. Leave Days Memos";
                        ToolTip = 'Executes the Posted Additional Leave Days Memos action.';
                    }
                }
                group("Leave Recall")
                {
                    Visible = false;
                    action("Leave Recalls")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Leave Recalls';
                        RunObject = page "Leave Application Recall";
                        ToolTip = 'Executes the Leave Recalls action.';
                    }
                }
                group("Reports999999")
                {
                    Caption = 'Reports';
                    // action("Leave Application Form")
                    // {
                    //     ApplicationArea = BasicHR;
                    //     Caption = 'Leave Application Form';
                    //     // RunObject = Report "Leave Application Form";
                    // }
                    action("Employee Leave Approval ")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Leave Approval Report';
                        RunObject = Report "Leave Approval Report";
                        ToolTip = 'Executes the Employee Leave Approval Report action.';
                    }
                    action("Employee Leave Balance")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Leave Balances';
                        RunObject = Report "HR Leave Balance";
                        ToolTip = 'Executes the Employee Leave Balances action.';
                    }
                    action("Employee Leave Allowance Payment Status")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Leave Allowance Payment Status';
                        RunObject = Report "HR Leave Allowance Status";
                        ToolTip = 'Executes the Employee Leave Allowance Payment Status action.';
                    }
                    // action("HR Leave Liability Report KURA")
                    // {
                    //     ApplicationArea = BasicHR;
                    //     Caption = 'HR Leave Liability Report KURA';
                    //     //RunObject = Report "HR Leave Liability Report KeRR";
                    // }
                }

            }
            group("Welfare Management")
            {
                Caption = 'Welfare Management';
                Image = HumanResources;
                action("Request Welfare Membership")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request Welfare Membership';
                    Image = Employee;
                    RunObject = Page "Requests Welfare Membership";
                    ToolTip = 'Executes the Request Welfare Membership action.';
                }
                action("Welfare Members List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Welfare Members List';
                    Image = Employee;
                    RunObject = Page "Welfare Members List";
                    ToolTip = 'Executes the Welfare Members List action.';
                }
                action("Request Welfare benefit")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request Welfare benefit';
                    Image = Employee;
                    RunObject = Page "Requests Welfare Benefit";
                    ToolTip = 'Executes the Request Welfare benefit action.';
                }
                action("Welfare Contributions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Welfare Contributions';
                    Image = Employee;
                    RunObject = Page "Welfare Contributions";
                    ToolTip = 'Executes the Welfare Contributions action.';
                }
            }
            group("Discplinary Case Management")
            {
                Caption = 'Discplinary Case Management';
                action("Employee Discplinary List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Discplinary List';
                    RunObject = page "Hr New Discplinary List";
                    ToolTip = 'Executes the Employee Discplinary List action.';
                }
                action("Discplinary Files List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Discplinary Files List';
                    RunObject = page "Hr Discplinary List";
                    ToolTip = 'Executes the Discplinary Files List action.';
                }

                action("Disciplinary Committee")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Disciplinary Committee';
                    RunObject = page "Disciplinary Committee";
                    ToolTip = 'Executes the Disciplinary Committee action.';
                }
                action("Disciplinary Deduction Setup")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Disciplinary Deduction Setup';
                    RunObject = page "Disciplinary Status";
                    ToolTip = 'Executes the Disciplinary Deduction Setup action.';
                    visible = false;
                }
                group("Reports2323")
                {
                    Caption = 'Reports';
                    action("Disciplinary Cases Report")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Disciplinary Cases Report';
                        ToolTip = 'Executes the Disciplinary Cases Report action.';
                        RunObject = report "HR Cases Report";
                    }
                    action("Disciplinary Cases Report per Employee")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Disciplinary Cases Report per Employee';
                        ToolTip = 'Executes the Disciplinary Cases Report per Employee action.';
                        RunObject = Report "Disciplinary Cases per Employe";
                    }
                    action("Disciplinary Cases Report per Year")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Disciplinary Cases Report per Year';
                        ToolTip = 'Executes the Disciplinary Cases Report per Dept action.';
                        RunObject = Report "Disciplinary Per Year";
                    }

                }


            }
            group("Overtime Management")
            {
                Caption = 'Overtime Management';
                action("Overtime List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Overtime List';
                    RunObject = page "Overtime List";
                    ToolTip = 'Executes the Overtime List action.';
                }
                action("Approved Overtime")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Approved Overtime';
                    RunObject = page "Approved Overtime List";
                    ToolTip = 'Executes the Approved Overtime action.';
                }
                action("Overtime Report")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Overtime Report';
                    ToolTip = 'Executes the Overtime Report action.';
                    //  RunObject = report "Overtime Report";
                }
                action("Overtime Types")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Overtime Types';
                    RunObject = page "Overtime Types";
                    ToolTip = 'Executes the Overtime Types action.';
                }
            }
            group("Absence Registration")
            {
                Caption = 'Absence Registration';
                Visible = false;
                action("Causes of Absence")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Causes of Absence';
                    RunObject = page "Causes of Absence";
                    ToolTip = 'Executes the Causes of Absence action.';
                }
                action("Absence Registration12")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Absence Registration';
                    RunObject = page "Absence Registration";
                    ToolTip = 'Executes the Absence Registration action.';
                }
                action("Staff Absences")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Staff Absences';
                    RunObject = report "Employee - Staff Absences";
                    ToolTip = 'Executes the Staff Absences action.';
                }
                action("Employee Absences by Causes")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Absences by Causes';
                    RunObject = report "Employee - Absences by Causes";
                    ToolTip = 'Executes the Employee Absences by Causes action.';
                }
            }


            group("Group")
            {
                Caption = 'Employees';
                action("Employees")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employees';
                    RunObject = page "Employee List";
                    ToolTip = 'Executes the Employees action.';
                }
                action("Absence Registration1")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Absence Registration';
                    RunObject = page "Absence Registration";
                    ToolTip = 'Executes the Absence Registration action.';
                    Visible = false;

                }
                group("Group1")
                {
                    Caption = 'Reports';
                    action("Employee - Absences by Causes")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Absences by Causes';
                        ToolTip = 'Executes the Employee Absences by Causes action.';
                        Visible = false;
                        //   RunObject = report "Employee - Absences by Causes";
                    }
                    action("Employee - Addresses")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Addresses';
                        RunObject = report "Employee - Addresses";
                        ToolTip = 'Executes the Employee Addresses action.';
                    }
                    action("Employee - Alt. Addresses")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Alt. Addresses';
                        RunObject = report "Employee - Alt. Addresses";
                        ToolTip = 'Executes the Employee Alt. Addresses action.';
                    }
                    action("Employee - Birthdays")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Birthdays';
                        RunObject = report "Employee - Birthdays";
                        ToolTip = 'Executes the Employee Birthdays action.';
                    }
                    action("Employee - Confidential Info.")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Confidential Info.';
                        RunObject = report "Employee - Confidential Info.";
                        ToolTip = 'Executes the Employee Confidential Info. action.';
                    }
                    action("Employee - Contracts")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Contracts';
                        RunObject = report "Employee - Contracts";
                        ToolTip = 'Executes the Employee Contracts action.';
                    }
                    action("Employee - Labels")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Labels';
                        RunObject = report "Employee - Labels";
                        ToolTip = 'Executes the Employee Labels action.';
                    }
                    action("Employee - List")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee List';
                        RunObject = report "Employee - List";
                        ToolTip = 'Executes the Employee List action.';
                    }
                    action("Employee - Misc. Article Info.")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Misc. Article Info.';
                        RunObject = report "Employee - Misc. Article Info.";
                        ToolTip = 'Executes the Employee Misc. Article Info. action.';
                    }
                    action("Employee - Qualifications")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Qualifications';
                        RunObject = report "Employee - Qualifications";
                        ToolTip = 'Executes the Employee Qualifications action.';
                    }
                    action("Employee - Relatives")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Relatives';
                        RunObject = report "Employee - Relatives";
                        ToolTip = 'Executes the Employee Relatives action.';
                    }
                    action("Employee - Staff Absences")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Staff Absences';
                        ToolTip = 'Executes the Staff Absences action.';
                        // RunObject = report "Employee - Staff Absences";
                    }
                    action("Employee - Unions")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Unions';
                        RunObject = report "Employee - Unions";
                        ToolTip = 'Executes the Employee Unions action.';
                    }
                }
            }
            group("Occupational Safety & Health")
            {
                Visible = false;
                group("OSH Governance & Planning")
                {
                    group("Lists and Tasks")
                    {
                        action("Board")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Committee';
                            RunObject = page 80014;
                            ToolTip = 'Executes the Committee action.';
                        }
                        action("Directorates")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Directorates';
                            RunObject = page 80016;
                            ToolTip = 'Executes the Directorates action.';
                        }
                        action("Sections")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Sections';
                            RunObject = page 80020;
                            ToolTip = 'Executes the Sections action.';
                        }
                        action("OSH Mnagement Roles")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'OSH Mnagement Roles';
                            RunObject = page 69496;
                            ToolTip = 'Executes the OSH Mnagement Roles action.';
                        }
                        action("Employees1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Employees';
                            RunObject = page 5201;
                            ToolTip = 'Executes the Employees action.';
                        }
                        action("Projects")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Projects';
                            RunObject = page 89;
                            ToolTip = 'Executes the Projects action.';
                        }
                        action("OSH Framework")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'OSH Framework';
                            RunObject = page 69400;
                            ToolTip = 'Executes the OSH Framework action.';
                        }
                        action("OSH Management Plans")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'OSH Management Plans';
                            RunObject = page 69447;
                            ToolTip = 'Executes the OSH Management Plans action.';
                        }
                    }
                    group("Report & Analysis")
                    {
                        action("OSH Framework Summary")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'OSH Framework Summary';
                            ToolTip = 'Executes the OSH Framework Summary action.';
                            //  RunObject = report 69450;
                        }
                        action("OSH Mnagement Plan Summary")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'OSH Mnagement Plan Summary';
                            ToolTip = 'Executes the OSH Mnagement Plan Summary action.';
                            //  RunObject = report 69451;
                        }
                    }
                    group("Administration")
                    {
                        action("Hazard Types")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Hazard Types';
                            RunObject = page 69401;
                            ToolTip = 'Executes the Hazard Types action.';
                        }
                        action("Hazard Identification Methods")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Hazard Identification Methods';
                            RunObject = page 69427;
                            ToolTip = 'Executes the Hazard Identification Methods action.';
                        }
                        action("Evacuation Events1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Evacuation Events';
                            RunObject = page "Evacuation Events";
                            ToolTip = 'Executes the Evacuation Events action.';
                        }
                        action("Workplace Prohibited Items")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Workplace Prohibited Items';
                            RunObject = page "Workplace Prohibited Items";
                            ToolTip = 'Executes the Workplace Prohibited Items action.';
                        }
                        action("HSE Equipment Categorxies")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'HSE Equipment Categories';
                            //  RunObject = page 69423;
                            RunObject = page "HSE Equipment Category";
                            ToolTip = 'Executes the HSE Equipment Categories action.';
                        }
                        action("Safe Work Permit Types1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Safe Work Permit Types';
                            RunObject = page 69413;
                            ToolTip = 'Executes the Safe Work Permit Types action.';
                        }
                        action("Safety Workgroups")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Safety Workgroups';
                            ToolTip = 'Executes the Safety Workgroups action.';
                            //  RunObject = page 69419;
                        }
                        action("Safety Rules & Regulations Templates")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Safety Rules & Regulations Templates';
                            RunObject = page 69432;
                            ToolTip = 'Executes the Safety Rules & Regulations Templates action.';
                        }
                        action("Safety Inspection Templates1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Safety Inspection Templates';
                            RunObject = page 69439;
                            ToolTip = 'Executes the Safety Inspection Templates action.';
                        }
                        action("OSH Legal Instruments")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'OSH Legal Instruments';
                            RunObject = page "OSH Legal Instruments";
                            ToolTip = 'Executes the OSH Legal Instruments action.';
                        }
                        action("Incident Severity Levels1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Incident Severity Levels';
                            RunObject = page 69490;
                            ToolTip = 'Executes the Incident Severity Levels action.';
                        }
                        action("Incident Party Types1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Incident Party Levels';
                            RunObject = page 69492;
                            ToolTip = 'Executes the Incident Party Levels action.';
                        }
                    }
                }
                group("OSH Operations")
                {
                    // group("Lists and Tasks1")
                    // {
                    //     caption = 'Lists and Tasks';
                    action("Safety Eequipment Register")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Safety Equipment Register';
                        RunObject = page 69470;
                        ToolTip = 'Executes the Safety Equipment Register action.';
                    }
                    action("OSH Training Register")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'OSH Training Register';
                        Visible = false;
                        RunObject = page 69566;
                        ToolTip = 'Executes the OSH Training Register action.';
                    }
                    action("OSH Meeting Register")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'OSH Meeting Register';
                        Visible = false;
                        RunObject = page 69565;
                        ToolTip = 'Executes the OSH Meeting Register action.';
                    }
                    action("Hazard Insurance Register")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Hazard Insurance Register';
                        RunObject = page 69470;
                        ToolTip = 'Executes the Hazard Insurance Register action.';
                    }
                    action("Safe Work Permit Applications")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Safe Work Permits';
                        Visible = false;
                        RunObject = page 69482;
                        ToolTip = 'Executes the Safe Work Permits action.';
                    }
                    action("Safe Work Completion Reports")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Safe Work Permits COM';
                        Visible = false;
                        RunObject = page 69507;
                        ToolTip = 'Executes the Safe Work Permits COM action.';
                    }
                    action("Emergency Drill Logs")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Drill Reports';
                        RunObject = page "Emergency Drill Logs";
                        ToolTip = 'Executes the Drill Reports action.';
                    }
                    action("Risk Incident Reports")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Risk Incident Reports';
                        RunObject = page 95104;
                        ToolTip = 'Executes the Risk Incident Reports action.';
                    }
                    action("OSH Inspection Vouchers")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'OSH Inspections';
                        RunObject = page 69532;
                        ToolTip = 'Executes the OSH Inspections action.';
                    }
                    action("OSH Status Reports")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'OSH Status Reports';
                        Visible = false;
                        RunObject = page 69439;
                        ToolTip = 'Executes the OSH Status Reports action.';
                    }

                    group("Reports & Analysis")
                    {
                        action("Safety Equipment List")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Safety Equipment List';
                            Visible = false;
                            ToolTip = 'Executes the Safety Equipment List action.';
                            //  RunObject = report 69459;
                        }
                        action("OSH Training List")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'OSH Training List';
                            Visible = false;
                            ToolTip = 'Executes the OSH Training List action.';
                            // RunObject = page 69460;
                        }
                        action("OSH Meeting  List")
                        {
                            ApplicationArea = BasicAdmin;
                            Visible = false;
                            Caption = 'OSH Meeting  List';
                            ToolTip = 'Executes the OSH Meeting  List action.';
                            // RunObject = page 69461;
                        }
                        action("Hazard Insurance List")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Hazard Insurance List';
                            Visible = false;
                            ToolTip = 'Executes the Hazard Insurance List action.';
                            // RunObject = page 69462;
                        }
                        action("Safe Work Permit Application  List")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Safe Work Permit Application  List';
                            Visible = false;
                            ToolTip = 'Executes the Safe Work Permit Application  List action.';
                            // RunObject = page 69463;
                        }
                        action("Emergency Drill List")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Emergency Drill List';
                            Visible = false;
                            ToolTip = 'Executes the Emergency Drill List action.';
                            // RunObject = page 69464;
                        }
                        action("Risk Incident Log List")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Risk Incident Log List';
                            Visible = false;
                            ToolTip = 'Executes the Risk Incident Log List action.';
                            // RunObject = page 69465;
                        }
                        action("OSH Inspection List")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'OSH Inspection List';
                            Visible = false;
                            ToolTip = 'Executes the OSH Inspection List action.';
                            // RunObject = page 69466;
                        }
                        group("Archieve")
                        {
                            action("Issued Safe Work Permits")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Issued Safe Work Permits';
                                RunObject = page "Safe Work Permits";
                                Visible = false;
                                ToolTip = 'Executes the Issued Safe Work Permits action.';
                            }
                            action("Denied Safe Work Permits")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Denied Safe Work Permits';
                                RunObject = page "Safe Work Permits";
                                Visible = false;
                                ToolTip = 'Executes the Denied Safe Work Permits action.';
                            }
                            action("Posted Emergency Drills")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Posted Drills';
                                RunObject = page "Emergency Drill Logs";
                                ToolTip = 'Executes the Posted Drills action.';
                            }

                            action("Posted Risk Incident Reports")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Posted Risk Incident Reports';
                                RunObject = page "Risk Incident Logs";
                                ToolTip = 'Executes the Posted Risk Incident Reports action.';
                            }
                            action("Posted OSH Inspection Vouchers")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Posted OSH Inspections';
                                RunObject = page "Inspection Templates";
                                ToolTip = 'Executes the Posted OSH Inspections action.';
                            }
                            // }


                        }
                        group("Administration1")
                        {
                            Caption = 'Administration';
                            Visible = false;
                            action("Safety Equipment Categories")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Safety Equipment Categories';
                                ToolTip = 'Executes the Safety Equipment Categories action.';
                                // RunObject = page "HSE Equipment Categorxies";
                            }
                            action("Hazard Types1")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Hazard Types';
                                RunObject = page 69401;
                                ToolTip = 'Executes the Hazard Types action.';
                            }
                            action("Safe Work Permit Types")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Safe Work Permit Types';
                                RunObject = page "Safe Work Permit Types";
                                ToolTip = 'Executes the Safe Work Permit Types action.';
                            }
                            action("Evacuation Events")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Evacuation Events';
                                RunObject = page "Evacuation Events";
                                ToolTip = 'Executes the Evacuation Events action.';
                            }
                            action("Incident Severity Levels")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Incident Severity Levels';
                                RunObject = page "Incident Severity Levels";
                                ToolTip = 'Executes the Incident Severity Levels action.';
                            }
                            action("Safety Inspection Templates")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Safety Inspection Templates';
                                RunObject = page "Inspection Templates";
                                ToolTip = 'Executes the Safety Inspection Templates action.';
                            }

                        }


                    }
                }
            }
            group("Group2")
            {
                Caption = 'Setup';
                action("Human Resources Setup")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Human Resources Setup';
                    RunObject = page "Human Resources Setup";
                    ToolTip = 'Executes the Human Resources Setup action.';
                }
                action("Human Resources Units of Measu")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Human Resources Units of Measure';
                    RunObject = page "Human Res. Units of Measure";
                    ToolTip = 'Executes the Human Resources Units of Measure action.';
                }
                action("Causes of Inactivity")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Causes of Inactivity';
                    RunObject = page "Causes of Inactivity";
                    ToolTip = 'Executes the Causes of Inactivity action.';
                }
                action("Grounds for Termination")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Grounds for Termination';
                    RunObject = page "Grounds for Termination";
                    ToolTip = 'Executes the Grounds for Termination action.';
                }
                action("Unions")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Unions';
                    RunObject = page "Unions";
                    ToolTip = 'Executes the Unions action.';
                }
                action("Employment Contracts")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employment Contracts';
                    RunObject = page "Employment Contracts";
                    ToolTip = 'Executes the Employment Contracts action.';
                }
                action("Relatives")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Relatives';
                    RunObject = page "Relatives";
                    ToolTip = 'Executes the Relatives action.';
                }
                action("Misc. Articles")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Misc. Articles';
                    RunObject = page "Misc. Articles";
                    ToolTip = 'Executes the Employee Misc. Articles action.';
                }
                action("Confidential")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Confidential';
                    RunObject = page "Confidential";
                    ToolTip = 'Executes the Confidential action.';
                }
                action("Qualifications")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Qualifications';
                    RunObject = page "Qualifications";
                    ToolTip = 'Executes the Qualifications action.';
                }
                action("Employee Statistics Groups")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Statistics Groups';
                    RunObject = page "Employee Statistics Groups";
                    ToolTip = 'Executes the Employee Statistics Groups action.';
                }
            }
            group("Training Management")
            {
                Caption = 'Training Management';
                group("Training Setup")
                {
                    Caption = 'Training Setup';
                    action("Training Providers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Providers';
                        RunObject = page 69314;
                        ToolTip = 'Executes the Training Providers action.';
                    }
                    action("Training Goal")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Goal';
                        RunObject = page 69304;
                        ToolTip = 'Executes the Training Goal action.';
                    }
                    action("Training Domains")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Domains';
                        RunObject = page "Training Domains";
                        ToolTip = 'Executes the Training Domains action.';
                    }
                    action("Training Courses")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Courses';
                        RunObject = page "Training Courses Setup";
                        ToolTip = 'Executes the Training Courses action.';
                    }
                    action("Rating Category setup")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Feedback Rating Category';
                        RunObject = page "Rating Category Setup";
                        ToolTip = 'Executes the Feedback Rating Category action.';
                    }
                    action("Competency Perfomance Template")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page 80108;
                        ToolTip = 'Executes the Competency Perfomance Template action.';
                    }
                    action(RatingScales)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Rating Scales';
                        RunObject = page "Rating Scales";
                        ToolTip = 'Executes the Rating Scales action.';
                    }
                    action(CategoryRatingScale)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Category Rating Scale';
                        RunObject = page "Category Rating Scale";
                        ToolTip = 'Executes the Category Rating Scale action.';
                    }
                    action(TrainingNeedCategories)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Need Categories';
                        RunObject = page "Training Need Categories";
                        ToolTip = 'Executes the Training Need Categories action.';
                    }
                }
                group("Training Needs Register")
                {
                    caption = 'Training Needs Register';
                    action(TrainingNeeds)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Needs Assessment';
                        RunObject = page 69309;
                        Visible = false;
                        ToolTip = 'Executes the Training Needs Assessment action.';

                    }
                    action("Training Needs Requesition")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Needs Assessment Req.';
                        RunObject = page "Training Need Requests";
                        ToolTip = 'Executes the Training Needs Assessment Req. action.';

                    }
                    action("Approved Training Needs Requesition")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Approved Training Needs Assessment Req.';
                        RunObject = page "Approved Training Need Request";
                        ToolTip = 'Executes the Approved Training Needs Assessment Req. action.';

                    }
                    action("Submitted Training Needs")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Submitted Training Needs Assessment Req.';
                        //RunObject = page 65152;
                        RunObject = page 50151;
                        ToolTip = 'Executes the Submitted Training Needs Assessment Req. action.';

                    }
                }
                group("Training Planning")
                {
                    Caption = 'Training Planning';
                    action(TrainingPlans)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Projection';
                        RunObject = page 69194;
                        ToolTip = 'Executes the Training Projection action.';
                    }
                    action(PendingTrainingPlans)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Pending Training Projection';
                        RunObject = page "Pending Training Plans";
                        ToolTip = 'Executes the Pending Training Projection action.';
                    }
                    action(ApprovedTrainingPlans)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Approved Training Projection';
                        RunObject = page 69199;
                        ToolTip = 'Executes the Approved Training Projection action.';
                    }

                }
                group("Training Application")
                {
                    caption = 'Training Applications';
                    action(TrainingApplicationList)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Application List';
                        RunObject = page 69220;
                        ToolTip = 'Executes the Training Application List action.';
                    }
                    action(ApprovedTrainingApplicationList)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Approved Training Applications';
                        RunObject = page 69280;
                        ToolTip = 'Executes the Approved Training Applications action.';
                    }
                    action(ProcessedTrainingApplicationList)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Closed Training Applications';
                        RunObject = page 69282;
                        ToolTip = 'Executes the Closed Training Applications action.';
                    }
                }
                group("Reports")
                {
                    caption = 'Reports';
                    action("TNA - Analysis Report")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'TNA - Analysis Report';
                        RunObject = Report 50025;
                    }
                    action("TNA - Per FY")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'TNA Per Employee';
                        RunObject = Report 50132;
                    }
                    action(AnnualTrainingPlans)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Annual Training Plans';
                        ToolTip = 'Executes the Annual Training Plans action.';
                        // RunObject = report 69145;
                    }
                    action(TotalsTrainingsPerEmployee)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Totals Trainings Per Employee';
                        ToolTip = 'Executes the Totals Trainings Per Employee action.';
                        // RunObject = report 69111;
                    }
                    action(DepartmentalTraining)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Departmental Trainings';
                        ToolTip = 'Executes the Departmental Trainings action.';
                        // RunObject = report 69112;
                    }
                    action(AnnualTrainingPlansStatistics)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Annual Training Plans Statistics';
                        ToolTip = 'Executes the Annual Training Plans Statistics action.';
                        // RunObject = report 69114;
                    }
                }

            }
            group("File Movement Management")
            {
                Visible = false;
                group(Adminstration)
                {
                    action(FileMovementSetup)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'File Movement Setup';
                        RunObject = Page "File Movement SetUp";
                        ToolTip = 'Executes the File Movement Setup action.';
                    }
                }
                group("File Creation")
                {
                    action(FileRegistry)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Registry List';
                        RunObject = Page "Registry List";
                        ToolTip = 'Executes the Registry List action.';
                    }
                    action(FileTypes)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'File Types';
                        RunObject = Page "File Types";
                        ToolTip = 'Executes the File Types action.';
                    }
                }

                group(Transitions)
                {

                }
                group("File Movement")
                {
                    action(FileRequisitionLists)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'File Requisition List';
                        RunObject = Page "File Movement List";
                        ToolTip = 'Executes the File Requisition List action.';
                    }
                    action(PendingFileRequisitionLists)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Pending File Requisition List';
                        RunObject = Page "Pending File Requisition";
                        ToolTip = 'Executes the Pending File Requisition List action.';
                    }
                    action(ApprovedFileRequisitionLists)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Approved File Requisition List';
                        RunObject = Page "Approved File Requisition";
                        ToolTip = 'Executes the Approved File Requisition List action.';
                    }
                }
                group("File Dispatch")
                {
                    action("Issued File Requisition List")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Issued File Requisition List';
                        RunObject = Page "Issued File Requisition";
                        ToolTip = 'Executes the Issued File Requisition List action.';
                    }
                    action("Returned File Requisition List")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Returned File Requisition List';
                        RunObject = Page "Returned File Requisition";
                        ToolTip = 'Executes the Returned File Requisition List action.';
                    }
                }
            }
            group("Performance Evaluation")
            {
                Caption = 'Performance Management';
                group(PSetups)
                {
                    Caption = 'Setups';
                    action(SPMGeneralSetup)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Performance Management General Setup';
                        RunObject = Page "Strategy General Setup";
                        ToolTip = 'Executes the Performance Management General Setup action.';
                    }
                    action("Appraisal Periods")
                    {
                        ApplicationArea = BasicHr;
                        Caption = 'Appraisal Periods';
                        Runobject = Page "Appraisal Periods";
                        ToolTip = 'Executes the Appraisal Periods action.';
                    }
                    action("Performance Evaluation Template")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page 80045;
                        // Caption = 'Performance Management Template';
                        Caption = 'Annual Performance Management Template';
                        ToolTip = 'Executes the Annual Performance Management Template action.';
                    }
                    action("Performance Rating Scale")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page 80063;
                        ToolTip = 'Executes the Performance Rating Scale action.';
                    }
                    action("Proficiency Rating Scale")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page 80060;
                        ToolTip = 'Executes the Proficiency Rating Scale action.';
                    }
                    action("Departmental Objectives")
                    {
                        ApplicationArea = BasicHr;
                        //RunObject = Page "Departments Objectives";
                        RunObject = Page "Functional Annual Workplans";
                        Caption = 'Departmental Objectives';
                        ToolTip = 'Executes the Departmental Objectives action.';

                    }
                    action("Approved Departmental Objectives")
                    {
                        ApplicationArea = Basic;
                        //RunObject = Page "Departments Objectives";
                        RunObject = Page "Approved Functional Workplans";
                        Caption = 'Approved Departmental Objectives';
                        ToolTip = 'Executes the Approved Departmental Objectives action.';
                    }

                    action("All Performance Contracts")
                    {
                        ApplicationArea = BasicHR;
                        RunObject = Page "All Performance Contracts";
                        ToolTip = 'Executes the All Performance Contracts action.';
                        Caption = 'Staff Perfomance Contract';
                    }
                    // action("Approved All Performance Contracts")
                    // {
                    //     ApplicationArea = Basic;
                    //     RunObject = Page "ApprAll Performance Contracts";
                    //     ToolTip = 'Executes the Approved All Performance Contracts action.';
                    //     Caption = 'Approved Staff Perfomance Contract';
                    // }
                    action("Performance Logs")
                    {
                        ApplicationArea = BasicHR;
                        RunObject = Page "Performance Diary Logs";
                        ToolTip = 'Executes the Performance Logs.';
                    }
                    action("Approved Performance Logs")
                    {
                        ApplicationArea = BasicHR;
                        RunObject = Page "Appr Dept Perf Contract Logs";
                        ToolTip = 'Executes the Approved Performance Logs.';
                    }
                    action("Posted Performance Logs")
                    {
                        ApplicationArea = BasicHR;
                        RunObject = Page "Posted Perf Contract Logs";
                        ToolTip = 'Executes the Posted Performance Logs.';
                    }

                }
                group("Standard Appraisal")
                {
                    action(StandardPerformanceAppraisal)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Standard Performance Appraisal';
                        RunObject = Page "Standard Perfomance Appraisal";
                        ToolTip = 'Executes the Standard Performance Appraisal action.';
                    }
                    action("Standard Appraisal Evaluation")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Standard Appraisal Evaluation';
                        RunObject = Page "Standard Appraisal-Evaluation";
                        ToolTip = 'Executes the Standard Appraisal Evaluation action.';
                    }
                    action("Submitted Standard Appraisal")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Submitted Standard Appraisal';
                        RunObject = Page "Standard Appraisal-Submitted";
                        ToolTip = 'Executes the Submitted Standard Appraisal action.';
                    }
                    action("Closed Standard Appraisal")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Closed Standard Appraisal';
                        RunObject = Page "Standard Appraisal-Closed";
                        ToolTip = 'Executes the Closed Standard Appraisal action.';
                    }
                }
                group("Employee-Supervisor Appraisal")
                {
                    Visible = false;
                    action("Self-Supervisor Appraisals")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Self-Supervisor Appraisals';
                        RunObject = Page "Self-Supervisor Appraisals";
                        ToolTip = 'Executes the Self-Supervisor Appraisals action.';
                    }
                    action("Self Supervisor Appraisals Under Evaluation")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Self Supervisor Appraisals Under Evaluation';
                        RunObject = Page "Self-Supervisor Appraisals-E";
                        ToolTip = 'Executes the Self Supervisor Appraisals Under Evaluation action.';
                    }
                    action("Submitted Self-Supervisor Appraisals")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Submitted Self-Supervisor Appraisals';
                        RunObject = Page "Self-Supervisor Appraisals-Sub";
                        ToolTip = 'Executes the Submitted Self-Supervisor Appraisals action.';
                    }
                    action("Closed Self-Supervisor Appraisals")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Closed Self-Supervisor Appraisals';
                        RunObject = Page "SelfSupervisorAppraisal-Closed";
                        ToolTip = 'Executes the Closed Self-Supervisor Appraisals action.';
                    }
                }
                group("360 Degree-Appraisal")
                {
                    Visible = false;
                    action("360 Degree Appraisals")
                    {
                        ApplicationArea = BasicHR;
                        Caption = '360 Degree Appraisals';
                        RunObject = Page "Group Appraisals";
                        ToolTip = 'Executes the 360 Degree Appraisals action.';
                    }
                    action("Group Appraisals Under Evaluation")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Group Appraisals Under Evaluation';
                        RunObject = Page "Group Appraisal-Evaluations";
                        ToolTip = 'Executes the Group Appraisals Under Evaluation action.';
                    }
                    action("Submitted Group Appraisals")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Submitted Group Appraisals';
                        RunObject = Page "Group Appraisal-Submitted";
                        ToolTip = 'Executes the Submitted Group Appraisals action.';
                    }
                    action("Closed Group Appraisals")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Closed Group Appraisals';
                        RunObject = Page "Group Appraisal-Closed";
                        ToolTip = 'Executes the Closed Group Appraisals action.';
                    }

                }
                group(AppraisalReports)
                {
                    Caption = 'Reports';
                    Visible = false;
                }
            }
            group("Subscription & Continuous Development")
            {
                Visible = false;
                action("Subscription Setup")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Setup';
                    RunObject = Page SubscriptionSetup;
                    ToolTip = 'Executes the Setup action.';
                }
                group("Professional Bodies")
                {
                    action("Member Categories")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Member Categories';
                        RunObject = Page "Prof.BodyMembeshipCategories";
                        ToolTip = 'Executes the Member Categories action.';
                    }
                    action("Professional Body")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Professional Bodies';
                        RunObject = Page "Professional Bodies List";
                        ToolTip = 'Executes the Professional Bodies action.';
                    }
                }
            }
            group(Tickets)
            {
                Visible = false;

                action("Open Tickets Lists")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Open Tickets List";
                    ToolTip = 'Executes the Open Tickets Lists action.';
                }
                action("Assigned General Lists")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Assigned General List";
                    ToolTip = 'Executes the Assigned General Lists action.';
                }
                action("HOD Tickets Lists")
                {
                    ApplicationArea = Basic;
                    RunObject = page "HOD Tickets List";
                    ToolTip = 'Executes the HOD Tickets Lists action.';
                }
                action("CEO Tickets Lists")
                {
                    ApplicationArea = Basic;
                    RunObject = page "CEO Tickets List";
                    ToolTip = 'Executes the CEO Tickets Lists action.';
                }
                action("Resolved Tickets Lists")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Resolved Tickets Lists";
                    ToolTip = 'Executes the Resolved Tickets Lists action.';
                }
                action("Escalated Tickets Lists")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Escalated Tickets List";
                    ToolTip = 'Executes the Escalated Tickets Lists action.';
                }
                action("Legal Tickets")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Legal Tickets";
                    ToolTip = 'Executes the Legal Tickets action.';
                }
                action("Closed Tickets")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Closed Tickets";
                    ToolTip = 'Executes the Closed Tickets action.';
                }
                action("My Assigned Tickets")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Assigned Enquiries List";
                    ToolTip = 'Executes the My Assigned Tickets action.';
                }
                action("My Closed Tickets")
                {
                    ApplicationArea = Basic;
                    RunObject = page "My Closed Tickets";
                    ToolTip = 'Executes the My Closed Tickets action.';
                }
                action("My Resolved Tickets")
                {
                    ApplicationArea = Basic;
                    RunObject = page "My Resolved Tickets";
                    ToolTip = 'Executes the My Resolved Tickets action.';
                }
                action("Lodge Modes")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Lodge Modes";
                    ToolTip = 'Executes the Lodge Modes action.';
                }
                action("Sought Service")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Sought Service";
                    ToolTip = 'Executes the Sought Service action.';
                }
                group("Complaints Reports")
                {
                    Visible = false;
                    action("Complaints Report")
                    {
                        ApplicationArea = Basic;
                        RunObject = report "Complaints Report";
                        ToolTip = 'Executes the Complaints Report action.';
                    }
                    action("Ombudsman Reporting Template")
                    {
                        ApplicationArea = Basic;
                        RunObject = report "Ombudsman Reporting Template";
                        ToolTip = 'Executes the Ombudsman Reporting Template action.';
                    }
                    action("CRM Enquiry Report")
                    {
                        ApplicationArea = Basic;
                        RunObject = report "CRM ENQUIRY REPORT";
                        ToolTip = 'Executes the CRM Enquiry Report action.';
                    }
                    action("CRM Feedback Report")
                    {
                        ApplicationArea = Basic;
                        RunObject = report "CRM Feedback REPORT";
                        ToolTip = 'Executes the CRM Feedback Report action.';
                    }
                    action("CRM Complements Report")
                    {
                        ApplicationArea = Basic;
                        RunObject = report "CRM Complements REPORT";
                        ToolTip = 'Executes the CRM Complements Report action.';
                    }
                    action("CRM Whistleblowing Report")
                    {
                        ApplicationArea = Basic;
                        RunObject = report "CRM Whistleblowing REPORT";
                        ToolTip = 'Executes the CRM Whistleblowing Report action.';
                    }
                }
            }
            group("Security Incidences")
            {
                Visible = false;
                action("Incident Types")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Incident Types';
                    RunObject = Page "Security Incident Types";
                    ToolTip = 'Executes the Incident Types action.';
                }

                action("Security Incidence")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Security Incidences';
                    RunObject = Page "Security Incidence List";
                    ToolTip = 'Executes the Security Incidences action.';
                }
                action("On-Going Security Incidence")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'On-going Security Incidences';
                    RunObject = Page "Ongoing Security Incidences";
                    ToolTip = 'Executes the On-going Security Incidences action.';
                }
                action("Closed Security Incidence")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Closed Security Incidences';
                    RunObject = Page "Closed Security Incidences";
                    ToolTip = 'Executes the Closed Security Incidences action.';
                }
            }
            group("Board Management")
            {
                Visible = false;
                Caption = 'Board Room Management';
                action("CRM Resource List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "CRM Resource List";
                    Caption = 'Board Rooms';
                    ToolTip = 'Executes the Board Rooms action.';
                }
                action("Resource List")
                {
                    ApplicationArea = Basic;
                    RunObject = Report "Resource List";
                    Caption = 'Board Room List';
                    ToolTip = 'Executes the Board Room List action.';
                }
                action("Additional Requests")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Additional Requests";
                    ToolTip = 'Executes the Additional Requests action.';
                }
                action("Reservation Request List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Reservation Request List";
                    ToolTip = 'Executes the Reservation Request List action.';
                }
                action("Approved Reservation Request")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Reservation Request";
                    ToolTip = 'Executes the Approved Reservation Request action.';
                }
                action("Posted  Reservation Request")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Posted  Reservation Request";
                    ToolTip = 'Executes the Posted  Reservation Request action.';
                }
                action("Resource Booking Setup")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Board Room Mgt Setup";
                    ToolTip = 'Executes the Resource Booking Setup action.';
                }
                action("Reservation Entries List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Reservation Entries List";
                    ToolTip = 'Executes the Reservation Entries List action.';
                }
                action("Resource Requisition Report")
                {
                    ApplicationArea = Basic;
                    RunObject = Report "Resource Requisition Report";
                    Caption = 'Board Room Requisition List';
                    Visible = false;
                    ToolTip = 'Executes the Board Room Requisition List action.';
                }
            }
            group("Exit Management")
            {
                action("Exit Methods")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Exit Methods";
                    ToolTip = 'Executes the Exit Methods action.';
                }
                action("Reasons for Exit")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Reasons for Exit";
                    ToolTip = 'Executes the Reasons for Exit action.';
                }
                action("Position Exit Templates")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Position Exit Templates";
                    ToolTip = 'Executes the Position Exit Templates action.';
                }
                action("Employee Exit Vouchers")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Employee Exit Vouchers";
                    ToolTip = 'Executes the Employee Exit Vouchers action.';
                }
                action("Approved Employee Exit Vouchers")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Employee Exit Voucher";
                    ToolTip = 'Executes the Approved Employee Exit Vouchers action.';
                }
                action("Posted Employee Exit Vouchers")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Posted Employee Exit Vouchers";
                    ToolTip = 'Executes the Posted Employee Exit Vouchers action.';
                }
                action("Functional Hand Over Vouchers")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Functional Hand Over Vouchers";
                    ToolTip = 'Executes the Functional Hand Over Vouchers action.';
                }
            }
            group(PortalUser)
            {
                action("Puser")
                {
                    Visible = false;
                    ApplicationArea = BasicHR;
                    Caption = 'Portal User';
                    RunObject = page "Portal Users";
                    ToolTip = 'Executes the Portal User action.';
                }
            }
            group("Self Service")
            {
                Caption = 'Self Service';
                Image = Travel;
                action("Imprest Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Memo';
                    RunObject = Page "Imprest Memos";
                    ToolTip = 'Executes the Imprest Memo action.';
                }
                action(Action105)
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Request';
                    RunObject = Page "Imprest Requisitions";
                    ToolTip = 'Executes the Imprest Request action.';
                }
                action("Imprest Surrenderss")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Surrender';
                    RunObject = Page "Imprest Surrenders";
                    ToolTip = 'Executes the Imprest Surrender action.';
                }
                action("Claims Refund")
                {
                    ApplicationArea = Basic;
                    Caption = 'Claims Refund';
                    RunObject = Page "Staff Claims";
                    ToolTip = 'Executes the Claims Refund action.';
                }
                action("Departmental Procurement Plan")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Departmental Procurement Plan";
                    ToolTip = 'Executes the Departmental Procurement Plan action.';
                }
                action("Approved Departmental Procurement Plan")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Department PC List";
                    ToolTip = 'Executes the Approved Departmental Procurement Plan action.';
                }
                action("Purchase Requisition ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Requisition';
                    RunObject = Page "Purchase Requisitions List";
                    ToolTip = 'Executes the Purchase Requisition action.';
                }
                action("Store Requisition ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Store Requisition';
                    Image = Vendor;
                    RunObject = Page "Store Requisitions";
                    ToolTip = 'Executes the Store Requisition action.';
                }
                action("Leave Application ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Application';
                    Image = Balance;
                    RunObject = Page "Leave Applications List";
                    ToolTip = 'Executes the Leave Application action.';
                }
                action("Fleet Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Fleet Requisition';
                    Image = Documents;
                    RunObject = Page "Fleet Requisition List";
                    ToolTip = 'Executes the Fleet Requisition action.';
                }
                action("ICT Help Desk")
                {
                    ApplicationArea = Basic;
                    Caption = 'ICT Help Desk';
                    RunObject = Page "ICT Helpdesk Request List";
                    ToolTip = 'Executes the ICT Help Desk action.';
                }
                action("My CEO Appointments")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "My CEO Appointments";
                    ToolTip = 'Executes the My CEO Appointments action.';
                }
                action("My Accepted CEO Appointments")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "My Accepted CEO Appointments";
                    ToolTip = 'Executes the My Accepted CEO Appointments action.';
                }
                action("My CEO Assigned Tasks")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Assigned Tasks by CEO";
                    ToolTip = 'Executes the My CEO Assigned Tasks action.';
                }
                action("My Completed Tasks Assigned")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "My Completed Tasks Assigned";
                    ToolTip = 'Executes the My Completed Tasks Assigned action.';
                }
                action("Suggestions Box")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Suggestions Box";
                    ToolTip = 'Executes the Suggestions Box action.';
                }
            }
            group(Correspondences)
            {
                Caption = 'Memos';

                action("Memo Nos Setup")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Memo Nos Setup";
                }
                action("Memo Setup Url")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Memo Nos Setup Url";
                }
                group(MemoDepts)
                {
                    action("Memo Departments")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Memo Departments";
                    }
                    action("Admin Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Administration Dept Lookup Lis";
                    }
                    action("Audit Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Audit Dept Lookup List";
                    }
                    action("Corporate Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Corporate Dept Lookup List";
                    }
                    action("EAP Personnel Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "EAP Personnel Lookup List";
                    }
                    action("Education Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Education Dept Lookup List";
                    }
                    action("Finance Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Finance Dept Lookup List";
                    }
                    action("HR Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Human Cap Dept Lookup List";
                    }
                    action("ICT Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "ICT Dept Lookup List";
                    }
                    action("Legal Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Legal Dept Lookup List";
                    }
                    action("Personnel Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Personnel Dept Lookup List";
                    }
                    action("Project Files Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Project Files Lookup List";
                    }
                    action("Standards Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Standards Dept Lookup List";
                    }
                    action("SCM Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "SCM Dept Lookup List";
                    }

                    action("Transport Buffer")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Transport Dept Lookup List";
                    }
                }
                action("Correspondences Lists")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Correspondences Lists";
                }
                action("Correspondences Pending Approv")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Correspondences Pending Approv";
                }
                action("Approved Correspondences")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Correspondences";
                }
                action("General Correspondences")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "General Correspondences";
                    Caption = 'Memos';
                }
                action("Incoming Correspondence List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Incoming Correspondence List";
                }
                action("Corrective Order Responses")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Corrective Order Responses";
                }
                action("Correspondence Contacts")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Correspondence Contacts";
                }
                action("Incoming Corrs Sources")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Incoming Corrs Sources";
                }
                action("Incoming Correspondences File")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Incoming Correspondences File";
                }
                action("Internal Correspondence - Memo")
                {
                    ApplicationArea = Basic;
                    RunObject = Report "Internal Correspondence - Memo";
                }
                action("Correspondence-Internal Letter")
                {
                    ApplicationArea = Basic;
                    RunObject = Report "Correspondence-Internal Letter";
                }
                action("Correspondence-External Letter")
                {
                    ApplicationArea = Basic;
                    RunObject = Report "Correspondence-External Letter";
                }
                action("Posted Correspondences")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Posted Correspondences";
                }
            }
            // group(Correspondences)
            // {
            //     Caption = 'Memos';
            //     action("Correspondences Lists")
            //     {
            //         ApplicationArea = Basic;
            //         RunObject = Page "Correspondences Lists";
            //         ToolTip = 'Executes the Correspondences Lists action.';
            //     }
            //     action("Correspondences Pending Approv")
            //     {
            //         ApplicationArea = Basic;
            //         RunObject = Page "Correspondences Pending Approv";
            //         ToolTip = 'Executes the Correspondences Pending Approv action.';
            //     }
            //     action("Approved Correspondences")
            //     {
            //         ApplicationArea = Basic;
            //         RunObject = Page "Approved Correspondences";
            //         ToolTip = 'Executes the Approved Correspondences action.';
            //     }
            //     action("General Correspondences")
            //     {
            //         ApplicationArea = Basic;
            //         RunObject = Page "General Correspondences";
            //         Caption = 'Memos';
            //         ToolTip = 'Executes the Memos action.';
            //     }
            //     action("Incoming Correspondence List")
            //     {
            //         ApplicationArea = Basic;
            //         RunObject = Page "Incoming Correspondence List";
            //         ToolTip = 'Executes the Incoming Correspondence List action.';
            //     }
            //     action("Corrective Order Responses")
            //     {
            //         ApplicationArea = Basic;
            //         RunObject = Page "Corrective Order Responses";
            //         ToolTip = 'Executes the Corrective Order Responses action.';
            //     }
            //     action("Correspondence Contacts")
            //     {
            //         ApplicationArea = Basic;
            //         RunObject = Page "Correspondence Contacts";
            //         ToolTip = 'Executes the Correspondence Contacts action.';
            //     }
            //     action("Incoming Corrs Sources")
            //     {
            //         ApplicationArea = Basic;
            //         RunObject = Page "Incoming Corrs Sources";
            //         ToolTip = 'Executes the Incoming Corrs Sources action.';
            //     }
            //     action("Incoming Correspondences File")
            //     {
            //         ApplicationArea = Basic;
            //         RunObject = Page "Incoming Correspondences File";
            //         ToolTip = 'Executes the Incoming Correspondences File action.';
            //     }
            //     action("Internal Correspondence - Memo")
            //     {
            //         ApplicationArea = Basic;
            //         RunObject = Report "Internal Correspondence - Memo";
            //         ToolTip = 'Executes the Internal Correspondence - Memo action.';
            //     }
            //     action("Correspondence-Internal Letter")
            //     {
            //         ApplicationArea = Basic;
            //         RunObject = Report "Correspondence-Internal Letter";
            //         ToolTip = 'Executes the Correspondence-Internal Letter action.';
            //     }
            //     action("Correspondence-External Letter")
            //     {
            //         ApplicationArea = Basic;
            //         RunObject = Report "Correspondence-External Letter";
            //         ToolTip = 'Executes the Correspondence-External Letter action.';
            //     }
            // }
        }
    }
}
profile HRRoleCenter
{
    ProfileDescription = 'Human Capital Role Center';
    RoleCenter = "HR Role Center";
    Caption = 'Human Capital Role Center';
}
