page 50129 "CIT Suggestion Review"
{
    ApplicationArea = All;
    Caption = 'CIT Suggestion Review';
    PageType = Card;
    SourceTable = "Suggestion Box";
    //SourceTableView = where("Process Status" = const("Under CIT Review"));

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.', Comment = '%';
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested By field.', Comment = '%';
                }
                field("Requested By Name"; Rec."Requested By Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested By Name field.', Comment = '%';
                }
                field(Proposal; Rec.Proposal)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proposal field.', Comment = '%';
                }
                field(Submitted; Rec.Submitted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submitted field.', Comment = '%';
                }
                field("ICT Feedback"; Rec."ICT Feedback")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Feedback field.', Comment = '%';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.', Comment = '%';
                }
                field("Has Feedback"; Rec."Has Feedback")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Has Feedback field.', Comment = '%';
                }
                field("System Type"; Rec."System Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the System Type field.', Comment = '%';
                }
                field("Raised Date"; Rec."Raised Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Raised Date field.', Comment = '%';
                }
                field("Project Team"; Rec."Project Team")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Team field.', Comment = '%';
                }
                field("Project Team Name"; Rec."Project Team Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Team Name field.', Comment = '%';
                }
                field("Rejection Reason"; Rec."Rejection Reason")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rejection Reason field.';
                }
                field("Created Preliminary Report"; Rec."Created Preliminary Report")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Preliminary Report field.', Comment = '%';
                }
                field("Created TOR"; Rec."Created TOR")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created TOR field.', Comment = '%';
                }
                field("Minimum Requirements"; Rec."Minimum Requirements")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Requirements field.', Comment = '%';
                }
                field("Reviewed User Requirements/Technical Specifications"; Rec."Reviewed User Requirements/Technical Specifications")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reviewed User Requirements/Technical Specifications field.', Comment = '%';
                }
                field("Checked Workplan and Verified Budget"; Rec."Checked Workplan and Verified Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Checked Workplan and Verified Budget field.', Comment = '%';
                }

                // field("Logical and Physical Design Upload"; Rec."Logical and Physical Design Upload")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Logical and Physical Design Upload field.', Comment = '%';
                // }
                // field("System Testing"; Rec."System Testing")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the System Testing field.', Comment = '%';
                // }
                // field("User Manual"; Rec."User Manual")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the User Manual field.', Comment = '%';
                // }
                // field("Training Report"; Rec."Training Report")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Training Report field.', Comment = '%';
                // }
                // field("System Acceptance Report"; Rec."System Acceptance Report")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the System Acceptance Report field.', Comment = '%';
                // }
                // field("Handing Over Report"; Rec."Handing Over Report")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Handing Over Report field.', Comment = '%';
                // }
            }
            part("Suggestion Box Lines"; "Suggestion Box Lines")
            {
                Editable = false;
                ApplicationArea = Basic;
                SubPageLink = No = field(No);
            }
        }
        area(FactBoxes)
        {
            part("Attached Documents1"; "Doc. Attachment List Factbox1")
            {
                ApplicationArea = All;
                Caption = 'Attachment';
                SubPageLink = "Table ID" = CONST(50049), "No." = FIELD(No);
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Send For Approval")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Category4;
                Image = SendApprovalRequest;
                Caption = '&Send For Approval';
                ToolTip = 'Executes the &Send For Approval action.';

                trigger OnAction()
                begin
                    VarVariant := Rec;
                    if CustomApproval.CheckApprovalsWorkflowEnabled(VarVariant) = true then begin
                        CustomApproval.OnSendDocForApproval(VarVariant);
                        Rec."Process Status" := Rec."Process Status"::"Under Approval";
                        Rec.Modify(true);
                    end;
                end;
            }
            action("Cancel Approval")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Category4;
                Image = CancelApprovalRequest;
                Caption = '&Cancel Approval';
                ToolTip = 'Executes the &Cancel Approval action.';

                trigger OnAction()
                begin
                    VarVariant := Rec;
                    if CustomApproval.CheckApprovalsWorkflowEnabled(VarVariant) = true then begin
                        CustomApproval.OnCancelDocApprovalRequest(VarVariant);
                        Rec."Process Status" := Rec."Process Status"::"Under CIT Review";
                        Rec.Modify(true);
                    end;
                end;
            }
            action("Reject Suggestion")
            {
                ApplicationArea = All;
                Caption = 'Reject Suggestion', comment = 'NLB="YourLanguageCaption"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Reject;
                ToolTip = 'Executes the Reject Suggestion action.';

                trigger OnAction()
                begin
                    Rec.TestField("Rejection Reason");
                    Rec.TestField("Requester Email");
                    Recepient := Rec."Requester Email";
                    Subject := 'Rejection of Suggestion';
                    Body += 'Dear ' + Rec."Requested By Name" + ',';
                    Body += '<br><br>we appreciate for your time to raise your suggestion on the ' + Format(Rec."System Type") + 'system.';
                    Body += '<br><br>After much evaluation, we have decided not to go through with the suggestion due to ' + Rec."Rejection Reason" + '.';
                    Body += '<br>We thank you for your effort and encourage you to send more suggestions on the systems in order to ensure their efficiency.';
                    Body += '<br><br>Kind Regards,';
                    Body += '<br>The ICT Department.';
                    EmailMess.Create(Recepient, Subject, Body, true);
                    Email.Send(EmailMess, EmailScen::Default);

                    Rec."Process Status" := Rec."Process Status"::Rejected;
                    Rec.Modify(true);
                end;
            }
        }
    }
    var
        Recepient, Subject, Body : Text;
        Email: Codeunit Email;
        EmailMess: Codeunit "Email Message";
        EmailScen: Enum "Email Scenario";
        UserSet: Record "User Setup";
        SugList: Text;
        SuggestLines: Record "Suggestion Box Lines";
        VarVariant: Variant;
        CustomApproval: Codeunit "Custom Approvals Codeunit";
        ApprovalMgt: Codeunit "Approvals Mgmt.";
}
