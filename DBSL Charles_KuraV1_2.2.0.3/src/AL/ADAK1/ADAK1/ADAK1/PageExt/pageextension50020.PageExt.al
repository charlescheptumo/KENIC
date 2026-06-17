#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50020 "pageextension50020" extends "Purchase Invoice"
{



    layout
    {



        modify("Vendor Invoice No.")
        {
            Caption = 'Document Referrence No.';
        }
        modify(Status)
        {
            Editable = false;
        }

        modify("Posting Description")
        {
            Visible = true;
        }

        addafter("Posting Description")
        {
            field("Certificate Number"; Rec."Certificate Number")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Certificate Number field.';
            }
            field("Advance Recovery %"; Rec."Advance Recovery %")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Advance Recovery % field.';
            }
            field("Retention %"; Rec."Retention %")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Retention % field.';
            }
            field("Project No"; Rec."Project No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Project No field.';
            }
            field("Project Name"; Rec."Project Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Project Name field.';
            }
            part("Attached Documents1"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachment GRN';
                SubPageLink = "Table ID" = CONST(38), "Document Type" = FIELD("Document Type"), "No." =
                FIELD("No.");
            }





        }

        addafter(PurchLines)
        {
            part(Control111; "Approval Entry")
            {
                Caption = 'Tracking';
                SubPageLink = "Document No." = field("No.");
                ApplicationArea = All;
            }
        }
        moveafter("Prices Including VAT"; "Payment Terms Code")
    }

    actions
    {

        addafter(RemoveFromJobQueue)
        {
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Document';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                visible = false;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Attach Document action.';


                trigger OnAction()
                begin
                    DMSManagement.UploadPurchaseorderDocuments(Rec."No.", 'Purchase Invoice', Rec.RecordId, Rec."Shortcut Dimension 1 Code");
                end;
            }
        }
        addafter("Request Approval")
        {
            action(SendApprovalRequest1)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Request approval of the document.';

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    PurchaseLine: Record "Purchase Line";
                begin
                    VarVariant := Rec;
                    //  Rec.TestField(Description);
                    Rec.TestField("Shortcut Dimension 1 Code");
                    PurchaseLine.Reset();
                    PurchaseLine.SetRange("Document No.", Rec."No.");
                    PurchaseLine.SetRange("Document Type", Rec."Document Type");
                    if PurchaseLine.FindSet() then begin
                        repeat
                            PurchaseLine.TestField("Gen. Bus. Posting Group");
                            PurchaseLine.TestField("Gen. Prod. Posting Group");
                            PurchaseLine.TestField("Unit Cost");
                        until PurchaseLine.Next() = 0;
                    end;
                    //   IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                    //   CustomApprovals.OnSendDocForApproval(VarVariant);

                    if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
                        ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
                end;
            }
            action(CancelApprovalRequest1)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cancel Approval Re&quest';
                Image = CancelApprovalRequest;
                Promoted = true;
                visible = false;
                PromotedCategory = Process;
                ToolTip = 'Cancel the approval request.';

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);

                end;
            }
        }

    }
    trigger OnOpenPage()
    var

    begin
        if (Rec.Status = Rec.Status::"Pending Approval") or (Rec.Status = Rec.Status::Released) then begin
            CurrPage.Editable := false;
        end;
    end;





    var
        PurchaseLine: Record "Purchase Line";
        DMSManagement: Codeunit "DMS Management";


}



