page 58116 "Circular Resolution Card"
{
    PageType = Document;
    SourceTable = "Circular Resolution Header";
    Caption = 'Circular Resolution Card';
    PromotedActionCategories = 'New,Process,Navigate,Report,Approve,Approval,Approvals';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique resolution number.';
                    Editable = false;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the resolution title.';
                    Editable = IsDocumentEditable;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies detailed description/text of the resolution.';
                    MultiLine = true;
                    Editable = IsDocumentEditable;
                }
                field("Resolution Type"; Rec."Resolution Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the resolution category.';
                    Editable = IsDocumentEditable;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the operational status of the resolution.';
                    Editable = false;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the internal approval workflow status.';
                    Editable = false;
                }
                field("Voting Deadline"; Rec."Voting Deadline")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the final deadline for accepting votes.';
                    Editable = IsDocumentEditable;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if this resolution has been posted.';
                    Editable = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date the resolution was posted.';
                    Editable = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user who posted the resolution.';
                    Editable = false;
                }
            }

            part(OptionsSubform; "Resolution Options Subform")
            {
                Caption = 'Voting Options';
                ApplicationArea = All;
                SubPageLink = "Resolution No." = field("No.");
                Editable = IsDocumentEditable;
            }

            part(VotesSubform; "Resolution Votes Subform")
            {
                Caption = 'Voters & Status';
                ApplicationArea = All;
                SubPageLink = "Resolution No." = field("No.");
                Editable = IsDocumentEditable;
            }

            group(SystemAudit)
            {
                Caption = 'System Audit';
                Editable = false;

                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = All;
                }
                field("Last Modified By"; Rec."Last Modified By")
                {
                    ApplicationArea = All;
                }
                field("Last Modified DateTime"; Rec."Last Modified DateTime")
                {
                    ApplicationArea = All;
                }
                field("Total Members"; Rec."Total Members")
                {
                    ApplicationArea = All;
                }
                field("Total Votes Cast"; Rec."Total Votes Cast")
                {
                    ApplicationArea = All;
                }
                field("Winning Option"; Rec."Winning Option")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019; Notes)
            {
                ApplicationArea = All;
                Visible = false;
            }
            systempart(Control1000000020; Links)
            {
                ApplicationArea = All;
                Visible = false;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("Board Members Group")
            {
                Caption = 'Board Members';
                Image = Employee;

                action(GenerateBoardMembers)
                {
                    ApplicationArea = All;
                    Caption = 'Board Members';
                    ToolTip = 'Open the resolution lines to add or edit board members for notification and voting.';
                    Image = Employee;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ResLines: Record "Circular Resolution lines";
                        ResLinesCard: Page "Resolution lines Card";
                    begin
                        Rec.TestField("No.");
                        if not IsDocumentEditable then
                            exit;

                        ResLines.Reset();
                        ResLines.SetRange("Resolution No.", Rec."No.");

                        Clear(ResLinesCard);
                        ResLinesCard.SetTableView(ResLines);
                        ResLinesCard.RunModal();

                        CurrPage.Update(false);
                    end;
                }

         action(PostResolution)
                {
                    ApplicationArea = All;
                    Caption = 'Post';
                    ToolTip = 'Post the resolution and notify all board members via email.';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Enabled = (not Rec.Posted) and (Rec."Approval Status" = Rec."Approval Status"::Released);

                    trigger OnAction()
                    var
                        ResolutionMgt: Codeunit "Resolution Management";
                        ResolutionLine: Record "Circular Resolution lines";
                        ResOption: Record "Circular Resolution Option";
                    begin
                        Rec.TestField("No.");
                        Rec.TestField(Posted, false);
                        Rec.TestField("Approval Status", Rec."Approval Status"::Released);

                        ResolutionLine.Reset();
                        ResolutionLine.SetRange("Resolution No.", Rec."No.");
                        if ResolutionLine.IsEmpty() then
                            Error('Please add at least one board member before posting.');

                        ResOption.Reset();
                        ResOption.SetRange("Resolution No.", Rec."No.");
                        if ResOption.IsEmpty() then
                            Error('You must add at least one voting option before posting.');

                        if Confirm('Do you want to post this Circular Resolution?', false) then begin
                            Rec.Posted := true;
                            Rec."Posting Date" := Today();
                            Rec."Posted By" := UserId();
                            
                        
                            Rec.Status := Rec.Status::Voting; 
                            Rec.Modify(true);

                            Rec.Get(Rec."No.");

                           
                            ResolutionMgt.NotifyMembersToVote(Rec);

                            Message('Circular Resolution %1 has been posted successfully and member notifications have been dispatched.', Rec."No.");
                            
                            SetControlAppearance();
                            CurrPage.Update(true);
                        end;
                    end;
                }

                action(RemoveAllVoters)
                {
                    ApplicationArea = All;
                    Caption = 'Remove All Members';
                    ToolTip = 'Remove all members currently listed under this circular resolution.';
                    Image = Delete;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        ResVote: Record "Circular Resolution lines";
                    begin
                        Rec.TestField("No.");
                        if not IsDocumentEditable then
                            exit;
                        if Confirm('Are you sure you want to delete all resolution lines from this resolution?', false) then begin
                            ResVote.Reset();
                            ResVote.SetRange("Resolution No.", Rec."No.");
                            if not ResVote.IsEmpty() then begin
                                ResVote.DeleteAll(true);
                                Message('All resolution lines have been cleared.');
                            end;
                            CurrPage.Update(false);
                        end;
                    end;
                }
            }

            group("Functions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist and IsDocumentEditable;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                        ResOption: Record "Circular Resolution Option";
                    begin
                        Rec.TestField("Approval Status", Rec."Approval Status"::Open);

                        ResOption.Reset();
                        ResOption.SetRange("Resolution No.", Rec."No.");
                        if ResOption.IsEmpty() then
                            Error('You must add at least one voting option before sending for approval.');

                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovalsMgt: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.TestField("Approval Status", Rec."Approval Status"::"Pending Approval");
                        VarVariant := Rec;
                        CustomApprovalsMgt.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }

            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = All;
                    Caption = 'Approve';
                    Image = Approve;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    Caption = 'Reject';
                    Image = Reject;
                    ToolTip = 'Reject the approval request.';
                    Visible = OpenApprovalEntriesExistForCurrUser;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = All;
                    Caption = 'Delegate';
                    Image = Delegate;
                    ToolTip = 'Delegate the approval to a substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = All;
                    Caption = 'Comments';
                    Image = ViewComments;
                    ToolTip = 'View or add comments for the record.';
                    Visible = OpenApprovalEntriesExistForCurrUser;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance();
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance();
    end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        IsDocumentEditable := (Rec."Approval Status" = Rec."Approval Status"::Open) and (not Rec.Posted);
    end;

    var
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        IsDocumentEditable: Boolean;
}