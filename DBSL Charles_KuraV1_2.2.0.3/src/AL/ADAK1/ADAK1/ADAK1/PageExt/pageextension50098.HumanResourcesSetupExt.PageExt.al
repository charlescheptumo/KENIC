#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50098 "Human Resources Setup Ext" extends "Human Resources Setup"
{

    //Unsupported feature: Property Modification (InsertAllowed) on ""Human Resources Setup"(Page 5233)".


    //Unsupported feature: Property Modification (DeleteAllowed) on ""Human Resources Setup"(Page 5233)".

    layout
    {
        // modify(Control1900000007)
        // {
        //     Visible = false;
        // }
        modify(Control1900383207)
        {
            Visible = false;
        }
        modify(Control1905767507)
        {
            Visible = false;
        }
        addafter("Base Unit of Measure")
        {
            field("Rating Nos."; Rec."Rating Nos.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Rating Nos. field.';
            }
            field("Applicants Nos."; Rec."Applicants Nos.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Applicants Nos. field.';
            }
            field("Training Request Nos"; Rec."Training Request Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Training Request Nos field.';
            }
            field("Training Application Nos."; Rec."Training Application Nos.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Training Application Nos. field.';
            }
            field("Traning Planning Nos"; Rec."Traning Planning Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Traning Planning Nos field.';
            }
            field("Training Courses Nos"; Rec."Training Courses Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Training Courses field.', Comment = '%';
            }

            field("Training Evaluation Nos"; Rec."Training Evaluation Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Training Evaluation Nos field.';
            }
            field("Annual Training Plan"; Rec."Annual Training Plan")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Annual Training Plan field.';
            }
            field("Annual Training Plan Name"; Rec."Annual Training Plan Name")
            {
                ApplicationArea = Basic;
                Editable = false;
                ToolTip = 'Specifies the value of the Annual Training Plan Name field.';
            }

            field("HQ Region RC"; Rec."HQ Region RC")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the HQ Region RC field.';
            }
            field("Medical Claims Nos"; Rec."Medical Claims Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Medical Claims Nos field.';
            }
            field("Leave Application Nos."; Rec."Leave Application Nos.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Leave Application Nos. field.';
            }
            field("Appraisal Nos"; Rec."Appraisal Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Appraisal Nos field.';
            }
            field("General Correspondences Nos"; Rec."General Correspondences Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the General Correspondences Nos field.';
            }
            field("Incoming Correspondences Nos"; Rec."Incoming Correspondence Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Incoming Correspondence Nos field.';
            }
            field("Correspondence Contact Nos"; Rec."Correspondence Contact Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Correspondence Contact Nos field.';
            }
            field("Training Allowance"; Rec."Training Allowance")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Training Allowance field.';
            }
            field("Base Calendar"; Rec."Base Calendar")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Base Calendar field.';
            }
            field("Base Calender Code"; Rec."Base Calender Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Base Calender Code field.';
            }
            field("Leave Template"; Rec."Leave Template")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Leave Template field.';
            }
            field("Leave Batch"; Rec."Leave Batch")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Leave Batch field.';
            }
            field("Leave Posting Period[FROM]"; Rec."Leave Posting Period[FROM]")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Leave Posting Period[FROM] field.';
            }
            field("Leave Recall Nos"; Rec."Leave Recall Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Leave Recall Nos field.';
            }
            field("Leave Posting Period[TO]"; Rec."Leave Posting Period[TO]")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Leave Posting Period[TO] field.';
            }
            field("Leave Approval Days"; Rec."Leave Approval Days")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Leave Approval Days field.';
            }
            field("Leave Allowance Threshold"; Rec."Leave Allowance Threshold")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Leave Allowance Threshold field.';
            }
            field("Exit Voucher Nos"; Rec."Exit Voucher Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Exit Voucher Nos field.', Comment = '%';
            }
            field("Exit HandOver Nos"; Rec."Exit HandOver Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Exit HandOver Nos field.', Comment = '%';
            }
            field("Exit Final Dues Nos"; Rec."Exit Final Dues Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Exit Final Dues Nos field.', Comment = '%';
            }
            field("Company Documents"; Rec."Company Documents")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Company Documents field.';
            }
            field("Gratuity Percentage."; Rec."Gratuity Percentage.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Gratuity Percentage. field.';
            }
            field("Gratuity PAYE graduated"; Rec."Gratuity PAYE graduated")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Gratuity PAYE graduated field.';
            }
            field("Gratuity Paid Code"; Rec."Gratuity Paid Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Gratuity Paid Code field.';
            }
            field("Leave Planner Nos."; Rec."Leave Planner Nos.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Leave Planner Nos. field.';
            }
            field("Quarterly Appraisal Nos."; Rec."Quarterly Appraisal Nos.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Quarterly Appraisal Nos. field.';
            }
            field("Annual Appraisal Nos."; Rec."Annual Appraisal Nos.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Annual Appraisal Nos. field.';
            }
            field("Disciplinary Cases Nos."; Rec."Disciplinary Cases Nos.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Disciplinary Cases Nos. field.';
            }
            field("Plaintiff Nos"; Rec."Plaintiff Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Plaintiff Nos field.';
            }
            field("Defendant Nos"; Rec."Defendant Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Defendant Nos field.';
            }
            field("Training Need Nos."; Rec."Training Need Nos.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Training Need Nos. field.';
            }
            field("Training Allowance Arrears"; Rec."Training Allowance Arrears")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Training Allowance Arrears field.';
            }
            field("Annual Leave Days"; Rec."Annual Leave Days")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Annual Leave Days field.';
            }
            field("Insurance Document No."; Rec."Insurance Document No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Insurance Document No. field.';
            }
            field("Job Application Nos"; Rec."Job Application Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Job Application Nos field.';
            }
            field("Employee Requisition Nos."; Rec."Employee Requisition Nos.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Employee Requisition Nos. field.';
            }
            field("HR E-mail Address"; Rec."HR E-mail Address")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the HR E-mail Address field.';
            }
            field("Legal Case Nos"; Rec."Legal Case Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Legal Case Nos field.';
            }
            field("Applicants Request  Nos"; Rec."Applicants Request  Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Applicants Request  Nos field.';
            }
            field("Director Payroll Nos"; Rec."Director Payroll Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Director Payroll Nos field.';
            }
            field("Employee Payment Info Nos"; Rec."Employee Payment Info Nos")
            {
                ApplicationArea = Basic;
                Visible = true;
                ToolTip = 'Specifies the value of the Employee Payment Info Nos field.';
            }
            field("CEO Booking Nos"; Rec."CEO Booking Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the CEO Booking Nos field.';
            }
            field("CEO Task Assignment Nos"; Rec."CEO Task Assignment Nos")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the CEO Task Assignment Nos field.';
            }
            field("CEO Task Assignment Line Nos"; Rec."CEO Task Assignment Line Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the CEO Task Assignment Line Nos field.', Comment = '%';
            }
            field("Meeting Nos."; Rec."Meeting Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Meeting Nos. field.', Comment = '%';
            }
            field("Board Member Nos"; Rec."Board Member Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Board Member Nos field.', Comment = '%';
            }
            field("Board meeting Nos"; Rec."Board meeting Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Board meeting Nos field.', Comment = '%';
            }
            field("Project Team Nos"; Rec."Project Team Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Project Team Nos field.', Comment = '%';
            }
            field("Suggestion Box Nos"; Rec."Suggestion Box Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Suggestion Box Nos field.', Comment = '%';
            }
            group("Payroll Setups")
            {
                Caption = 'Payroll Setups';
                field("Tax Table"; Rec."Tax Table")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Table field.';
                }
                field("Excess Pension Code"; Rec."Excess Pension Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pension Add Back';
                    ToolTip = 'Specifies the value of the Pension Add Back field.';
                }
                field("Payroll Rounding Type"; Rec."Payroll Rounding Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Rounding Type field.';
                }
                field("Payroll Rounding Precision"; Rec."Payroll Rounding Precision")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Rounding Precision field.';
                }
                field("Loan Rounding Type"; Rec."Loan Rounding Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Loan Rounding Type field.', Comment = '%';
                }
                field("Loan Rounding Precision"; Rec."Loan Rounding Precision")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Loan Rounding Precision field.', Comment = '%';
                }
                field("Pension Limit Percentage"; Rec."Pension Limit Percentage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pension Limit Percentage field.';
                }
                field("Pension Limit Amount"; Rec."Pension Limit Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pension Limit Amount field.';
                }
                field("General Payslip Message"; Rec."General Payslip Message")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Payslip Message field.';
                }
                field("Basic Salary Code"; Rec."Basic Salary Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Salary Code field.';
                }
                field("NHIF Code"; Rec."NHIF Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NHIF Code field.';
                    Caption = 'SHIF';
                }
                field("Net Pay Advance Code"; Rec."Net Pay Advance Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Pay Advance Code field.';
                }
                field("Pending Days"; Rec."Pending Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pending Days field.';
                }
                field("Tax Relief Code"; Rec."Tax Relief Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Relief Code field.';
                }
                field("Insuarance Relief Percentage"; Rec."Insuarance Relief Percentage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insuarance Relief Percentage field.';
                }
                field("Salary Advance"; Rec."Salary Advance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Advance field.';
                }
                field("Interest on Advance Code"; Rec."Interest on Advance Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest on Advance Code field.';
                }
                field("NSSF Tier I Code"; Rec."NSSF Tier I Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NSSF Tier I Code field.';
                }
                field("NSSF Tier II Code"; Rec."NSSF Tier II Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NSSF Tier II Code field.';
                }
                field("Payroll Journal Template"; Rec."Payroll Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Journal Template field.';
                }
                field("Payroll Journal Batch"; Rec."Payroll Journal Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Journal Batch field.';
                }
                field("Salary Voucher Nos"; Rec."Salary Voucher Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Voucher Nos field.';
                }
                field("Gratuity Percentage"; Rec."Gratuity Percentage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gratuity Percentage field.';
                }
                field("Salary Icreament Nos"; Rec."Salary Icreament Nos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Salary Increment Nos';
                    ToolTip = 'Specifies the value of the Salary Increment Nos field.';
                }
                field("Don't Generate Payroll File"; Rec."Don't Generate Payroll File")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Don''t Generate Payroll File field.';
                }
                field("Loan Product Type Nos."; Rec."Loan Product Type Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Loan Product Type Nos. field.', Comment = '%';
                }
                field("Loan No series"; Rec."Loan No series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Loan No series';
                }
                field("Special Duty Days"; Rec."Special Duty Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Special Duty Days field.', Comment = '%';
                }
            }
            group("Recruitment Setups")
            {
                Caption = 'Recruitment Setups';
                field("Standard Recruitment Lead Time"; Rec."Standard Recruitment Lead Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Standard Recruitment Lead Time field.';
                }
                field("Expe Recruitment Lead Time"; Rec."Expe Recruitment Lead Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Expedited Recruitment Lead Time field.';
                }
                field("Strict Manpower Planning"; Rec."Strict Manpower Planning")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disable Strict Manpower Planning field.';
                }
                field("Months for Recruiter Fees"; Rec."Months for Recruiter Fees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Months for Recruiter Fees field.';
                }
                field("Recruiter Fees %"; Rec."Recruiter Fees %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recruiter Fees % field.';
                }
                field("Recruitment File Path"; Rec."Recruitment File Path")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recruitment File Path field.';
                }
                field("Recruitment Plan Nos."; Rec."Recruitment Plan Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recruitment Plan Nos. field.';
                }
                field("Succession Plan Nos"; Rec."Succession Plan Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Succession Plan Nos field.';
                }
                field("Succession Template Nos"; Rec."Succession Template Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Succession Template Nos field.';
                }
                field("Succession Log Nos"; Rec."Succession Log Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Succession Log Nos field.';
                }
                field("Recruitment Requsition Nos."; Rec."Recruitment Requsition Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recruitment Requsition Nos. field.';
                }
                field("Vacancy Nos."; Rec."Vacancy Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy Nos. field.';
                }
                field("HQ Responsibility Center"; Rec."HQ Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HQ Responsibility Center field.';
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate No. field.';
                }
                field("Job Applicant No.s"; Rec."Job Applicant No.s")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Applicant No.s field.';
                }
                field("Direct Hire Nos."; Rec."Direct Hire Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Direct Hire Nos. field.';
                }
                field("Apptitude Selection Nos."; Rec."Apptitude Selection Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Apptitude Selection Nos. field.';
                }
                field("Final Interview  Nos."; Rec."Final Interview  Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Interview  Nos. field.';
                }
                field("Final Shortlist  Nos."; Rec."Final Shortlist  Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Shortlist  Nos. field.';
                }
                field("Applicant Profile Nos"; Rec."Applicant Profile Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applicant Profile Nos field.';
                }
                field("Functional Plan Nos."; Rec."Functional Plan Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Functional Plan Nos. field.';
                }
                field("Commiitee Appoint Nos."; Rec."Commiitee Appoint Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commiitee Appoint Nos. field.';
                }
                field("Committee Terminate Nos."; Rec."Committee Terminate Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee Terminate Nos. field.';
                }
                field("HR Template Nos."; Rec."HR Template Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HR Template Nos. field.';
                }
                field("Prescreening Template Nos."; Rec."Prescreening Template Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prescreening Template Nos. field.';
                }
                field("Apptitude Question Nos."; Rec."Apptitude Question Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Apptitude Question Nos. field.';
                }
                field("Medical Checks Template Nos."; Rec."Medical Checks Template Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Medical Checks Template Nos. field.';
                }
                field("Ability Test Nos."; Rec."Ability Test Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ability Test Nos. field.';
                }
                field("Ability Test Invitation Nos."; Rec."Ability Test Invitation Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ability Test Invitation Nos. field.';
                }
                field("Phone Interview Report Nos."; Rec."Phone Interview Report Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone Interview Report Nos. field.';
                }
                field("Ability Test Response Nos."; Rec."Ability Test Response Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ability Test Response Nos. field.';
                }
                field("Shortlisting Voucher Nos."; Rec."Shortlisting Voucher Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortlisting Voucher Nos. field.';
                }
                field("Interview Invitation Nos."; Rec."Interview Invitation Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Invitation Nos. field.';
                }
                field("Candidate Interview Nos"; Rec."Candidate Interview Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Candidate Interview Nos field.', Comment = '%';
                }
                field("Consolidated Interview Nos"; Rec."Consolidated Interview Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Consolidated Interview Nos field.', Comment = '%';
                }
                field("Background Checks Nos."; Rec."Background Checks Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Background Checks Nos. field.';
                }
                field("Referee Recomm Nos."; Rec."Referee Recomm Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Referee Recomm Nos. field.';
                }
                field("Prehire Medical Nos."; Rec."Prehire Medical Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prehire Medical Nos. field.';
                }
                field("Employment Offer Nos."; Rec."Employment Offer Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employment Offer Nos. field.';
                }
                field("Benefit Package Nos."; Rec."Benefit Package Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Benefit Package Nos. field.';
                }
                field("Scoresheet Template Nos."; Rec."Scoresheet Template Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scoresheet Template Nos. field.';
                }
            }
            group("Overtime Setup")
            {
                field("Overtime Payroll Code"; Rec."Overtime Payroll Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overtime Payroll Code field.';
                }
            }
            group("HR Setups")
            {
                field("Transfer Nos"; Rec."Transfer Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer Nos field.';
                }
                field("Hardship Allowance Code"; Rec."Hardship Allowance Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hardship Allowance Code field.';
                }
                field("Transfer Allowance Code"; Rec."Transfer Allowance Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer Allowance Code field.';
                }
                field("Leave Allowance Code"; Rec."Leave Allowance Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Allowance Code field.';
                }
                field("Current Leave Period"; Rec."Current Leave Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Leave Period field.';
                }
                field("Asset Transfer Nos"; Rec."Asset Transfer Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Asset Transfer Nos field.';
                }
                field("Interns Nos"; Rec."Interns Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interns Nos field.';
                }
                field("Temporary Employee Nos"; Rec."Temporary Employee Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Temporary Employee Nos field.';
                }
                field("Temp Salary Voucher Nos."; Rec."Temp Salary Voucher Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Temp Salary Voucher Nos. field.';
                }
                field("Manpower Planning Nos."; Rec."Manpower Planning Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Manpower Planning Nos. field.';
                }
                field("Job Advert Nos."; Rec."Job Advert Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Advert Nos. field.';
                }
                field("Retirement Age"; Rec."Retirement Age")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retirement Age field.';
                }
                field("Notice Period Long Term"; Rec."Notice Period Long Term")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice Period Long Term field.';
                }
                field("Notice Period Short Term"; Rec."Notice Period Short Term")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice Period Short Term field.';
                }
                field("Disciplinary Committee Nos"; Rec."Disciplinary Committee Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disciplinary Committee Nos field.';
                }
                field("Staff Exit Nos"; Rec."Staff Exit Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Exit Nos field.';
                }
                field("Exit Qns Template"; Rec."Exit Qns Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exit Qns Template field.';
                }
            }
            group("Exchequer Project Setup")
            {
                Caption = 'Temporal Staff Payroll Setups';
                field("Temp Tax Relief Code"; Rec."Temp Tax Relief Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Temp Tax Relief Code field.';
                }
                field("Temp NHIF Code"; Rec."Temp NHIF Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Temp NHIF Code field.';
                }
                field("Temp Net Pay Advance Code"; Rec."Temp Net Pay Advance Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Temp Net Pay Advance Code field.';
                }
                field("Temp NSSF Tier I Code"; Rec."Temp NSSF Tier I Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Temp NSSF Tier I Code field.';
                }
                field("Temp NSSF Tier II Code"; Rec."Temp NSSF Tier II Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Temp NSSF Tier II Code field.';
                }
                field("CEO Notification Email"; Rec."CEO Notification Email")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}

#pragma implicitwith restore

