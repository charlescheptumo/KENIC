page 99541 "Town Workplan Card"
{
    Caption = 'Town Workplan';
    PageType = Card;
    SourceTable = "RAM Workplan Header";
    DataCaptionFields = "Workplan Type", Description, "Region Name", "Shortcut Dimension 5 Code";
    PromotedActionCategories = 'New,Process,Report,Request Approval,Print,Post,Navigate,Generate Payment Certificate,Generate Invoice';
    PopulateAllFields = true;
    SourceTableView = WHERE("Workplan Type" = CONST(Town),
                            Consolidated = CONST(false));
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Workplan Type"; Rec."Workplan Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan Type field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Workplan Ref No"; Rec."Workplan Ref No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan Ref No field.';
                }
                field("Workplan No"; Rec."Workplan No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Workplan Number';
                    ToolTip = 'Specifies the value of the Workplan Number field.';
                }
                field("Consolidated Workplan No"; Rec."Consolidated Workplan No")
                {
                    ApplicationArea = Basic;
                    Visible = Rec.Consolidated = True;
                    ToolTip = 'Specifies the value of the Consolidated Workplan No field.';
                }
                field("Consolidate To"; Rec."Consolidate To")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Consolidate To field.';
                }

                field("Road Planner No"; Rec."Road Planner No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Planner No field.';
                }
                field("Road Planner Name"; Rec."Road Planner Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Planner Name field.';
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year Code field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';
                }
                field("Funding Source Type"; Rec."Funding Source Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source Type field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Name field.';
                }
                field("County Code"; Rec."County Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County Code field.';
                }
                field("Budget Ceiling Amount"; Rec."Budget Ceiling Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Ceiling Amount field.';
                }
                field("Total Workplan Amount"; Rec."Total Workplan Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Workplan Amount field.';
                }
                field("No of Projects"; Rec."No of Projects")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Projects field.';
                }

                field("No of Funding Sources"; Rec."No of Funding Sources")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Funding Sources field.';
                }
                field("Regional Director No"; Rec."Regional Director No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Regional Director No field.';
                }
                field("Regional Director Name"; Rec."Regional Director Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Regional Director Name field.';
                }


                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Status';
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Submission Status"; Rec."Submission Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submission Status field.';
                }
                field(Consolidated; Rec.Consolidated)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Consolidated field.';
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
            part("RAM Workplan Lines"; "Town WorkPlan Lines")
            {
                ApplicationArea = Basic;
                SubPageLink = "Document No" = FIELD("Document No"),
                              "Workplan Type" = FIELD("Workplan Type");
            }
            group("Assignment/Review")
            {
                field("Assign To"; Rec."Assign To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assign To field.';
                }
                field("Assignment Remarks"; Rec."Assignment Remarks")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Assignment Remarks field.';
                }
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
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist AND CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';
                    trigger OnAction()
                    var
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        //Rec.TestField("Submission Status",Rec."Submission Status"::Submitted);
                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant)
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = CanCancelApprovalForRecord OR CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                    end;
                }
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Approvals action.';

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
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
            action("Post to Region")
            {
                Image = Post;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post to Region action.';
                trigger OnAction()
                begin
                    Rec.TestField("Submission Status", Rec."Submission Status"::Submitted);
                    Rec.TestField(Status, Rec.Status::Approved);
                    RMSManagement.FnConsolidateTownRAMWorkplans(Rec);
                    //RMSManagement.FnConsolidateToEastRAMWorkplans(Rec);
                    //Add Workplan Consultancy Projects
                end;
            }
            action(Print)
            {
                Caption = 'APRP Summary';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the APRP Summary action.';

                trigger OnAction()
                begin
                    Rec.RESET;
                    Rec.SETRANGE("Document No", Rec."Document No");
                    REPORT.RUN(Report::"APRP Summary", TRUE, TRUE, Rec);
                end;
            }
            action("Print Summary")
            {
                Caption = 'Print Workplan Summary';
                Image = PrintAttachment;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Print Workplan Summary action.';

                trigger OnAction()
                begin
                    Rec.RESET;
                    Rec.SETRANGE("Document No", Rec."Document No");
                    REPORT.RUN(Report::"RAM Work Plan Summary", TRUE, TRUE, Rec);
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Workplan Type" := Rec."Workplan Type"::Town;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Workplan Type" := Rec."Workplan Type"::Town;
    end;

    var
        RMSManagement: Codeunit "RMS Management";
        ResponsibilityCenter: Record "Responsibility Center";
        RoadManagementSetup: Record "Road Management Setup";
        TXT0001: Label 'You cannot exceed your budget ceiling %1';
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;


    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        DocumentErrorsMgt: Codeunit "Document Errors Mgt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;

}
