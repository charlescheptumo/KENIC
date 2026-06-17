namespace KICD.KICD;

using Microsoft.Purchases.Document;
using Microsoft.Foundation.Attachment;
using System.Automation;

page 50242 "Loan Issue Request Card"
{
    ApplicationArea = All;
    Caption = 'Loan Issue Request Card';
    PageType = Document;
    SourceTable = "Purchase Header";
    RefreshOnActivate = true;
    PopulateAllFields = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    ApplicationArea = Basic;
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ToolTip = 'Specifies the value of the Requester ID field.';
                    ApplicationArea = Basic;
                }
                field("Request-By No."; Rec."Request-By No.")
                {
                    ToolTip = 'Specifies the value of the Request-By No. field.';
                    ApplicationArea = Basic;
                }
                field("Request-By Name"; Rec."Request-By Name")
                {
                    ToolTip = 'Specifies the value of the Request-By Name field.';
                    ApplicationArea = Basic;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies a code for the location where you want the items to be placed when they are received.';
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the date when the related document was created.';
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = Basic;
                    Caption = 'Reason for borrowing';
                }
                field("Requisition Type"; Rec."Requisition Type")
                {
                    ToolTip = 'Specifies the value of the Requisition Type field.';
                    ApplicationArea = Basic;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    visible = false;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    Visible = false;
                }
                field("Customer Name2"; Rec."Customer Name2")
                {
                    ToolTip = 'Specifies the value of the Customer Name2 field.', Comment = '%';
                    Caption = 'Customer Name';
                }
                group("Sell-to")
                {
                    Caption = 'Sell-to';
                    field(Address; Rec."Customer Address")
                    {
                        ApplicationArea = All;
                        Importance = Additional;
                        ToolTip = 'Specifies the value of the Customer Address field.';
                    }
                    field("Address 2"; Rec."Customer Address2")
                    {
                        ApplicationArea = All;
                        Importance = Additional;
                        ToolTip = 'Specifies the value of the Customer Address2 field.';
                        visible = false;
                    }
                    field(City; Rec."Customer City")
                    {
                        ApplicationArea = All;
                        Importance = Additional;
                        ToolTip = 'Specifies the value of the Customer City field.';
                        Visible = false;
                    }
                    field("Post Code"; Rec."Customer Post Code")
                    {
                        ApplicationArea = All;
                        Importance = Additional;
                        ToolTip = 'Specifies the value of the Customer Post Code field.';
                        Visible = false;
                    }
                    field("Country/Region"; Rec."Customer Country")
                    {
                        ApplicationArea = All;
                        Importance = Additional;
                        ToolTip = 'Specifies the value of the Customer Country field.';
                        visible = false;
                    }
                    field("Phone No."; Rec."Customer Phone")
                    {
                        ApplicationArea = All;
                        Importance = Additional;
                        ToolTip = 'Specifies the value of the Customer Phone field.';
                        Visible = false;
                    }
                    field("Mobile No."; Rec."Customer Phone2")
                    {
                        ApplicationArea = All;
                        Importance = Additional;
                        ToolTip = 'Specifies the value of the Customer Phone2 field.';
                    }
                    field(Email; Rec."Customer Email")
                    {
                        ApplicationArea = All;
                        Importance = Additional;
                        ToolTip = 'Specifies the value of the Customer EMail field.';
                    }
                }
                field("Duration"; Rec."Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration field.', Comment = '%';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.', Comment = '%';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.', Comment = '%';
                }
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issue Date field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies whether the record is open, waiting to be approved, invoiced for prepayment, or released to the next stage of processing.';
                }
                field(Amount; Rec."Loan Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Loan Amount field.';
                }
            }
            part("Item Lines"; "Loan Item Req. Lines")
            {
                ApplicationArea = Basic;
                UpdatePropagation = Both;
                SubPageLink = "Document No." = field("No.");
            }
        }

        area(factboxes)
        {
            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(Database::"Purchase Header"), "No." = field("No.");
            }
            systempart(Control1900383207; Links)
            {
                //ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(Processing)
        {
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

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    ToolTip = 'Executes the Send Approval Request action.';

                    trigger OnAction()
                    var
                        Var_Varaint: Variant;
                        CustomApprovalMgt: Codeunit "Custom Approvals Codeunit";
                    begin

                        // Rec.TestField(Status, Rec.Status::Open);//status must be open.
                        // Var_Varaint := Rec;
                        // if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(Var_Varaint) then
                        //     CustomApprovalMgt.OnSendDocForApproval(Var_Varaint);

                        //BYPASS EMPTY VENDOR
                        if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then BEGIN

                            IF REC."Buy-from Vendor No." = '' THEN
                                REC."Buy-from Vendor No." := 'VEND0001';
                        END;
                        IF REC."Buy-from Vendor No." = '' THEN
                            REC."Buy-from Vendor No." := 'VEND0001';
                        if rec.amount = 0 then
                            rec.amount := 1;
                        Rec.TestField("Location Code");
                        ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovalsMgt: Codeunit "Custom Approvals Codeunit";
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                        RecRef: RecordRef;
                        CustomApprovalEntry: Record "Approval Entry";
                        OldStatus: Option;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        TXT0002: label 'An approval request has been cancelled.';
                    begin
                        // Rec.TestField(Status, Rec.Status::"Pending Approval");
                        // VarVariant := Rec;
                        // CustomApprovalsMgt.OnCancelDocApprovalRequest(VarVariant);
                        CustomApprovalEntry.Reset;
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."No.");
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                        CustomApprovalEntry.SetFilter(CustomApprovalEntry.Status, '<>%1|<>%2', CustomApprovalEntry.Status::Canceled, CustomApprovalEntry.Status::Rejected);
                        if CustomApprovalEntry.FindSet then
                            repeat
                                //   OldStatus :=ApprovalEntry.Status;
                                CustomApprovalEntry.Status := CustomApprovalEntry.Status::Canceled;
                                CustomApprovalEntry.Modify(true);
                            until CustomApprovalEntry.Next = 0;

                        //Notify The User
                        // EmailNotifications.FnSendCancelApprovalMailCustom(CustomApprovalEntry);
                        Rec.Status := Rec.Status::Open;
                        Rec."Cancelled?" := true;
                        Rec.Modify(true);
                        Message(TXT0002);
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action(Attachments)
                {
                    ApplicationArea = All;
                    Caption = 'Attach Documents';
                    Image = Attach;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                    Visible = true;

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        // Rec.TestField(Status, Rec.Status::Open);
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal();
                    end;
                }

                action("Print")
                {
                    ApplicationArea = Basic;
                    Caption = 'Print';
                    Image = Print;
                    ToolTip = 'Executes the Print action.';

                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetRange("No.", Rec."No.");
                        Rec.FindFirst();
                        Report.Run(Report::"EEM Loan Issue Form", true, true, Rec);
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Home', Comment = 'Generated from the PromotedActionCategories property index 1.';
                actionref(Print_Promoted; Print)
                {
                }
                actionref(Attachments_Promoted; Attachments)
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Approve', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
                actionref(Comment_Promoted; Comment)
                {
                }
                actionref(Delegate_Promoted; Delegate)
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Request Approval', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
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

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        CanCancelApprovalForRecord: Boolean;

    local procedure SetControlAppearance()
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
    end;
}