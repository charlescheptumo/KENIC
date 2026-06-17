/// <summary>
/// Page ContractImplementaionTeamAppt (ID 99518).
/// </summary>
page 99518 ContractImplementationTeamAppt
{
    Caption = 'Contract Implementation Team Appt';
    PageType = Card;
    SourceTable = "IFS Tender Committee";
    PromotedActionCategories = 'New,Process,Report,New Document,Approve,Request Approval,Approvals,Post,Customer';
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Committee Type"; Rec."Committee Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Committee Type field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Appointment Effective Date"; Rec."Appointment Effective Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Appointment Effective Date field.';
                }
                field("Appointing Authority"; Rec."Appointing Authority")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Appointing Authority field.';
                }
            }
            part(Control23; "IFS Tender Committee Member")
            {
                Caption = 'Committee Members';
                SubPageLink = "Document No." = field("Document No."),
                              "Committee Type" = field("Committee Type");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group("Request Approval")
            {
                Caption = 'Request Approval';

                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Send Approval Request action.';

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                    begin
                        VarVariant := Rec;

                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Ellipsis = true;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Cancel Approval Request action.';

                    trigger OnAction()
                    var
                        RecRef: RecordRef;
                        CustomApprovalEntry: Record "Custom Approval Entry";
                        OldStatus: Option;
                        VarVariant: Variant;
                    begin
                        Rec.TestField("Approval Status", Rec."Approval Status"::"Pending Approval");

                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        //   Message('The approval request has been cancelled.');
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Approvals action.';

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalMgt.OpenApprovalEntriesPage(rec.RecordId);
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'Post';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Post action.';

                    trigger OnAction()
                    var
                        ProcurementProcessing: Codeunit "Procurement Processing";
                    begin
                        ProcurementProcessing.FnSendTenderCommitteNotificationProject(Rec);
                    end;
                }

            }
        }
    }
    var
        ApprovalEntry: Record "Approval Entry";
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
}
