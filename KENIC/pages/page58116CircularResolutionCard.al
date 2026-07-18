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

                    // trigger OnAssistEdit()
                    // begin
                    //     if Rec.AssistEdit(xRec) then
                    //         CurrPage.Update();
                    // end;
                }
                // field("Iniator No."; Rec."Employee No.")
                // {
                //     ApplicationArea = All;
                //     Editable = false;
                // }

                field("Iniator Name"; Rec."Initiator Name")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                // field("Department Code"; Rec."Department Code")
                // {
                //     ApplicationArea = All;
                //     Editable = IsDocumentEditable;
                // }
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
            part("Circular Resolution Attachments"; "Sharepoint File List")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "No." = field("No.");
            }
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
                    begin
                        Rec.TestField("No.");

                        if not IsDocumentEditable then
                            exit;

                        ResLines.Reset();
                        ResLines.SetRange("Resolution No.", Rec."No.");

                        Page.RunModal(Page::"Resolution lines Card", ResLines);
                        

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
                        Rec.UpdateStatusBasedOnDeadline();
                        if Rec.Status = Rec.Status::Closed then
                            Error('Cannot post because the voting deadline has already passed.');

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
                    Visible = false;

                    trigger OnAction()
                    var
                        ResVote: Record "Circular Resolution lines";
                    begin
                        Rec.TestField("No.");
                        if not IsDocumentEditable then
                            exit;
                        if Confirm('Are you sure you want to remove all board members from this circular resolution?', false) then begin
                            ResVote.Reset();
                            ResVote.SetRange("Resolution No.", Rec."No.");
                            if not ResVote.IsEmpty() then begin
                                ResVote.DeleteAll(true);
                                Message('All board members have been removed.');
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
                action(UploadDocument)
                {
                    ApplicationArea = All;
                    Caption = 'Upload Document';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Upload documents for this Circular Resolution.';
                    Enabled = IsDocumentEditable;

                    trigger OnAction()
                    var
                        DMSManagement: Codeunit "DMS Management";
                    begin
                        if not IsDocumentEditable then
                            Error('Documents cannot be uploaded after the resolution has been sent for approval or posted.');
                        Rec.TestField("No.");
                       // Rec.TestField("Department Code");
                        DMSManagement.UploadCircularResolutionDocuments(Rec."No.", 'Circular Resolutions', Rec.RecordId);
                    end;
                }

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

                        Rec.UpdateStatusBasedOnDeadline();
                        if Rec.Status = Rec.Status::Closed then
                            Error('Cannot send for approval because the voting deadline has passed.');

                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then begin
                            CustomApprovals.OnSendDocForApproval(VarVariant);


                            Rec.Get(Rec."No.");
                            if Rec."Approval Status" = Rec."Approval Status"::"Pending Approval" then begin
                                Rec.Status := Rec.Status::"Pending Approval";
                                Rec.Modify(true);
                            end;
                        end;
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

                        //  update Status to Open
                        Rec.Get(Rec."No.");
                        if Rec."Approval Status" = Rec."Approval Status"::Open then begin
                            Rec.Status := Rec.Status::Open;
                            Rec.Modify(true);
                        end;
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


                        Rec.Get(Rec."No.");
                        if Rec."Approval Status" = Rec."Approval Status"::Released then begin
                            Rec.Status := Rec.Status::Approved;
                            Rec.Modify(true);
                        end;
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


                        Rec.Get(Rec."No.");
                        if Rec."Approval Status" = Rec."Approval Status"::Rejected then begin
                            Rec.Status := Rec.Status::Rejected;
                            Rec.Modify(true);
                        end;
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
        Rec.UpdateStatusBasedOnDeadline();
        SetControlAppearance();
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.UpdateStatusBasedOnDeadline();
        SetControlAppearance();
    end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        IsDocumentEditable :=
                            (Rec.Status = Rec.Status::Open) and
                            (Rec."Approval Status" = Rec."Approval Status"::Open) and
                            (not Rec.Posted);
    end;

    var
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        IsDocumentEditable: Boolean;
}