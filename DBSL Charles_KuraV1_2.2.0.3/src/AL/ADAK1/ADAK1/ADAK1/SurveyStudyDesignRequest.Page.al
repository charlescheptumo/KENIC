#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72740 "Survey/Study/Design Request"
{
    PageType = Card;
    SourceTable = "Survey Request Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
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
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("Requestor No"; Rec."Requestor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requestor No field.';
                }
                field("Requestor Name"; Rec."Requestor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requestor Name field.';
                }
                field("Requestor Region"; Rec."Requestor Region")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requestor Region field.';
                }
                field("Directorate Name"; Rec."Directorate Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department ID field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
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
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
            }
            part(Control15; "Survey/Study/Design Req SubPag")
            {
                Caption = 'Survey/Study/Design Request  SubPage';
                SubPageLink = "Document No." = field("Document No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post action.';

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Approved);
                    Rec.TestField(Posted, false);

                    //Write your posting business logic here
                    /*EquipmentRepairLine.RESET;
                    EquipmentRepairLine.SETRANGE(EquipmentRepairLine."Document No.","Document No");
                    EquipmentRepairLine.SETRANGE(EquipmentRepairLine."Document Type","Document Type");
                    IF EquipmentRepairLine.FINDSET THEN
                      REPEAT
                        WEPContractorEquipment.RESET;
                        WEPContractorEquipment.SETRANGE(WEPContractorEquipment."Contractor No.","Contractor No");
                        WEPContractorEquipment.SETRANGE(WEPContractorEquipment."Equipment No.",EquipmentRepairLine."Equipment No.");
                        IF WEPContractorEquipment.FINDSET THEN
                        REPEAT
                          WEPContractorEquipment."Equipment Condition Status":=WEPContractorEquipment."Equipment Condition Status"::"Under Maintenance";
                          WEPContractorEquipment.MODIFY(TRUE);
                        UNTIL WEPContractorEquipment.NEXT=0;
                        UNTIL EquipmentRepairLine.NEXT=0;*/


                    // Posted:=TRUE;
                    // "Posted By":=USERID;
                    // "Posted DateTime":=CURRENTDATETIME();
                    // MODIFY(TRUE);
                    // DIALOG.MESSAGE('Document %1 posted successfully',"Document No");

                    //Notify Contractor That RE has Approved
                    //ProcurementProcessing.

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
                    // IF ApprovalsMgmt.CheckSubReqApprovalPossible(Rec) THEN
                    //  ApprovalsMgmt.OnSendSubReqForApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Cancel Approval Request action.';

                trigger OnAction()
                begin
                    //ApprovalsMgmt.OnCancelSubReqApprovalRequest(Rec);
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
                    //      ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action(Approve)
            {
                ApplicationArea = Basic;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Approve action.';

                trigger OnAction()
                begin
                    //  ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                end;
            }
            action(Reject)
            {
                ApplicationArea = Basic;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Reject action.';

                trigger OnAction()
                begin
                    //    ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                end;
            }
            action(Delegate)
            {
                ApplicationArea = Basic;
                Image = Delegate;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Delegate action.';

                trigger OnAction()
                begin
                    // ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Reopen action.';

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify();
                    Dialog.Message('Document Reopened successfully');
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Release action.';

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Approved;
                    Rec.Modify();
                    Dialog.Message('Document Released successfully');
                end;
            }
            action("Attach Docs")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Attach Docs action.';

                trigger OnAction()
                begin
                    DMSManagement.UploadStaffClaimDocuments(DocType."document type"::"Transport Requisition", Rec."Document No.", 'Testing', Rec.RecordId, '');
                    Rec.Modify();
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = PrintDocument;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Print action.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(72052, true, true, Rec);
                end;
            }
            action(Submit)
            {
                ApplicationArea = Basic;
                Caption = 'Submit';
                Image = Allocate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Submit action.';

                trigger OnAction()
                begin
                    //TESTFIELD(Status,Status::Released);
                    Rec.TestField(Posted, false);

                    Rec.Submitted := true;
                    Rec."Submitted By" := UserId;
                    Rec."Submmitted Date" := Today;
                    Rec."Submitted Time" := Time;
                    Rec.Modify(true);


                    SurveyRequestLine.Reset;
                    SurveyRequestLine.SetRange(SurveyRequestLine."Document No.", Rec."Document No.");
                    if SurveyRequestLine.FindSet then begin
                        SurveyRequestLine.TestField(SurveyRequestLine."Study/Survey/Design Type");
                        SurveyRequestLine.TestField(SurveyRequestLine."Project ID");
                    end;


                    //Notify RE that a document has been send for their approval/Review
                    ProcurementProcessing.FnNotifyPDEUserDirectorate(Rec);
                    Dialog.Message('Document %1 submitted successfully', Rec."Document No.");
                end;
            }
        }
    }

    trigger OnQueryClosePage(CloseAction: action): Boolean
    begin
        Rec.TestField(Submitted, true);
    end;

    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        DMSManagement: Codeunit "DMS Management";
        DocType: Record "DMS Documents";
        ProcurementProcessing: Codeunit "Procurement Processing";
        PurchaseHeader: Record "Purchase Header";
        SurveyRequestLine: Record "Survey Request Line";
}

