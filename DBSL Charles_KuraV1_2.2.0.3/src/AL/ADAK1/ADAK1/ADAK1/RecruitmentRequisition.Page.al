#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69627 "Recruitment Requisition"
{
    PageType = Card;
    SourceTable = "Recruitment Requisition Header";
    SourceTableView = where("Document Type" = filter("Recruitment Requisition"));
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
                    Editable = false;
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
                    Editable = true;
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
            group("Vacancy Details")
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
                Caption = 'Document Attachment';
                ToolTip = 'Document Attachment';
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Position Requirements")
            {
                ApplicationArea = Basic;
                Image = Register;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Requisition Requirements";
                RunPageLink = "Document No." = field("Document No.");
                ToolTip = 'Executes the Position Requirements action.';
            }
            action("Requirements Substitutes")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Requisition Substitutes";
                RunPageLink = "Document No." = field("Document No.");
                ToolTip = 'Executes the Requirements Substitutes action.';
            }
            action("Roles & Responsibilities")
            {
                ApplicationArea = Basic;
                Image = ReceiveLoaner;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Requisition Responsibilities";
                RunPageLink = "Document No." = field("Document No.");
                ToolTip = 'Executes the Roles & Responsibilities action.';
            }
            action("Work Condition")
            {
                ApplicationArea = Basic;
                Image = WorkCenter;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Recruitment Work Condition";
                RunPageLink = "Document No" = field("Document No.");
                ToolTip = 'Executes the Work Condition action.';
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                Promoted = true;
                PromotedCategory = Category8;
                PromotedIsBig = true;
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'Executes the Dimensions action.';

                trigger OnAction()
                begin
                    CurrPage.SaveRecord;
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
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalMgt.OpenApprovalEntriesPage(rec.RecordId);
                end;
            }
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
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);

                    // if ApprovalsMgmt.CheckRecruitmentHeaderApprovalPossible(Rec) then
                    //   ApprovalsMgmt.OnSendRecruitmentHeaderForApproval(Rec);

                    VarVariant := Rec;
                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        CustomApprovals.OnSendDocForApproval(VarVariant);
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
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");
                    // ApprovalsMgmt.OnCancelRecruitmentHeaderApprovalRequest(Rec);
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action("Create Vacancy")
            {
                ApplicationArea = Basic;
                Image = PostDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Create Vacancy action.';

                trigger OnAction()
                begin
                    //create the vacancy based on vacancies available
                    Rec.TestField("No of Openings");
                    Rec.TestField("Vacancy Created", false);
                    Rec.TestField("Approval Status", Rec."approval status"::Released);
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Recruitment.TransferRequisitionToVacancy(Rec);
                end;
            }
            action("Suggest Position Requirements")
            {
                ApplicationArea = Basic;
                Caption = 'Populate Position Requirements';
                Image = SuggestPayment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Populate Position Requirements action.';

                trigger OnAction()
                begin
                    Recruitment.CopyPositionDetails(Rec);
                end;
            }
            action("Position Benefits")
            {
                ApplicationArea = Basic;
                Image = BankAccountLedger;
                Promoted = true;
                PromotedCategory = Category7;
                PromotedIsBig = true;
                RunObject = Page "Benefit Plan Grade";
                RunPageLink = "Job Grade ID" = field("Job Grade ID");
                ToolTip = 'Executes the Position Benefits action.';
            }
        }
    }

    var
        Recruitment: Codeunit Recruitment;
    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}

#pragma implicitwith restore

