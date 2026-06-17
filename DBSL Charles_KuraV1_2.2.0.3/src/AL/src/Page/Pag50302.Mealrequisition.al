namespace KICD.KICD;
using Microsoft.Purchases.Document;
using Microsoft.Purchases.Setup;
using System.Security.User;
using System.Automation;

page 50302 "Meal requisition"
{
    ApplicationArea = All;
    Caption = 'Meal requisition ';
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Request Approval,Comments';
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Requester ID field.';
                }
                field("Request-By No."; Rec."Request-By No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Request-By No. field.';
                }
                field("Request-By Name"; Rec."Request-By Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request-By Name field.';
                }
                field("Name of the Conference"; Rec."Name of the Conference")
                {
                    ToolTip = 'Specifies the value of the Name of the Conference field.', Comment = '%';
                }

                field("Expected No. of People"; Rec."Expected No. of People")
                {
                    ToolTip = 'Specifies the value of the Expected No. of People field.', Comment = '%';
                }

                field("Actual No. of People"; Rec."Actual No. of People")
                {
                    ToolTip = 'Specifies the value of the Actual No. of People field.', Comment = '%';
                }

                field("Time"; Rec."Time")
                {
                    ToolTip = 'Specifies the value of the Time field.', Comment = '%';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = true;
                    ToolTip = 'Specifies a code for the location where you want the items to be placed when they are received.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request Date';
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the date when the order was created.';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Start Date field.', Comment = '%';
                    Caption = 'Start Date';
                }

                field("End Date"; Rec."End Date")
                {
                    Caption = 'End Date';
                    Editable = true;
                }
                field("No. of Days"; Rec."No_of_Days")
                {

                }
                field("Department Name"; Rec."Department Name")
                {
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                    ToolTip = 'Specifies whether the record is open, waiting to be approved, invoiced for prepayment, or released to the next stage of processing.';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ToolTip = 'Specifies the value of the Total Cost field.', Comment = '%';
                    Editable = false;
                }


            }

            part(Cost; "Meals Subform1")
            {
                SubPageLink = "Document No." = field("No.");
            }
            part(PurchLines; "Meals Subform")
            {
                SubPageLink = "Document No." = field("No.");
            }
        }
        area(factboxes)
        {

            part(WorkflowStatus; "Workflow Status FactBox")
            {
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            systempart(Control1900383207; Links)
            {
                Visible = true;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Approvals action.';

                    trigger OnAction()
                    var
                        ApprovalEntries: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalEntries.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                // action("Co&mments")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Co&mments';
                //     Image = ViewComments;
                //     RunObject = Page "Purch. Comment Sheet";
                //     RunPageLink = "Document Type" = field("Document Type"),
                //                                   "No." = field("No."),
                //                                   "Document Line No." = const(0);
                //     ToolTip = 'Executes the Co&mments action.';
                // }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    // Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send A&pproval Request action.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        // Rec.TestField(Description);
                        // Rec.TestField("Shortcut Dimension 1 Code");
                        // Rec.TestField("Shortcut Dimension 2 Code");
                        //TESTFIELD("Shortcut Dimension 3 Code");
                        VarVariant := Rec;
                        //  IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        //     CustomApprovals.OnSendDocForApproval(VarVariant);
                        // Plines.Reset();
                        // Plines.SetRange("Document Type", Rec."Document Type");
                        // Plines.SetRange("Document No.", Rec."No.");
                        // if Plines.FindSet() then begin
                        //     repeat
                        //         // Plines.TestField("VAT Prod. Posting Group");
                        //         Plines.TestField("Location Code");
                        //         Plines.TestField("Unit of Measure");
                        //         // Plines.TestField("VAT Bus. Posting Group");
                        //         Plines.TestField("Gen. Bus. Posting Group");
                        //         Plines.TestField("Gen. Prod. Posting Group");
                        //     until Plines.Next() = 0;
                        // end;

                        //BYPASS EMPTY VENDOR
                        if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then begin

                            IF REC."Buy-from Vendor No." = '' THEN
                                REC."Buy-from Vendor No." := 'VEND0001';
                        END;
                        IF REC."Buy-from Vendor No." = '' THEN
                            REC."Buy-from Vendor No." := 'VEND0001';
                        if rec.amount = 0 then
                            rec.amount := 1;
                        ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);

                    end;

                }
                
                action(Test)
                {
                    ApplicationArea = Basic;
                    Caption = 'Test';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send A&pproval Request action.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                        HRPortal : Codeunit HRPortal;
                    begin
                    
                        HRPortal.MealRequisitionApproval('M-REQ000041');

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
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                        VarVariant: Variant;
                        RecRef: RecordRef;
                        CustomApprovalEntry: Record "Approval Entry";
                        OldStatus: Option;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        TXT0002: label 'An approval request has been cancelled.';
                    begin
                        // VarVariant := Rec;
                        //CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        // if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
                        //cc//cc// ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                        //cc//cc// WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                        //Procurement.FnUncommitPRN(Rec);
                        //
                        CustomApprovalEntry.Reset;
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."No.");
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                        CustomApprovalEntry.SetFilter(CustomApprovalEntry.Status, '<>%1|<>%2', CustomApprovalEntry.Status::Canceled, CustomApprovalEntry.Status::Rejected);
                        if CustomApprovalEntry.FindSet then
                            repeat
                                //   OldStatus :=ApprovalEntry.Status;
                                CustomApprovalEntry.Status := CustomApprovalEntry.Status::Canceled;
                            //    CustomApprovalEntry.Modify(true);
                            Commit();
                            until CustomApprovalEntry.Next = 0;

                        //Notify The User
                        // EmailNotifications.FnSendCancelApprovalMailCustom(CustomApprovalEntry);
                        Rec.Status := Rec.Status::Open;
                        Rec."Cancelled?" := true;
                       // Rec.Modify(true);
                       Commit();
                        Message(TXT0002);
                    end;
                }
            }
            group(ActionGroup13)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                separator(Action73)
                {
                }
                action(Release)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Enabled = false;
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Executes the Re&lease action.';

                    trigger OnAction()
                    var
                    //  ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //    ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Enabled = false;
                    Image = ReOpen;
                    ToolTip = 'Executes the Re&open action.';

                    trigger OnAction()
                    var
                    //   ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        // ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                separator(Action611)
                {
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                Image = Approval;
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the &Print action.';

                    trigger OnAction()
                    begin
                        //  DocPrint.PrintPurchHeader(Rec);
                        rec.SETRANGE(rec."No.", rec."No.");
                        //70009
                        REPORT.RUN(50103, TRUE, TRUE, Rec);

                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        //CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        ShowWorkflowStatus := CurrPage.WorkflowStatus.Page.SetFilterOnWorkflowRecord(Rec.RecordId)
    end;

    trigger OnAfterGetRecord()
    begin
        JobQueueVisible := Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting";
        Rec."Document Type" := Rec."document type"::"Meals Requisition";
        SetControlAppearance;

    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord;
        exit(Rec.ConfirmDeletion);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter;
        Rec."Document Type" := Rec."document type"::"Meals Requisition";
    end;

    trigger OnOpenPage()
    begin
        if UserMgt.GetPurchasesFilter <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Responsibility Center", UserMgt.GetPurchasesFilter);
            Rec.FilterGroup(0);
        end;
        // SetControlAppearance;
        // Usersetup.GET(USERID);
        // IF Usersetup."Procurement officer"=FALSE THEN
        //  BEGIN
        //    SETFILTER("Requester ID",USERID);
        //    END;
        // Rec."Requester ID" := UserId;
        Rec.SetRange("Document Type", Rec."document type"::"Meals Requisition");
    end;

    var
        // ChangeExchangeRate: Page "Change Exchange Rate";
        CopyPurchDoc: Report "Copy Purchase Document";
        MoveNegPurchLines: Report "Move Negative Purchase Lines";
        UserMgt: Codeunit "User Setup Management";
       // [InDataSet]
        JobQueueVisible: Boolean;
        PurchSetupRec: Record "Purchases & Payables Setup";
        StoreReqHeader: Record "Purchase Header";
        StoreReqLine: Record "Purchase Line";
        RequisitionLine: Record "Purchase Line";
        Linenumber: Integer;
        Req: Record "Purchase Header";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        AvailableBudget: Decimal;
        Usersetup: Record "User Setup";
        ApprovalEntry: Record "Approval Entry";
        Plines: Record "Purchase Line";

    local procedure Post(PostingCodeunitID: Integer)
    begin
        Rec.SendToPosting(PostingCodeunitID);
        if Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting" then
            CurrPage.Close;
        CurrPage.Update(false);
    end;

    local procedure ApproveCalcInvDisc()
    begin
        //  CurrPage.PurchLines.Page.ApproveCalcInvDisc;
    end;

    // local procedure BuyfromVendorNoOnAfterValidate()
    // begin
    //     if Rec.GetFilter("Buy-from Vendor No.") = xRec."Buy-from Vendor No." then
    //         if Rec."Buy-from Vendor No." <> xRec."Buy-from Vendor No." then
    //             Rec.SetRange("Buy-from Vendor No.");
    //     CurrPage.Update;
    // end;

    // local procedure PurchaserCodeOnAfterValidate()
    // begin
    //     CurrPage.PurchLines.Page.Update(true);
    // end;

    // local procedure PaytoVendorNoOnAfterValidate()
    // begin
    //     CurrPage.Update;
    // end;

    // local procedure ShortcutDimension1CodeOnAfterV()
    // begin
    //     CurrPage.PurchLines.Page.Update(true);
    // end;

    // local procedure ShortcutDimension2CodeOnAfterV()
    // begin
    //     CurrPage.PurchLines.Page.Update(true);

    // end;

    // local procedure PricesIncludingVATOnAfterValid()
    // begin
    //     CurrPage.Update;
    // end;

    // local procedure CurrencyCodeOnAfterValidate()
    // begin
    //     CurrPage.PurchLines.Page.Update(true);
    // end;

    // local procedure Prepayment37OnAfterValidate()
    // begin
    //     CurrPage.Update;
    // end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        //HasIncomingDocument := "Incoming Document Entry No." <> 0;
        //SetExtDocNoMandatoryCondition;
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}




