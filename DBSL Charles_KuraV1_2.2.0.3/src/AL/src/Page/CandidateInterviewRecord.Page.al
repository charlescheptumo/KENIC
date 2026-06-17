#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69812 "Candidate Interview Record"
{
    PageType = Document;
    SourceTable = "Candidate Interview Record";
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
                field("Interview Scoresheet Template"; Rec."Interview Scoresheet Template")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Interview Scoresheet Template field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Candidate Shortlist Vouch No."; Rec."Candidate Shortlist Vouch No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate Shortlist Vouch No. field.';
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
                field("Assigned Panel ID"; Rec."Assigned Panel ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Panel ID field.';
                }
                field("Panel Member No."; Rec."Panel Member No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Panel Member No. field.';
                }
                field(Member; Rec.Member)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
            }
            part(Control32; "Interview Questions")
            {
                SubPageLink = "Document No." = field("Document No."),
                              "Interview Scoresheet Template" = field("Interview Scoresheet Template");
                UpdatePropagation = Both;
            }
            group("Interview Outcome/Results")
            {
                Caption = 'Interview Outcome/Results';
                field("Panel Interview Outcome"; Rec."Panel Interview Outcome")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                    Editable = Edit;
                    ToolTip = 'Specifies the value of the Panel Interview Outcome field.';

                    // trigger OnValidate()
                    // begin
                    //     if Rec."Panel Interview Outcome" = Rec."Panel Interview Outcome"::Fail then begin
                    //         Edit := false;
                    //     end;
                    // end;
                }
                field("Panel Interview Score %"; Rec."Panel Interview Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Panel Interview Score % field.';
                }
                field("Panelist Interview Remarks"; Rec."Panelist Interview Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Panelist Interview Remarks field.';
                }
                field("Unsuccesful App Reason Code"; Rec."Unsuccesful App Reason Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unsuccesful App Reason Code field.';


                    trigger OnValidate()
                    begin
                        if Edit = true then begin
                            Editable := true;
                        end else begin
                            Editable := false;
                        end;
                    end;
                }
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
            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                // SubPageLink = "Table ID" = const(Database::"Candidate Interview Record"),
                //               "No." = field("Document No.");
                SubPageLink = "Table ID" = const(Database::"Candidate Interview Question"),
                              "No." = field("Document No.");
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
                ToolTip = 'Executes the Post action.';

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to complete the evaluation?';
                begin
                    // Rec.TestField(Posted, false);
                    if Confirm(TXT001) = true then begin
                        Recruitment.PostInterviewRecord(Rec);
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Posted On" := CurrentDatetime;
                        Rec.Modify(true);
                    end
                end;
            }
            action("Send Notification")
            {
                ApplicationArea = All;
                Image = Email;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Send Notification action.';

                trigger OnAction()
                begin
                    JobApp.Get(Rec."Candidate No.");
                    if JobApp."E-Mail" = '' then
                        Error('Kindly insert the Email of the Job Applicant');

                    Recepient := JobApp."E-Mail";
                    Subject := 'Job Application Results';
                    BodyFail += 'Dear ' + JobApp."First Name" + ' ' + JobApp."Middle Name" + ' ' + JobApp."Last Name" + ' ,';
                    BodyFail += '<br>We regret to inform you that you have not been selected.<br>';
                    BodyFail += '<br>Kind Regards,<br> <br>The Human Resource Department<br>';
                    BodySuc += 'Dear ' + JobApp."First Name" + ' ' + JobApp."Middle Name" + ' ' + JobApp."Last Name" + ' ,';
                    BodySuc += '<br>We congratulate you in being selected into the Agency.<br>';
                    BodySuc += '<br>Kind Regards,<br> <br>The Human Resource Department<br>';

                    if Rec."Panel Interview Outcome" = Rec."Panel Interview Outcome"::Pass then begin
                        EmailMessFail.Create(Recepient, Subject, BodyFail);
                        Email.Send(EmailMessFail, EmailScen::HR);
                    end else begin
                        EmailMessSucc.Create(Recepient, Subject, BodySuc);
                        Email.Send(EmailMessSucc, EmailScen::HR);
                    end;
                end;
            }
        }
    }


    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Edit := true;
    end;


    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields(Rec."Panel Interview Score %");
    end;

    trigger OnModifyRecord(): Boolean
    begin
        Rec.CalcFields(Rec."Panel Interview Score %");
    end;

    var

        Recruitment: Codeunit Recruitment;
        Email: Codeunit Email;
        EmailMessSucc: Codeunit "Email Message";
        EmailMessFail: Codeunit "Email Message";
        EmailScen: Enum "Email Scenario";
        Recepient, Subject, BodySuc, BodyFail : Text;
        JobApp: Record "Job Applications";
        CandInterQue: Record "Candidate Interview Question";
        Edit: Boolean;
}

