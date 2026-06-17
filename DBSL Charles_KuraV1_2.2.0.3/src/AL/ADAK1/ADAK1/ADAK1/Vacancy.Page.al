#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69630 "Vacancy"
{
    PageType = Card;
    SourceTable = "Recruitment Requisition Header";
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
                    Caption = 'Vacancy No.';
                    ToolTip = 'Specifies the value of the Vacancy No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Requester Staff No"; Rec."Requester Staff No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requester Staff No field.';
                }
                field("Requester Name"; Rec."Requester Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requester Name field.';
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requester ID field.';
                }
                field("Requisition ID"; Rec."Requisition ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition ID field.';
                }
                field("Recruitment Plan Type"; Rec."Recruitment Plan Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recruitment Plan Type field.';
                }
                field("Recruitment Plan ID"; Rec."Recruitment Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recruitment Plan ID field.';
                }
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position ID field.';
                }
                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title/Designation field.';
                }
                field("No of Openings"; Rec."No of Openings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Openings field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field("Primary Recruitment Reason"; Rec."Primary Recruitment Reason")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Recruitment Reason field.';
                }
                field("Recruitment Justification"; Rec."Recruitment Justification")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Recruitment Justification field.';
                }
                field("Target Candidate Source"; Rec."Target Candidate Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Candidate Source field.';
                }
                field("Sourcing Method"; Rec."Sourcing Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sourcing Method field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
            }
            part("Roles & Responsibilities"; "Vacancy Responsibilities")
            {
                SubPageLink = "Document No." = field("Document No."),
                              "Document Type" = field("Document Type");
            }
            group("Recruitment Timelines")
            {
                field("Recruitment Cycle Type"; Rec."Recruitment Cycle Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recruitment Cycle Type field.';
                }
                field("Recruitment Lead Time"; Rec."Recruitment Lead Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recruitment Lead Time field.';
                }
                field("Planned Recruitment Start Date"; Rec."Planned Recruitment Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Recruitment Start Date field.';
                }
                field("Planned Recruitment End Date"; Rec."Planned Recruitment End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Recruitment End Date field.';
                }
                field("Planned Employment Start Date"; Rec."Planned Employment Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Employment Start Date field.';
                }
                field("Planned Employment End Date"; Rec."Planned Employment End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Employment End Date field.';
                }
            }
            group("Recruitment Budget")
            {
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source ID field.';
                }
                field("Finacial Year Code"; Rec."Finacial Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Finacial Year Code field.';
                }
                field("Recruitment Line Budget Cost"; Rec."Recruitment Line Budget Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recruitment Line Budget Cost(LCY) field.';
                }
                field("Average Cost/Hire"; Rec."Average Cost/Hire")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Average Cost/Hire field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task No. field.';
                }
            }
            group("Job Information")
            {
                field("Staff Establishment"; Rec."Staff Establishment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Establishment field.';
                }
                field("Current Headcount"; Rec."Current Headcount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Headcount field.';
                }
                field("Hierarchically Reports To"; Rec."Hierarchically Reports To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hierarchically Reports To field.';
                }
                field("Functionally  Reports To"; Rec."Functionally  Reports To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Functionally  Reports To field.';
                }
                field("Estimate Annual Salary"; Rec."Estimate Annual Salary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimate Annual Salary field.';
                }
                field("Job Grade ID"; Rec."Job Grade ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Grade ID field.';
                }
                field("Overall Appointment Authority"; Rec."Overall Appointment Authority")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Appointment Authority field.';
                }
                field("Seniority Level"; Rec."Seniority Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Seniority Level field.';
                }
                field("Default Terms of Service Code"; Rec."Default Terms of Service Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Terms of Service Code field.';
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employment Type field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control20; Outlook)
            {
            }
            systempart(Control21; Notes)
            {
            }
            systempart(Control22; MyNotes)
            {
            }
            systempart(Control23; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Executes the Send A&pproval Request action.';

                trigger OnAction()
                var
                // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);
                    Message('Approval Request has been approved');
                    Rec."Approval Status" := Rec."approval status"::Released;
                    Rec.Modify(true);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category9;
                PromotedIsBig = false;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin
                    //ApprovalEntries.Setfilters(DATABASE::"Purchase Header","Document Type","No.");
                    // ApprovalEntries.Setfilters(Database::"Purchase Header", 14, "Document No.");
                    // ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);

                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = true;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';

                trigger OnAction()
                var
                // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");
                    Message('Approval Request has been cancelled');
                    Rec."Approval Status" := Rec."approval status"::Open;
                    Rec.Modify(true);
                end;
            }
            separator(Action84)
            {
            }
            separator(Action85)
            {
            }
            action("Create Vacancy Announcement")
            {
                ApplicationArea = Basic;
                Image = CreateBinContent;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Create Vacancy Announcement action.';

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to create a vacancy announcement voucher?') = true then begin
                    end
                end;
            }
            action("Cancel/Terminate Recruitment")
            {
                ApplicationArea = Basic;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Cancel/Terminate Recruitment action.';

                trigger OnAction()
                begin
                    Rec.Published := false;
                    Rec."Vacancy Status" := Rec."vacancy status"::Cancelled;
                    Rec.Modify(true);
                end;
            }
            action("Close Recruitment Project")
            {
                ApplicationArea = Basic;
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                ToolTip = 'Executes the Close Recruitment Project action.';

                trigger OnAction()
                begin
                    Rec.Published := false;
                    Rec."Vacancy Status" := Rec."vacancy status"::Cancelled;
                    Rec.Modify(true);
                end;
            }
            action("Publish to E-Recruitment Portal")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Publish to E-Recruitment Portal action.';

                trigger OnAction()
                begin
                    if Confirm('Are you sure yo want to publish the vacancy %1 to the E-recruitment portal', true, Rec."Document No.") = true then begin
                        Rec.Published := true;
                        Rec.Modify(true);
                    end
                end;
            }
        }
        area(reporting)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print action.';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(69605, true, false, Rec);
                end;
            }
        }
        area(navigation)
        {
            group("Vacancy Details")
            {
                action("Position Requirements")
                {
                    ApplicationArea = Basic;
                    Image = Register;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Vacancy Requirements";
                    RunPageLink = "Document No." = field("Document No.");
                    ToolTip = 'Executes the Position Requirements action.';
                }
                action("Vacancy Substitutes")
                {
                    ApplicationArea = Basic;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Vacancy Substitutes";
                    ToolTip = 'Executes the Vacancy Substitutes action.';
                }
                action("Position Responsibilities")
                {
                    ApplicationArea = Basic;
                    Image = ReceiveLoaner;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Vacancy Responsibilities";
                    ToolTip = 'Executes the Position Responsibilities action.';
                }
                action("Position Work Condition")
                {
                    ApplicationArea = Basic;
                    Image = WorkCenter;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Vacancy Work Condition";
                    ToolTip = 'Executes the Position Work Condition action.';
                }
                action("Position Benefits")
                {
                    ApplicationArea = Basic;
                    Image = BankAccountLedger;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Benefit Plan Grade";
                    RunPageLink = "Job Grade ID" = field("Job Grade ID");
                    ToolTip = 'Executes the Position Benefits action.';
                }
                action("Required Documents")
                {
                    ApplicationArea = Basic;
                    Image = Replan;
                    RunObject = Page "Requisition Required Documents";
                    RunPageLink = "Document No." = field("Requisition ID");
                    ToolTip = 'Executes the Required Documents action.';
                }
            }
            group(Applications)
            {

                action("Job Applications")
                {
                    ApplicationArea = Basic;
                    Image = JobJournal;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Job Applications";
                    RunPageLink = "Vacancy Id" = field("Document No.");
                    ToolTip = 'Executes the Job Applications action.';
                }
                action(Longlist)
                {
                    ApplicationArea = Basic;
                    Image = History;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Longlisted Candidates";
                    RunPageLink = "Vacancy Id" = field("Document No.");
                    ToolTip = 'Executes the Longlist action.';
                }
                action(Shortlist)
                {
                    ApplicationArea = Basic;
                    Image = CheckRulesSyntax;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "ShortListed Candidates";
                    RunPageLink = "Vacancy Id" = field("Document No.");
                    ToolTip = 'Executes the Shortlist action.';
                }
                action("Written Assessment")
                {
                    ApplicationArea = Basic;
                    Image = MaintenanceRegistrations;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Written Assessment";
                    RunPageLink = "Vacancy Id" = field("Document No.");
                    ToolTip = 'Executes the Written Assessment action.';
                }
                action("First Interview")
                {
                    ApplicationArea = Basic;
                    Caption = 'First Round';
                    Image = NewSparkle;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "First Interview";
                    RunPageLink = "Vacancy Id" = field("Document No.");
                    ToolTip = 'Executes the First Round action.';
                }
                action("Second Interview")
                {
                    ApplicationArea = Basic;
                    Image = NewSparkle;
                    Caption = 'Final Round';
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Second Interview";
                    RunPageLink = "Vacancy Id" = field("Document No.");
                    ToolTip = 'Executes the Final Round action.';
                }

            }
            group(Activities)
            {
                action(SendAssessment)
                {
                    ApplicationArea = Basic;
                    Image = MaintenanceRegistrations;
                    Promoted = true;
                    PromotedCategory = Category7;
                    Caption = 'Send Assessment';
                    ToolTip = 'Executes the Send Assessment action.';
                    trigger OnAction()
                    var
                        erecruit: Codeunit Recruitment;
                        Apps: Record "Job Applications";
                        Recepients: List of [Text];
                    begin
                        Apps.Reset();
                        Apps.SetRange("Vacancy Id", Rec."Document No.");
                        Apps.SetRange("Invite Written Assessment", true);
                        if Apps.FindSet() then begin
                            repeat
                                Recepients.Add(Apps."E-Mail");

                            until Apps.Next() = 0;
                        end else begin
                            Error('There are no candidates qualified for the written assessment.');
                        end;
                        sendAssessmentEmail(Recepients);
                    end;
                }
                action(SendInterviewInvite)
                {
                    ApplicationArea = Basic;
                    Image = MaintenanceRegistrations;
                    Promoted = true;
                    PromotedCategory = Category7;
                    Caption = 'Send invite for interview';
                    ToolTip = 'Executes the Send invite for interview action.';
                    trigger OnAction()
                    var
                        erecruit: Codeunit Recruitment;
                        Apps: Record "Job Applications";
                        Recepients: List of [Text];
                    begin
                        Apps.Reset();
                        Apps.SetRange("Vacancy Id", Rec."Document No.");
                        Apps.SetRange("Invite interview", true);
                        if Apps.FindSet() then begin
                            repeat
                                Recepients.Add(Apps."E-Mail");

                            until Apps.Next() = 0;
                        end else begin
                            Error('There are no candidates qualified for the invite for interview');
                        end;
                        sendFirstInterview(Recepients);
                    end;
                }
                action(SendSecondInterviewInvite)
                {
                    ApplicationArea = Basic;
                    Image = MaintenanceRegistrations;
                    Caption = 'Send Second Interview Invite';
                    Promoted = true;
                    PromotedCategory = Category7;
                    ToolTip = 'Executes the Send Second Interview Invite action.';
                    trigger OnAction()
                    var
                        erecruit: Codeunit Recruitment;
                        Apps: Record "Job Applications";
                        Recepients: List of [Text];
                    begin
                        Apps.Reset();
                        Apps.SetRange("Vacancy Id", Rec."Document No.");
                        Apps.SetRange("Second interview", true);
                        if Apps.FindSet() then begin
                            repeat
                                Recepients.Add(Apps."E-Mail");

                            until Apps.Next() = 0;
                        end else begin
                            Error('There are no candidates qualified for the Second Interview');
                        end;
                        sendFirstInterview(Recepients);
                    end;
                }


            }
            group(History)
            {
                action("Vacancy Posting")
                {
                    ApplicationArea = Basic;
                    Image = VendorPayment;
                    RunObject = Page "Vacancy Posting";
                    RunPageLink = "Vacancy ID" = field("Document No.");
                    ToolTip = 'Executes the Vacancy Posting action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';

                    trigger OnAction()
                    begin
                        CurrPage.SaveRecord;
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Job Vacancy";
    end;

    procedure sendAssessmentEmail(Recepnt: List of [Text])
    var
        EmailMsg: Codeunit "Email Message";
        Email: Codeunit Email;
        CC: List of [Text];
        BCC: List of [Text];
        Body: Text;
        Ins: InStream;
        TempBlob: Codeunit "Temp Blob";
        Filename: Text;
        Contenttype: Text;
        EmailScenario: Enum "Email Scenario";
        // Sharepoint: Page "Sharepoint File List";
        Url: Text;
        // DMS: Codeunit SharepointDMS;
        GlobalDocType: Enum "Approval Document Type";
    begin
        // Body := 'Please find attached the written assessment';
        // EmailMsg.Create(BCC, 'RECRUITMENT ASSESSMENT', Body, false, CC, Recepnt);
        // UploadIntoStream('Upload', '', '', Filename, Ins);
        // EmailMsg.AddAttachment(Filename, 'PDF', Ins);
        // EmailScenario := EmailScenario::HR;
        // GlobalDocType := "Approval Document Type"::Vacancy;
        // if Email.Send(EmailMsg, EmailScenario) then begin
        //     //Url := DMS.UploadDocument(Rec."Document No.", GlobalDocType);
        //     //Sharepoint.CreateMetaData(Filename, Url);
        // end;

        Body := 'Please find attached the written assessment';

        EmailMsg.Create(BCC, 'INTERVIEW ASSESSMENT', Body, false, CC, Recepnt);
        EmailScenario := EmailScenario::Recruitment;
        Email.OpenInEditor(EmailMsg);

    end;

    procedure sendFirstInterview(Recepnt: List of [Text])
    var
        EmailMsg: Codeunit "Email Message";
        Email: Codeunit Email;
        CC: List of [Text];
        BCC: List of [Text];
        Body: Text;
        Ins: InStream;
        TempBlob: Codeunit "Temp Blob";
        Filename: Text;
        Contenttype: Text;
        EmailScenario: Enum "Email Scenario";
        // Sharepoint: Page "Sharepoint File List";
        Url: Text;
        // DMS: Codeunit SharepointDMS;
        GlobalDocType: Enum "Approval Document Type";
    begin

        EmailMsg.Create(BCC, 'INTERVIEW INVITE', Body, false, CC, Recepnt);
        EmailScenario := EmailScenario::Recruitment;
        Email.OpenInEditor(EmailMsg);

    end;
}

