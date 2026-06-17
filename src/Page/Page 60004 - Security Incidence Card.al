/// <summary>
/// Page Security Incidence Card (ID 60004).
/// </summary>
page 60004 "Security Incidence Card"
{
    PageType = Card;
    SourceTable = "Security Incidences";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Severity Level"; Rec."Severity Level")
                {
                    ToolTip = 'Specifies the value of the Severity Level field.';
                }
                field("Incident Type"; Rec."Incident Type")
                {
                    ToolTip = 'Specifies the value of the Incident Type field.';
                }
                field("Incident Type Details"; Rec."Incident Type Details")
                {
                    ToolTip = 'Specifies the value of the Incident Type Details field.';
                }
                field("Time Reported"; Rec."Time Reported")
                {
                    ToolTip = 'Specifies the value of the Time Reported field.';
                }
                field(Stakeholder; Rec.Stakeholder)
                {
                    ToolTip = 'Specifies the value of the Stakeholder field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Incidence Stage"; Rec."Incidence Stage")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Incidence Stage field.';
                }
                group("Reporter Information")
                {
                    Caption = 'Reporter Information';
                    field("Reported By Type"; Rec."Reported By Type")
                    {
                        ToolTip = 'Specifies the value of the Reported By Type field.';
                    }
                    field("Reporter Number"; Rec."Reporter Number")
                    {
                        ToolTip = 'Specifies the value of the Reporter Number field.';
                    }
                    field("Reporter Name"; Rec."Reporter Name")
                    {
                        ToolTip = 'Specifies the value of the Reporter Name field.';
                    }
                    field("Reporter Phone Number"; Rec."Reporter Phone Number")
                    {
                        ToolTip = 'Specifies the value of the Reporter Phone Number field.';
                    }
                    field("Reporter Email Address"; Rec."Reporter Email Address")
                    {
                        ToolTip = 'Specifies the value of the Reporter Email Address field.';
                    }
                    field("Time Occured"; Rec."Time Occured")
                    {
                        ToolTip = 'Specifies the value of the Time Occured field.';
                    }
                }
            }
            group("Incidents Details")
            {
                Caption = 'Incident Details';
                field("Incident Details"; Rec."Incident Details")
                {
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Incident Details field.';
                }
            }
            part("Incidence Resolution List"; "Incidence Resolutions List")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = FIELD("No.");
            }
            part("Incidence Mitigation Strategy"; "Incidence Mitigation Strategy")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = FIELD("No.");
            }
        }
        area(factboxes)
        {
            systempart(Notes; Notes)
            {
            }

            systempart(Links; Links)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(SendApprovalRequest)
            {
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                Visible = true;
                ToolTip = 'Executes the Send A&pproval Request action.';

                trigger OnAction()
                var
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    Rec.TESTFIELD("Approval Status", Rec."Approval Status"::Open);
                    Rec.TESTFIELD("Reporter Number");
                    Rec.TESTFIELD("Incident Type");


                    VarVariant := Rec;
                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    // "Approval Status":="Approval Status"::Released;
                    //MODIFY;
                end;
            }
            action(CancelApprovalRequest)
            {
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;
                Visible = true;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';

                trigger OnAction()
                var
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    Rec.TestField("Approval Status", Rec."Approval Status"::"Pending Approval");//status must be open.
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = false;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin

                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RECORDID);
                end;
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GETTABLE(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RUNMODAL;
                end;
            }
            group(Approval)
            {
                Caption = 'Approval';
                Enabled = PendingApp;
                Visible = PendingApp;
            }
            action(Print)
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                var
                    Req: Record "Transport Requisition";
                begin
                    //Req.RESET;
                    //Req.SETRANGE(Req."Transport Requisition No","Transport Requisition No");
                    REPORT.RUN(59018, TRUE, TRUE, Rec);
                end;
            }
            action(AttachDocuments)
            {
                Caption = 'Attach Document';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;
                ToolTip = 'Executes the Attach Document action.';

                trigger OnAction()
                begin
                    //DMSManagement.UploadImprestDocuments(DMSDocuments."Document Type"::"13","Transport Requisition No",'Transport Requisition',RECORDID,"Department Code");
                end;
            }
            action("Submit Incident")
            {
                Enabled = Rec."Incidence Stage" = Rec."Incidence Stage"::New;
                Image = PostApplication;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                ToolTip = 'Executes the Submit Incident action.';

                trigger OnAction()
                var
                    intNo: Integer;
                begin
                    Rec.TESTFIELD("Incidence Stage", Rec."Incidence Stage"::New);
                    Rec."Incidence Stage" := Rec."Incidence Stage"::"In Progress";
                    MESSAGE('Incident Submitted Successfully');
                    //NotifyApplicantEscal();
                    CurrPage.CLOSE;
                end;
            }
            action("Submit Resolution Details")
            {
                Enabled = Rec."Incidence Stage" = Rec."Incidence Stage"::"In Progress";
                Image = PostApplication;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                ToolTip = 'Executes the Submit Resolution Details action.';

                trigger OnAction()
                var
                    intNo: Integer;
                begin
                    Rec.TESTFIELD("Incidence Stage", Rec."Incidence Stage"::"In Progress");
                    Rec."Incidence Stage" := Rec."Incidence Stage"::"Awaiting Closure";
                    MESSAGE('Incident Details Submitted Successfully');
                    NotifyApplicantEscal();
                    CurrPage.CLOSE;
                end;
            }
            action("Resolve/Close")
            {
                Image = CloseYear;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Resolve/Close action.';

                trigger OnAction()
                var
                    intNo: Integer;
                begin
                    //TESTFIELD("Incidence Stage","Incidence Stage"::"Awaiting Closure");
                    Rec."Incidence Stage" := Rec."Incidence Stage"::Closed;
                    Rec.Closed := TRUE;
                    Rec."Closed By" := USERID;
                    Rec."Closed On" := CURRENTDATETIME;
                    NotifyApplicantFeedback();
                    MESSAGE('Incident Resolved');
                    CurrPage.CLOSE;
                end;
            }
        }
    }

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        //SMSMessages: Record "57007";
        DMSManagement: Codeunit "DMS Management";
        DMSDocuments: Record "DMS Documents";
        PendingApp: Boolean;
        Email: Codeunit EMail;
        SMTPMail: Codeunit "Email Message";

    procedure NotifyApplicantEscal()
    var
        HRLeaveApp: Record "HR Leave Applications";
        Emp: Record Employee;
        Filename: Text;
        // SMTPSetup: Record "409";

        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        CompanyInformation: Record "Company Information";
        JobQueueEntry: Record "Job Queue Entry";
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        HumanResourcesSetup: Record "Human Resources Setup";
        Employeerec: Record Employee;
        ReleaverMail: Text;
        // ResourcebookingLines: Record "5379";
        StartTime: Time;
        Enddate: Time;
        Duration: Integer;
        ReasonRec: Code[100];
        Body: Text;
    begin

        ObjCompany.GET();
        HumanResourcesSetup.GET();
        Header := 'CRM Workflow Notification ';

        IF Emp."Company E-Mail" <> '' THEN BEGIN

            Body := '<br>'
            + 'Dear Sir/Madam,'
            + '<br>'
            + 'You are registered to receive notifications related to ' + ObjCompany.Name + '. This is a message to notify you that:'
            + '<br><br>'
            + 'The following security Incidence report No.<b>' + Rec."No." + '</b>' + ' has been forwarded for your action.'
            + '<br><br>'
            + '<br>'
            + 'This is a system generated mail.'
            + '<br>';
            SMTPMail.Create(HumanResourcesSetup."HR E-mail Address", Header, Body, TRUE);
            EMail.Send(SMTPMail);
            MESSAGE('Email notification has been sent successfuly!')
        END;
    end;

    procedure NotifyApplicantFeedback()
    var
        HRLeaveApp: Record "HR Leave Applications";
        Emp: Record Employee;
        Filename: Text;

        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        CompanyInformation: Record "User Setup";
        JobQueueEntry: Record "Job Queue Entry";
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        HumanResourcesSetup: Record "Human Resources Setup";
        Employeerec: Record Employee;
        ReleaverMail: Text;

        StartTime: Time;
        Enddate: Time;
        Duration: Integer;
        ReasonRec: Code[100];
        Body: Text;
    begin

        ObjCompany.GET();
        HumanResourcesSetup.GET();
        Header := 'CRM Notification ';

        IF Emp."Company E-Mail" <> '' THEN BEGIN

            Body := '<br>'
            + 'Dear Sir/Madam,'
            + '<br>'
            + 'You are registered to receive notifications related to ' + ObjCompany.Name + '. This is a message to notify you that:'
            + '<br><br>'
            + 'The following security Incidence report No.<b>' + Rec."No." + '</b>' + ' has been resolved.'
            + '<br><br>'
            + '<br>'
            + 'This is a system generated mail.'
            + '<br>';
            SMTPMail.Create(Rec."Reporter Email Address", Header, Body, TRUE);
            EMail.Send(SMTPMail);
            MESSAGE('Email notification has been sent successfuly!')
        END;
    end;
}

