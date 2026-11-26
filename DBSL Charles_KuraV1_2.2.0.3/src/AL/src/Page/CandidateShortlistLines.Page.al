#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69706 "Candidate Shortlist Lines"
{
    PageType = ListPart;
    SourceTable = "Candidate Shortlist Matrix";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Candidate No"; Rec."Candidate No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the candidate. Drill down to open the candidate''s application card.';

                    trigger OnDrillDown()
                    begin
                        OpenCandidateCard();
                    end;
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
                field("Complete Doc Submitted"; Rec."Complete Doc Submitted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Complete Doc Submitted field.';
                }
                // Only the approver shortlists, while the voucher is pending their approval
                field(Shortlisted; Rec.Shortlisted)
                {
                    ApplicationArea = Basic;
                    Caption = 'Shortlist';
                    Visible = CanShortlist;
                    Editable = CanShortlist;
                    ToolTip = 'Tick to invite the candidate for interview. Unticked means Non-Responsive.';
                }
                field("Shortlisting Outcome"; Rec."Shortlisting Outcome")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Set by the approver through the Shortlist tick: Invite for Interview or Non-Responsive.';
                }
                field("Committee Remarks"; Rec."Committee Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee Remarks field.';
                }
                field("Unsuccesfull App Reason Code"; Rec."Unsuccesfull App Reason Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unsuccesfull App Reason Code field.';
                }
                field("Ability Test Report ID"; Rec."Ability Test Report ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ability Test Report ID field.';
                }
                field("Phone Interview Report ID"; Rec."Phone Interview Report ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone Interview Report ID field.';
                }
                field("Ability Test Pass Score %"; Rec."Ability Test Pass Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ability Test Pass Score % field.';
                }
                field("Phone Interview Outcome"; Rec."Phone Interview Outcome")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone Interview Outcome field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                // Contact details are hidden from approvers of this shortlist
                field("Phone No."; PhoneNoTxt)
                {
                    ApplicationArea = Basic;
                    Caption = 'Phone No.';
                    Editable = not HideContactDetails;
                    ToolTip = 'Specifies the value of the Phone No. field.';

                    trigger OnValidate()
                    begin
                        Rec."Phone No." := CopyStr(PhoneNoTxt, 1, MaxStrLen(Rec."Phone No."));
                    end;
                }
                field("Mobile Phone No."; MobilePhoneNoTxt)
                {
                    ApplicationArea = Basic;
                    Caption = 'Mobile Phone No.';
                    Editable = not HideContactDetails;
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.';

                    trigger OnValidate()
                    begin
                        Rec."Mobile Phone No." := CopyStr(MobilePhoneNoTxt, 1, MaxStrLen(Rec."Mobile Phone No."));
                    end;
                }
                field(Email; EmailTxt)
                {
                    ApplicationArea = Basic;
                    Caption = 'Email';
                    Editable = not HideContactDetails;
                    ToolTip = 'Specifies the value of the Email field.';

                    trigger OnValidate()
                    begin
                        Rec.Email := CopyStr(EmailTxt, 1, MaxStrLen(Rec.Email));
                    end;
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
                field("Tax Registration No."; Rec."Tax Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Registration No. field.';
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marital Status field.';
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
                field("Qualification Name"; Rec."Qualification Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Name field.';
                }
                field("Work Experience (Years)"; Rec."Work Experience (Years)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Experience (Years) field.';
                }
                field("Management Experience (Years)"; Rec."Management Experience (Years)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Management Experience (Years) field.';
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
                field("Disability Certificate No"; Rec."Disability Certificate No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Certificate No field.';
                }
                field(Notified; Rec.Notified)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notified field.';
                }
                field("Notified On"; Rec."Notified On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notified On field.';
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Religion field.';
                }
                field("Highest Academic Hierarchy Poi"; Rec."Highest Academic Hierarchy Poi")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Highest Academic Hierarchy Poi field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(CandidateCard)
            {
                ApplicationArea = Basic;
                Caption = 'Candidate Card';
                Image = Card;
                ToolTip = 'Open the selected candidate''s application card.';

                trigger OnAction()
                begin
                    OpenCandidateCard();
                end;
            }
            group("Candidate Score")
            {
                action("Candidate Shortlist Score")
                {
                    ApplicationArea = Basic;
                    Image = SerialNo;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Candidate Shortlist Scoring";
                    RunPageLink = "Document No." = field("Document No"),
                                  "Application No." = field("Application No.");
                    ToolTip = 'Executes the Candidate Shortlist Score action.';
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.Update(true);
    end;

    trigger OnAfterGetRecord()
    begin
        SetContactDetails();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        PhoneNoTxt := '';
        MobilePhoneNoTxt := '';
        EmailTxt := '';
    end;

    local procedure SetContactDetails()
    begin
        CanShortlist := IsPendingWithCurrentUser(Rec."Document No");
        HideContactDetails := IsCurrentUserApprover(Rec."Document No");
        if HideContactDetails then begin
            PhoneNoTxt := '';
            MobilePhoneNoTxt := '';
            EmailTxt := '';
        end else begin
            PhoneNoTxt := Rec."Phone No.";
            MobilePhoneNoTxt := Rec."Mobile Phone No.";
            EmailTxt := Rec.Email;
        end;
    end;

    // Opens the candidate's Job Application card read-only; approvers do not see contact details there either
    local procedure OpenCandidateCard()
    var
        JobApplication: Record "Job Applications";
        JobApplicationCard: Page "Job Application";
    begin
        if Rec."Application No." = '' then
            Error('Select a candidate first.');
        if not JobApplication.Get(Rec."Application No.") then
            Error('Job application %1 was not found.', Rec."Application No.");
        JobApplication.SetRecFilter();
        JobApplicationCard.SetTableView(JobApplication);
        JobApplicationCard.SetRecord(JobApplication);
        JobApplicationCard.SetHideContactDetails(IsCurrentUserApprover(Rec."Document No"));
        JobApplicationCard.Editable(false);
        JobApplicationCard.Run();
    end;

    // True while the voucher is Pending Approval and the current user has an open approval entry on it
    local procedure IsPendingWithCurrentUser(DocNo: Code[30]): Boolean
    var
        SelectionHeader: Record "Candidate Selection Header";
        ApprovalEntry: Record "Approval Entry";
    begin
        if (DocNo = CachedPendingDocNo) and PendingCacheSet then
            exit(CachedCanShortlist);
        CachedPendingDocNo := DocNo;
        PendingCacheSet := true;
        CachedCanShortlist := false;
        SelectionHeader.SetRange("Document Type", SelectionHeader."Document Type"::"Candidate Shortlisting");
        SelectionHeader.SetRange("Document No.", DocNo);
        if SelectionHeader.FindFirst() then
            if SelectionHeader."Approval Status" = SelectionHeader."Approval Status"::"Pending Approval" then begin
                ApprovalEntry.SetRange("Record ID to Approve", SelectionHeader.RecordId);
                ApprovalEntry.SetRange("Approver ID", UserId);
                ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);
                CachedCanShortlist := not ApprovalEntry.IsEmpty();
            end;
        exit(CachedCanShortlist);
    end;

    // True when the current user is (or was) an approver on this shortlist voucher
    local procedure IsCurrentUserApprover(DocNo: Code[30]): Boolean
    var
        SelectionHeader: Record "Candidate Selection Header";
        ApprovalEntry: Record "Approval Entry";
    begin
        if (DocNo = CachedDocNo) and CacheSet then
            exit(CachedIsApprover);
        CachedDocNo := DocNo;
        CacheSet := true;
        CachedIsApprover := false;
        SelectionHeader.SetRange("Document No.", DocNo);
        if SelectionHeader.FindFirst() then begin
            ApprovalEntry.SetRange("Record ID to Approve", SelectionHeader.RecordId);
            ApprovalEntry.SetRange("Approver ID", UserId);
            CachedIsApprover := not ApprovalEntry.IsEmpty();
        end;
        exit(CachedIsApprover);
    end;

    var
        JobApplications: Record "Job Applications";
        PhoneNoTxt: Text[30];
        MobilePhoneNoTxt: Text[30];
        EmailTxt: Text[50];
        HideContactDetails: Boolean;
        CachedDocNo: Code[30];
        CachedIsApprover: Boolean;
        CacheSet: Boolean;
        CanShortlist: Boolean;
        CachedPendingDocNo: Code[30];
        CachedCanShortlist: Boolean;
        PendingCacheSet: Boolean;
}

