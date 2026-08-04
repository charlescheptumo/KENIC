page 58155 "ESign Document Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "ESign Header";
    Caption = 'E-Signature Document Card';
    DeleteAllowed = true;
    PromotedActionCategories = 'New,Process,Navigate,Report,Approve,Approval,Approvals';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = IsDocumentEditable;

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the document number.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a title for the document.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'Specifies a brief description of the document.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the overall document status.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the workflow approval status.';
                }
                field("Document URL"; Rec."Document URL")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the original uploaded SharePoint document link.';

                    trigger OnDrillDown()
                    begin
                        if Rec."Document URL" <> '' then
                            Hyperlink(Rec."Document URL");
                    end;
                }

                field("Signed Document URL"; Rec."Signed Document URL")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the final signed SharePoint document link.';

                    trigger OnDrillDown()
                    begin
                        if Rec."Signed Document URL" <> '' then
                            Hyperlink(Rec."Signed Document URL");
                    end;
                }
            }


            part(ESignLines; "ESign Lines")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = FIELD("No.");
                Editable = IsDocumentEditable;
            }
        }

        area(factboxes)
        {
            part(ESignDocFactBox; "ESign Document FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1900576707; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("Functions")
            {
                Caption = 'F&unctions';
                Image = Action;

                action(Post)
                {
                    ApplicationArea = All;
                    Caption = 'Post';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Enabled = (Rec."Approval Status" = Rec."Approval Status"::Released) and (not Rec.Posted);
                    ToolTip = 'Post the E-Signature document after approval.';

                    trigger OnAction()
                    var
                        ESignature: Codeunit "ESIGNATURE";
                    begin
                        Rec.TestField("Approval Status", Rec."Approval Status"::Released);

                        if Rec.Posted then
                            Error('This document has already been posted.');

                        if not Confirm('Do you want to post this E-Signature document?', false) then
                            exit;

                        Rec.Posted := true;
                        Rec.Status := Rec.Status::Posted;
                        Rec.Modify(true);
                        ESignature.NotifySignatoriesToSign(Rec);

                        Message('Document %1 has been posted successfully.', Rec."No.");
                        CurrPage.Update(false);
                    end;
                }

                action(UploadDocument)
                {
                    ApplicationArea = All;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Upload the E-Signature document to SharePoint.';
                    Enabled = IsDocumentEditable;

                    trigger OnAction()
                    var
                        DMSManagement: Codeunit "DMS Management";
                    begin
                        if not IsDocumentEditable then
                            Error('Documents cannot be uploaded after the request has been sent for approval or posted.');

                        Rec.TestField("No.");
                        DMSManagement.UploadESignatureDocument(Rec."No.", Rec.Description, Rec.RecordId);


                        CurrPage.Update(false);
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
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        ESignLines: Record "ESign Line";
                        DocLink: Record "Record Link";
                        VarVariant: Variant;
                        ESignature: Codeunit "ESIGNATURE";
                    begin

                        Rec.TestField("Approval Status", Rec."Approval Status"::Open);
                        Rec.TestField(Status, Rec.Status::Open);


                        ESignLines.Reset();
                        ESignLines.SetRange("Document No.", Rec."No.");
                        if ESignLines.IsEmpty() then
                            Error('You must add at least one person/signee to sign before sending for approval.');


                        DocLink.Reset();
                        DocLink.SetRange("Record ID", Rec.RecordId);
                        if (Rec."Document URL" = '') and DocLink.IsEmpty() then
                            Error('You must upload a document before sending this request for approval.');


                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then begin
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                            ESignature.SendApprovalRequestNotificationsForESignature(Rec."No.");


                            Rec.Get(Rec."No.");
                            if Rec."Approval Status" = Rec."Approval Status"::"Pending Approval" then begin
                                Rec.Status := Rec.Status::"Pending";
                                Rec.Modify(true);
                            end;
                        end;

                        CurrPage.Update(true);
                    end;
                }

                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    Enabled = OpenApprovalEntriesExist;

                    trigger OnAction()
                    var
                        CustomApprovalsMgt: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        Rec.TestField("Approval Status", Rec."Approval Status"::"Pending Approval");
                        VarVariant := Rec;
                        CustomApprovalsMgt.OnCancelDocApprovalRequest(VarVariant);


                        Rec.Get(Rec."No.");
                        if Rec."Approval Status" = Rec."Approval Status"::Open then begin
                            Rec.Status := Rec.Status::Open;
                            Rec.Modify(true);
                        end;

                        CurrPage.Update(true);
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
                        ESignature: Codeunit "ESIGNATURE";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);

                        Rec.Get(Rec."No.");
                        if Rec."Approval Status" = Rec."Approval Status"::Released then begin
                            Rec.Status := Rec.Status::Approved;
                            Rec.Modify(true);
                          ESignature.SendApprovedNotificationToInitiatorForESignature(Rec."No.");
                        end;

                        CurrPage.Update(true);
                      
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
                        ESignature: Codeunit "ESIGNATURE";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);

                        Rec.Get(Rec."No.");
                        if Rec."Approval Status" = Rec."Approval Status"::Rejected then begin
                            Rec.Status := Rec.Status::Rejected;
                            Rec.Modify(true);
                             ESignature.SendRejectedNotificationToInitiatorForESignature(Rec."No.");
                        end;

                        CurrPage.Update(true);
                       
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


        IsDocumentEditable :=
            (Rec.Status = Rec.Status::Open) and
            (Rec."Approval Status" = Rec."Approval Status"::Open);
    end;

    var
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        IsDocumentEditable: Boolean;
}