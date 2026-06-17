#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69821 "Consolidated Interview Record"
{
    PageType = Document;
    SourceTable = "Panel Chair Interview Line";
    SourceTableView = where("Document Type" = filter("Consolidated Interview Report"));
    RefreshOnActivate = true;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Interview Invitation No."; Rec."Interview Invitation No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Invitation No. field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Interview Panel Outcome"; Rec."Interview Panel Outcome")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Interview Panel Outcome field.';
                }
                field("Interview Panel Score %"; Rec."Interview Panel Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Interview Panel Score % field.';
                }
                field("Interview Panel Remarks"; Rec."Interview Panel Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Panel Remarks field.';
                }
                field("Unsuccesful Application Reason"; Rec."Unsuccesful Application Reason")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unsuccesful Application Reason field.';
                }
                field("Interview Date"; Rec."Interview Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Date field.';
                }
                field("Interview Start Time"; Rec."Interview Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Start Time field.';
                }
                field("Interview End Time"; Rec."Interview End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview End Time field.';
                }
                field("Assigned Panel ID"; Rec."Assigned Panel ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Panel ID field.';
                }
                field("Interview Venue"; Rec."Interview Venue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Venue field.';
                }
                field("Room No."; Rec."Room No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Room No. field.';
                }
                field("Candidate Attendance Status"; Rec."Candidate Attendance Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate Attendance Status field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Candidate Shortlist Voucher"; Rec."Candidate Shortlist Voucher")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate Shortlist Voucher field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Birth Date"; Rec."Birth Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Birth Date field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field("Passport No."; Rec."Passport No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Passport No. field.';
                }
                field("Tax Registration(PIN)"; Rec."Tax Registration(PIN)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Registration(PIN) field.';
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marital Status field.';
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Religion field.';
                }
                field("Ethnic Group"; Rec."Ethnic Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ethnic Group field.';
                }
                field(Nationality; Rec.Nationality)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nationality field.';
                }
                field("Specialization Area"; Rec."Specialization Area")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Specialization Area field.';
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Highest Academic Qualification field.';
                }
                field("Academic Qualification Name"; Rec."Academic Qualification Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Academic Qualification Name field.';
                }
                field("Highest Academic Pointer"; Rec."Highest Academic Pointer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Highest Academic Pointer field.';
                }
                field("General Work Experience Yrs"; Rec."General Work Experience Yrs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Work Experience Yrs field.';
                }
                field("Management Experience Yrs"; Rec."Management Experience Yrs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Management Experience Yrs field.';
                }
                field("Disability Code"; Rec."Disability Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Code field.';
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disabled field.';
                }
                field("Disability Description"; Rec."Disability Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Description field.';
                }
                field("Disability Cert No."; Rec."Disability Cert No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Cert No. field.';
                }
                field(Notified; Rec.Notified)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Notified field.';
                }
                field("Notified On"; Rec."Notified On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Notified On field.';
                }
            }
            part(Control41; "Candidate Interview Line")
            {
                // SubPageLink = "Document No." = field("Document No."),
                //               "Document Type" = field("Document Type"),
                //               "Vacancy ID" = field("Qualification Category");
                SubPageLink = "Document No." = field("Document No."),
                              "Document Type" = field("Document Type");
                UpdatePropagation = Both;
            }
        }
        area(factboxes)
        {
            systempart(Control28; Outlook)
            {
            }
            systempart(Control29; Notes)
            {
            }
            systempart(Control30; MyNotes)
            {
            }
            systempart(Control31; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Evaluation Sections")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Question Categories";
                RunPageLink = "Document No." = field("Document No.");
                ToolTip = 'Executes the Evaluation Sections action.';
            }
            action("Panelist Evaluation Report")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Panelist Evaluation Report action.';

                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(69625, true, false, Rec);
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Post action.';

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to complete the evaluation?';
                begin
                end;
            }
            action("Send Notification")
            {
                ApplicationArea = All;
                Image = Email;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Send Notification action.';

                trigger OnAction()
                begin
                    JobApp.Get(Rec."Application No.");
                    if JobApp."E-Mail" = '' then
                        Error('Kindly insert the Email of the Job Applicant');

                    Recepient := JobApp."E-Mail";
                    Subject := 'Job Application Results';
                    BodyFail += 'Dear ' + JobApp."First Name" + ' ' + JobApp."Middle Name" + ' ' + JobApp."Last Name" + ',';
                    BodyFail += '<br>We regret to inform you that you have not been selected.<br>';
                    BodyFail += '<br>Kind Regards,<br> <br>The Human Resource Department<br>';
                    BodySuc += 'Dear ' + JobApp."First Name" + ' ' + JobApp."Middle Name" + ' ' + JobApp."Last Name" + ' ,';
                    BodySuc += '<br>We congratulate you in being selected into the Agency.<br>';
                    BodySuc += '<br>Kind Regards,<br> <br>The Human Resource Department<br>';

                    if Rec."Interview Panel Outcome" = Rec."Interview Panel Outcome"::Unsuccessful then begin
                        EmailMessFail.Create(Recepient, Subject, BodyFail);
                        Emai.OpenInEditor(EmailMessFail, EmailScen::HR);
                    end else begin
                        EmailMessSucc.Create(Recepient, Subject, BodySuc, true);
                        Emai.OpenInEditor(EmailMessSucc, EmailScen::HR);
                    end;
                    Rec.Notified := true;
                    Rec."Notified On" := CurrentDateTime;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    var
        Recruitment: Codeunit Recruitment;
        Emai: Codeunit Email;
        EmailMessSucc: Codeunit "Email Message";
        EmailMessFail: Codeunit "Email Message";
        EmailScen: Enum "Email Scenario";
        Recepient, Subject, BodySuc, BodyFail : Text;
        JobApp: Record "Job Applications";
        CandInterQue: Record "Candidate Interview Question";

    local procedure SetControlAppearance()
    begin
        Rec.CalculateAvgScore();
    end;
}

