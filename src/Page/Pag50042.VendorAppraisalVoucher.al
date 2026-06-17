page 50042 "Vendor Appraisal Voucher"
{
    PageType = Card;
    SourceTable = "Vendor Appraisal Voucher";
    PromotedActionCategories = 'New,Process,Report,Request Approval,Notify,Post,Navigate,Appraisal';
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Appraisal Period field.';
                }
                field("Tendor Category"; Rec."Tendor Category")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Tendor Category field.';
                }
                field("Tender Category Description"; Rec."Tender Category Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Category Description field.';
                }
                field("Evaluation Template"; Rec."Evaluation Template")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Evaluation Template field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
            }
            part("Vendor Evaluation Score Entry"; "Vendor Evaluation Score Entry")
            {
                Caption = 'Vendor Evaluation';
                ApplicationArea = Basic;
                SubPageLink = Code = FIELD("Document No");
            }
            group(Recommendation)
            {
                field("Recommendation(s)"; Rec."Recommendation(s)")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Recommendation(s) field.';
                }
                field("Suggested Areas of Improvement"; Rec."Suggested Areas of Improvement")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Suggested Areas of Improvement field.';
                }
                field("Legal Department Remark(s)"; Rec."Legal Department Remark(s)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Legal Department Remark(s) field.', Comment = '%';
                    ShowMandatory = true;
                }
            }
            group(Complaints)
            {
                field("Complaints to the Supplier"; Rec."Complaints to the Supplier")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Complaints to the Supplier field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Appraisal)
            {
                action(Approvals)
                {
                    AccessByPermission = TableData 454 = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    var
                        WorkflowsEntriesBuffer: Record "Workflow Buffer";
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RECORDID);
                    end;
                }
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                        Lines: Record "Vendor Evaluation Score Entry";
                    begin
                        Rec.TestField("Tendor Category");
                        Rec.TestField("Document Date");
                        Rec.TestField("Document No");
                        Rec.TestField("Vendor Name");
                        Rec.TestField("Appraisal Period");
                        Rec.TestField("Approval Status", Rec."Approval Status"::Open);
                        Rec.TestField(Posted, false);
                        Lines.Reset();
                        Lines.SetRange(Code, Rec."Document No");
                        if Lines.FindSet() then begin
                            repeat
                                Lines.TestField("Vendor No.");
                                Lines.TestField("Scores Remarks");
                                Lines.TestField("Evaluation Results");
                            until Lines.Next() = 0;
                        end;
                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant)
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        Rec.TestField("Approval Status", Rec."Approval Status"::"Pending Approval");//status must be open.
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                    end;
                }
                action(Print)
                {
                    Image = Print;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Report;
                    ToolTip = 'Executes the Print action.';
                    trigger OnAction()
                    var
                        VendorAppraisalVoucher: Record "Vendor Appraisal Voucher";
                    begin
                        VendorAppraisalVoucher.RESET;
                        VendorAppraisalVoucher.SETRANGE("Document No", Rec."Document No");
                        VendorAppraisalVoucher.SETRANGE("Approval Status", Rec."Approval Status"::Approved);
                        IF VendorAppraisalVoucher.FINDFIRST() THEN BEGIN
                            // REPORT.RUN(70146, TRUE, FALSE, VendorAppraisalVoucher);
                            REPORT.RUN(50039, TRUE, FALSE, VendorAppraisalVoucher);
                        END;
                    end;
                }
                action("Send Complaints")
                {
                    ApplicationArea = All;
                    Caption = 'Send Complaints', comment = 'NLB="YourLanguageCaption"';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = Email;
                    ToolTip = 'Executes the Send Complaints action.';

                    trigger OnAction()
                    begin
                        SendComplaints(Rec);
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
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the approval request.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = All;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the approval to a substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = All;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

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

    trigger OnOpenPage()
    begin
        SetControlAppearance();
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance();
    end;

    var
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";

        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";


    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        DocumentErrorsMgt: Codeunit "Document Errors Mgt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin
        if Rec."Approval Status" <> Rec."Approval Status"::Open then
            CurrPage.Editable(false);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;

    local procedure SendComplaints("Vendor Appraisal Voucher": Record "Vendor Appraisal Voucher")
    var
        Ven: Record Vendor;
        Email: Codeunit Email;
        EmailMess: Codeunit "Email Message";
        EmailScen: Enum "Email Scenario";
        Recepient, Subject, Body : Text;
    begin
        "Vendor Appraisal Voucher".Get(Rec."Document No");
        Ven.Get(Rec."Vendor No.");
        if Ven."E-Mail" = '' then
            Error('Kindly insert the email of the vendor that you are reevaluating.');
        Recepient := Ven."E-Mail";

        Subject := 'Complaint Regarding the Contract';
        Body += 'Dear' + Ven.Name;
        Body += ' You are hereby notified that there are complaints that have been raised on the contract.';
        Body += '<br>Kindly find the complaints stated as below:<BR>';
        Body += '<BR> ' + Rec."Complaints to the Supplier" + '<br>';
        Body += '<BR><BR><b>Kind Regards,' + '<BR><BR>The Procurement Department<BR>';
        EmailMess.Create(Recepient, Subject, Body, true);
        Email.Send(EmailMess, EmailScen::Procurement);
    end;


}
