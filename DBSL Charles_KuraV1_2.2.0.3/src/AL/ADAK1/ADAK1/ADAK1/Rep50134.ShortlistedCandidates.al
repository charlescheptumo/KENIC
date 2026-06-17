report 99171 "Shortlisted Canditates Report"
{
    ApplicationArea = All;
    Caption = 'Shortlisted Canditates Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/ShortlistedCanditatesReport.rdl';
    dataset
    {
        dataitem(CandidateSelectionHeader; "Candidate Selection Header")
        {
            DataItemTableView = where("Document Type" = const("Candidate Shortlisting"));
            RequestFilterFields = Directorate, Department, "Vacancy ID";
            column(CompanyName; CompanyInformation.Name)
            {
            }
            column(CompanyAddress; CompanyInformation.Address)
            {
            }
            column(CompanyAddress1; CompanyInformation."Address 2")
            {
            }
            column(CompanyCity; CompanyInformation.City)
            {
            }
            column(CompanyPhone; CompanyInformation."Phone No.")
            {
            }
            column(CompanyPhone2; CompanyInformation."Phone No. 2")
            {
            }
            column(CompanyPicture; CompanyInformation.Picture)
            {
            }
            column(ComapnyEmail; CompanyInformation."E-Mail")
            {
            }
            column(ComapnyMotto; CompanyInformation.Motto)
            {
            }
            column(ComapnyHomePage; CompanyInformation."Home Page")
            {
            }
            column(AbilityTestReportID; "Ability Test Report ID")
            {
            }
            column(AdditionalComments; "Additional Comments")
            {
            }
            column(ApplicationClosingDate; "Application Closing Date")
            {
            }
            column(ApplicationClosingTime; "Application Closing Time")
            {
            }
            column(AppointedSelectionCommID; "Appointed Selection Comm ID")
            {
            }
            column(ApprovalStatus;"Approval Status")
            {
            }
            column(CandidateShortlistNo; "Candidate Shortlist No.")
            {
            }
            column(CreatedBy; "Created By")
            {
            }
            column(CreatedOn; "Created On")
            {
            }
            column(DefaultTermsofServiceCode; "Default Terms of Service Code")
            {
            }
            column(Department; Department)
            {
            }
            column(Description; Description)
            {
            }
            column(Directorate; Directorate)
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(DocumentStatus; "Document Status")
            {
            }
            column(DocumentType; "Document Type")
            {
            }
            column(EmploymentType; "Employment Type")
            {
            }
            column(InterviewInvitationNo; "Interview Invitation No.")
            {
            }
            column(InterviewMode; "Interview Mode")
            {
            }
            column(InterviewScoresheetTemplate; "Interview Scoresheet Template")
            {
            }
            column(JobTitle; "Job Title")
            {
            }
            column(LeadHROfficer; "Lead HR Officer")
            {
            }
            column(MinAcademicHierarchyPointer; "Min Academic Hierarchy Pointer")
            {
            }
            column(MinimumAcademicQualification; "Minimum Academic Qualification")
            {
            }
            column(MinimumMngmntExperience; "Minimum Mngmnt Experience")
            {
            }
            column(MinimumWorkExperience; "Minimum Work Experience")
            {
            }
            column(MissedAcademicTotal; "Missed Academic Total")
            {
            }
            // column(MissedAttainedScoreTotal; "Missed Attained Score Total")
            // {
            // }
            column(MissedGeneralTotal; "Missed General Total")
            {
            }
            column(MissedManagementTotal; "Missed Management Total")
            {
            }
            // column(MissedSpecializationTotal; "Missed Specialization Total")
            // {
            // }
            column(NoSeries; "No. Series")
            {
            }
            column(NoofApptitudeInvitees; "No. of Apptitude Invitees")
            {
            }
            column(NoofFinalShortlistedCandi; "No. of Final Shortlisted Candi")
            {
            }
            column(NoofSubmittedApplications; "No. of Submitted Applications")
            {
            }
            column(Noofopenings; "No. of openings")
            {
            }
            column(PhoneInterviewID; "Phone Interview ID")
            {
            }
            column(PlannedStartDate; "Planned Start Date")
            {
            }
            column(PlannedendDate; "Planned end Date")
            {
            }
            column(PositionID; "Position ID")
            {
            }
            column(Posted; Posted)
            {
            }
            column(PrimaryContactEmail; "Primary Contact Email")
            {
            }
            column(PrimaryContactPerson; "Primary Contact Person")
            {
            }
            column(PrimaryContactPhone; "Primary Contact Phone")
            {
            }
            column(Region; Region)
            {
            }
            column(SelectionCommitteeChair; "Selection Committee Chair")
            {
            }
            column(SeniorityLevel; "Seniority Level")
            {
            }
            column(ShortlistingVenue; "Shortlisting Venue")
            {
            }
            column(SourceDocumentNo; "Source Document No.")
            {
            }
            column(SourceType; "Source Type")
            {
            }
            column(VacancyID; "Vacancy ID")
            {
            }
            dataitem("Candidate Shortlist Matrix"; "Candidate Shortlist Matrix")
            {
                DataItemLink = "Document No" = field("Document No."), "Vacancy ID" = field("Vacancy ID");
                column(Document_No; "Document No")
                {
                }
                column(Document_Type; "Document Type")
                {
                }
                column(Vacancy_ID; "Vacancy ID")
                {
                }
                column(Application_No_; "Application No.")
                {
                }
                column(Candidate_No; "Candidate No")
                {
                }
                column(First_Name; "First Name")
                {
                }
                column(Middle_Name; "Middle Name")
                {
                }
                column(Last_Name; "Last Name")
                {
                }
                column(Complete_Doc_Submitted; "Complete Doc Submitted")
                {
                }
                column(Shortlisting_Outcome; "Shortlisting Outcome")
                {
                }
                column(Committee_Remarks; "Committee Remarks")
                {
                }
                column(Unsuccesfull_App_Reason_Code; "Unsuccesfull App Reason Code")
                {
                }
                column(Ability_Test_Report_ID; "Ability Test Report ID")
                {
                }
                column(Phone_Interview_Outcome; "Phone Interview Outcome")
                {
                }
                column(Phone_Interview_Report_ID; "Phone Interview Report ID")
                {
                }
                column(Ability_Test_Pass_Score__; "Ability Test Pass Score %")
                {
                }
                column(Employee_No_; "Employee No.")
                {
                }
                column(Phone_No_; "Phone No.")
                {
                }
                column(Mobile_Phone_No_; "Mobile Phone No.")
                {
                }
                column(Email; Email)
                {
                }
                column(Birth_Date; "Birth Date")
                {
                }
                column(Gender; Gender)
                {
                }
                column(ID_Number; "ID Number")
                {
                }
                column(Passport_No_; "Passport No.")
                {
                }
                column(Tax_Registration_No_; "Tax Registration No.")
                {
                }
                column(Marital_Status; "Marital Status")
                {
                }
                column(Ethnic_Group; "Ethnic Group")
                {
                }
                column(Nationality; Nationality)
                {
                }
                column(Specialization_Area; "Specialization Area")
                {
                }
                column(Highest_Academic_Qualification; "Highest Academic Qualification")
                {
                }
                column(Qualification_Name; "Qualification Name")
                {
                }
                column(Work_Experience__Years_; "Work Experience (Years)")
                {
                }
                column(Management_Experience__Years_; "Management Experience (Years)")
                {
                }
                column(Disability_Code; "Disability Code")
                {
                }
                column(Disabled; Disabled)
                {
                }
                column(Disability_Description; "Disability Description")
                {
                }
                column(Disability_Certificate_No; "Disability Certificate No")
                {
                }
                column(Notified; Notified)
                {
                }
                column(Notified_On; "Notified On")
                {
                }
                column(Highest_Academic_Hierarchy_Poi; "Highest Academic Hierarchy Poi")
                {
                }
                column(ApplicantAge; ApplicantAge)
                {
                }
                trigger OnAfterGetRecord()
                begin
                    Applicant.Reset();
                    Applicant.SetRange("Candidate No.", "Candidate No");
                    if Applicant.FindFirst()then
                    begin
                        ApplicantAge := Applicant.Age;
                    end;
                end;
            }
            trigger OnAfterGetRecord()
            begin
                CompanyInformation.GET;
                CompanyInformation.CALCFIELDS(Picture);
               
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
        CompanyInformation: Record "Company Information";
        Applicant: Record Applicant;
        ApplicantAge: Integer;
        
}
