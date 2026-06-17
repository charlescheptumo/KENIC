#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95307 "Followup Audit Voucher"
{
    PageType = Card;
    SourceTable = "Audit Followup Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
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
                field("Primary RC ID"; Rec."Primary RC ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary RC ID field.';
                }
                field("Reporting As At"; Rec."Reporting As At")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reporting As At field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
            }
            part("Open Audit Management Actions"; "Audit Voucher Lines Followup")
            {
                Caption = 'Open  Management Actions';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Suggest Open Audit Tasks")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Open Audit Tasks action.';

                trigger OnAction()
                begin
                    /*This Action is a processing-only report used by the lead auditor to suggest the audit
                  actions/tasks that are pending review by the auditor (The pending audit
                  actions/tasks are those that the auditee status is Completed but the Auditor
                  Followup Review Status::Open since they are yet to be verified & closed by the
                  auditor).
                  2. The Action transfers field values from the Audit Management Action Ledger table to
                  the Followup Audit Voucher Line table*/

                    //RiskManagement.FnSuggestFAVoucherLines(AuditManagementActionLedger,AuditImplementationLogLine,Rec,FollowupAuditVoucherLine);
                    Message('Open Audit Management Actions Suggested successfully');

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
                begin
                    Rec.TestField(Status, Rec.Status::Released);
                    Rec.TestField(Posted, false);

                    /*This Action is used to post the follow-up audit voucher (FAV) in order to update the
                    implementation details of the posted audit findings.
                    2. This Action can only be executed for fully approved documents (Status::Released
                    and Posted::False).
                    3. This Action transfers field values from the Followup Audit Voucher Line to the Audit
                    Management Action Ledger table*/




                    //  RiskManagement.FnPostFAVoucher(AuditManagementActionLedger,AuditImplementationLogLine,Rec,FollowupAuditVoucherLine);


                    Rec.Posted := true;
                    Rec.Modify;
                    Message('Follow-up Audit Voucher %1 posted successfully', Rec."Document No.");

                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Send Approval Request action.';

                trigger OnAction()
                begin
                    Message('Send');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = "CancelApprovalRequest";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Cancel Approval Request action.';

                trigger OnAction()
                begin
                    Message('cancelled');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                begin
                    Message('Done');
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Rec.SetRange("Document Type", Rec."Document Type");
                    if Rec.FindSet then
                        Report.Run(95022, true, true, Rec);
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Release action.';

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Released;
                    Rec.Modify(true);
                    Message('Document released successfully');
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Reopen action.';

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify(true);
                    Message('Document reopened successfully');
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Followup Audit Voucher";
    end;

    var
        RiskManagement: Codeunit "Risk Management";
        AuditManagementActionLedger: Record "Audit Management Action Ledger";
        AuditImplementationLogLine: Record "Audit Implementation Log Line";
        AuditFollowupHeader: Record "Audit Followup Header";
        FollowupAuditVoucherLine: Record "Followup Audit Voucher Line";
}

