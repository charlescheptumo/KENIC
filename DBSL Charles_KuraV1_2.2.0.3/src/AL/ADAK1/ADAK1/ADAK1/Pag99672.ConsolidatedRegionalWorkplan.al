page 99672 "Consolidated Regional Workplan"
{
    Caption = 'Consolidated Regional Workplan';
    PageType = Card;
    SourceTable = "RAM Workplan Header";
    PromotedActionCategories = 'New,Process,Report,Request Approval,Notify,Post,Recall,Schedule,Generate Invoice';
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

            part("RAM Workplan Lines"; "RAM Workplan Lines")
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
        area(navigation)
        {
            action("Suggest Bil Items From Template")
            {
                Caption = 'Generate Project BoQ';
                Image = SuggestCustomerBill;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;
                ToolTip = 'Executes the Generate Project BoQ action.';

                trigger OnAction()
                begin
                    RMSManagement.FnUpdateBoQDetailsOnRAMWorkplan(Rec);
                    RMSManagement.FnCreateRWPlanSummaryOfBillsFromBOQTemplate(Rec);
                    RMSManagement.FnCreateRWPPlanBillItemLinesFromBOQTemplates(Rec);
                    MESSAGE('Bill Items inserted successfully');
                end;
            }
            action(Release)
            {
                Caption = 'Approve';
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = False;
                ToolTip = 'Executes the Approve action.';
                trigger OnAction()
                begin
                    MESSAGE('Workplan Ref No %1 has been approved', Rec."Workplan Ref No");
                    Rec.Status := Rec.Status::Approved;
                    Rec.MODIFY;
                end;
            }

            action("Submit to Regional WorkPlan")
            {
                Caption = 'Submit to HQ';
                Image = SendMail;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = False;
                ToolTip = 'Executes the Submit to HQ action.';

                trigger OnAction()
                begin
                    RMSManagement.FnSubmitRegionalWorkplanToHQ(Rec);
                    ResponsibilityCenter.RESET;
                    ResponsibilityCenter.SETRANGE(ResponsibilityCenter.Code, Rec."Responsibility Center");
                    IF ResponsibilityCenter.FINDSET THEN
                        ResponsibilityCenter."No of RAM Workplans" := Rec."Workplan No";
                    Rec."Submission Status" := Rec."Submission Status"::Submitted;
                    Rec.MODIFY(TRUE);
                    MESSAGE('Regional Workplan for %1 Submitted Successfully to Region', Rec."Financial Year Code");

                    RoadManagementSetup.GET;
                    RoadManagementSetup.TESTFIELD("Workplan Recall Expiry Period");
                    Rec."Recall Expiry Date" := CALCDATE(RoadManagementSetup."Workplan Recall Expiry Period", TODAY);
                    MESSAGE('Workplan No: %1 has been submitted successfully,Please note you have a period of upto %2 to recall the workplan for any ammendments', Rec."Workplan Ref No", Rec."Recall Expiry Date");
                end;
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Visible = False;
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
                Visible = False;
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
            action("Post to Consolidated")
            {
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = False;
                ToolTip = 'Executes the Post to Consolidated action.';
                trigger OnAction()
                begin
                    RMSManagement.FnConsolidateRAMWorkplans(Rec);
                    //RMSManagement.FnConsolidateToEastRAMWorkplans(Rec);
                    //Add Workplan Consultancy Projects
                end;
            }
            action("Post to Consolidated West")
            {
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = False;
                ToolTip = 'Executes the Post to Consolidated West action.';
                //Rec."Consolidate To" = Rec."Consolidate To"::West;                ToolTip = 'Executes the Post to Consolidated West action.';


                trigger OnAction()
                begin
                    //RMSManagement.FnConsolidateRAMWorkplans(Rec);
                    //RMSManagement.FnConsolidateToEastRAMWorkplans(Rec);
                    RMSManagement.FnConsolidateToWestRAMWorkplans(Rec);
                    //Add Workplan Consultancy Projects
                end;
            }
            action(Print)
            {
                Caption = 'Print Detailed Workplan';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Print Detailed Workplan action.';

                trigger OnAction()
                begin
                    Rec.RESET;
                    Rec.SETRANGE("Document No", Rec."Document No");
                    REPORT.RUN(72059, TRUE, TRUE, Rec);
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
                    REPORT.RUN(72014, TRUE, TRUE, Rec);
                end;
            }
            action("Assign To Notification")
            {
                Caption = 'Send Assign To Notification';
                Image = SendElectronicDocument;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Send Assign To Notification action.';

                trigger OnAction()
                begin
                    RMSManagement.FnSendAssignToNotificationOnRAWWorkplans(Rec);
                end;
            }
            action("Schedule To Budget")
            {
                Caption = 'Schedule';
                Image = CopyGLtoCostBudget;
                Promoted = true;
                PromotedCategory = Category8;
                PromotedIsBig = true;
                ToolTip = 'Executes the Schedule action.';
                trigger OnAction()
                begin
                    RMSManagement.ScheduleProjects(Rec."Financial Year Code");
                end;
            }

            action("Recall Workplan")
            {
                Enabled = Rec.Consolidated = FALSE;
                Image = CancelAllLines;
                Promoted = true;
                PromotedCategory = Category7;
                PromotedIsBig = true;
                Visible = Rec."Submission Status" = Rec."Submission Status"::Submitted;
                ToolTip = 'Executes the Recall Workplan action.';

                trigger OnAction()
                begin
                    IF Rec."Recall Expiry Date" > TODAY THEN BEGIN
                        ERROR('The Workplan Recall Perion has lapsed. You arae not allowed to recall the workplan past %1', Rec."Recall Expiry Date");
                    END
                    ELSE BEGIN
                        ResponsibilityCenter.RESET;
                        ResponsibilityCenter.SETRANGE(ResponsibilityCenter.Code, Rec."Responsibility Center");
                        IF ResponsibilityCenter.FINDSET THEN BEGIN
                            ResponsibilityCenter."No of RAM Workplans" := Rec."Workplan No" - 1;
                        END;
                        Rec."Submission Status" := Rec."Submission Status"::Draft;
                        Rec.MODIFY(TRUE);
                    END;
                    MESSAGE('Workplan No: %1 has been recalled successfully', Rec."Workplan Ref No");
                end;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Workplan Type" := Rec."Workplan Type"::Regional;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Workplan Type" := Rec."Workplan Type"::Consolidated;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
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
        if Rec.Status <> Rec.status::Open then
            CurrPage.Editable(false);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;
}



