#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72749 "Equipment Request For Service"
{
    Caption = 'Equipment Repair Tracking';
    PageType = Card;
    SourceTable = "Equipment Repair Tracking";
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
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Resident Engineer No."; Rec."Resident Engineer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resident Engineer No. field.';
                }
                field("Resident Engineer Name"; Rec."Resident Engineer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resident Engineer Name field.';
                }
                field("Resident Engineer Email"; Rec."Resident Engineer Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resident Engineer Email field.';
                }
                field("No. Of Equipment On Repair"; Rec."No. Of Equipment On Repair")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Equipment On Repair field.';
                }
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract ID field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
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
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Posted DateTime"; Rec."Posted DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted DateTime field.';
                }
            }
            part(Control18; "Request For Service Lines")
            {
                Caption = 'Equipment Repair Lines';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No");
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
                    Rec.TestField(Status, Rec.Status::Released);
                    Rec.TestField(Posted, false);

                    //Write your posting business logic here
                    EquipmentRepairLine.Reset;
                    EquipmentRepairLine.SetRange(EquipmentRepairLine."Document No.", Rec."Document No");
                    EquipmentRepairLine.SetRange(EquipmentRepairLine."Document Type", Rec."Document Type");
                    if EquipmentRepairLine.FindSet then
                        repeat
                            WEPContractorEquipment.Reset;
                            WEPContractorEquipment.SetRange(WEPContractorEquipment."Contractor No.", Rec."Contractor No");
                            WEPContractorEquipment.SetRange(WEPContractorEquipment."Equipment No.", EquipmentRepairLine."Equipment No.");
                            if WEPContractorEquipment.FindSet then
                                repeat
                                    WEPContractorEquipment."Equipment Condition Status" := WEPContractorEquipment."equipment condition status"::"Under Maintenance";
                                    WEPContractorEquipment.Modify(true);
                                until WEPContractorEquipment.Next = 0;
                        until EquipmentRepairLine.Next = 0;


                    Rec.Posted := true;
                    Rec."Posted By" := UserId;
                    Rec."Posted DateTime" := CurrentDatetime();
                    Rec.Modify(true);
                    Dialog.Message('Document %1 posted successfully', Rec."Document No");

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
                    //   ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
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
                    // ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
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
                    //  ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
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
                    //  ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
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
                    Rec.Status := Rec.Status::Released;
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
                    // DMSManagement.UploadStaffClaimDocuments(DocType."document type"::"Transport Requisition",Rec."Document No",'Testing',RecordId,'');
                    Rec.Modify();
                end;
            }
            action("Print Tracking Report")
            {
                ApplicationArea = Basic;
                Image = PrintDocument;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Print Tracking Report action.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No", Rec."Document No");
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

                    Rec."Portal Status" := Rec."portal status"::Submitted;
                    Rec.Modify();

                    Dialog.Message('Document %1 submitted successfully', Rec."Document No");

                    //Notify RE that a document has been send for their approval/Review
                    //ProcurementProcessing.
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Request For Service";
    end;

    var
        ProjectMobilizationHeader: Record "Project Mobilization Header";
        VendorProfessionalStaff: Record "Vendor Professional Staff";
        PurchaseHeader: Record "Purchase Header";
        WEPContractorTeam: Record "WEP Contractor Team";
        BidKeyStaff: Record "Bid Key Staff";
        WEPContractorEquipment: Record "WEP Contractor Equipment";
        BidEquipmentSpecification: Record "Bid Equipment Specification";
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        DMSManagement: Codeunit "DMS Management";
        DocType: Record "DMS Documents";
        EquipmentRepairLine: Record "Equipment Repair Line";
        ProcurementProcessing: Codeunit "Procurement Processing";
}

