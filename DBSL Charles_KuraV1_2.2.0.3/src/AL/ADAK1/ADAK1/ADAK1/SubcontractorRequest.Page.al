#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72598 "Subcontractor Request"
{
    PageType = Card;
    SourceTable = "Subcontracting Header";
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
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Project Code"; Rec."Project Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Contract ID field.';
                }
                field("Request Justification"; Rec."Request Justification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Justification field.';
                }
                field("Main Contractor No."; Rec."Main Contractor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Main Contractor No. field.';
                }
                field("Main Contractor Name"; Rec."Main Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Main Contractor Name field.';
                }
                field("Required Documents Template ID"; Rec."Required Documents Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Required Documents Template ID field.';
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
                    Editable = TRUE;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Reason For Rejection"; Rec."Reason For Rejection")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason For Rejection field.';
                }
                field("Date Subcontracted"; Rec."Date Subcontracted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Subcontracted field.';
                }
            }
            part(Control29; "Subcontracting Line Subpage")
            {
                Caption = 'Subcontracting Details';
                SubPageLink = "Document No" = field("Document No");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Subcontract(Post)")
            {
                ApplicationArea = Basic;
                Caption = 'Submit Request';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Submit Request action.';

                trigger OnAction()
                begin
                    //TESTFIELD("Tax PIN No.");
                    //TESTFIELD(Status,Status::Released);
                    Rec.TestField(Posted, false);
                    Vendor.Reset;
                    Vendor.SetRange(Vendor."VAT Registration No.", Rec."Tax PIN No.");
                    if not Vendor.FindSet then begin
                        Vendor.Init;
                        Vendor."No." := '';
                        Vendor."VAT Registration No." := Rec."Tax PIN No.";
                        Vendor.Name := Rec."Subcontractor Name";
                        Vendor."Vendor Posting Group" := 'CONTRACTORS';
                        Vendor.Insert(true);


                        ProjectVendors.Init;
                        ProjectVendors."Contract No" := Rec."Purchase Contract ID";
                        ProjectVendors."Vendor No" := Vendor."No.";
                        ProjectVendors."Vendor Name" := Rec."Subcontractor Name";
                        ProjectVendors."Vendor Type" := Rec.Type;
                        if not ProjectVendors.Insert(true) then
                            ProjectVendors.Modify(true);
                    end;
                    if Vendor.FindSet then begin
                        Vendor.Name := Rec."Subcontractor Name";

                        Vendor.Modify(true);
                    end;

                    //Check if all the subcontractors have a PIN
                    SubcontractingLine.Reset;
                    SubcontractingLine.SetRange(SubcontractingLine."Document No", Rec."Document No");
                    if SubcontractingLine.FindSet then
                        repeat
                            SubcontractingLine.TestField("Tax PIN No.");
                        until SubcontractingLine.Next = 0;

                    // Posted:=TRUE;
                    // "Posted By":=USERID;
                    // "Posted Date Time":=CREATEDATETIME(TODAY,TIME);
                    // MODIFY(TRUE);


                    Message('Request %1 Submitted Successfully', Rec."Document No");
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
                    //    if ApprovalsMgmt.CheckSubReqApprovalPossible(Rec) then
                    //       ApprovalsMgmt.OnSendSubReqForApproval(Rec);
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
                    //   ApprovalsMgmt.OnCancelSubReqApprovalRequest(Rec);
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
                    //     ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
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
                    //   ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
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
                    DMSManagement.UploadStaffClaimDocuments(DocType."document type"::"Transport Requisition", Rec."Document No", 'Testing', Rec.RecordId, '');
                    Rec.Modify();
                end;
            }
            action("Required Documents")
            {
                ApplicationArea = Basic;
                Image = CheckList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Subcontracting Required Docs";
                RunPageLink = "Document No." = field("Document No");
                ToolTip = 'Executes the Required Documents action.';
            }
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
                    ///TESTFIELD("Tax PIN No.");
                    Rec.TestField(Status, Rec.Status::Released);
                    Rec.TestField(Posted, false);

                    SubcontractingLine.Reset;
                    SubcontractingLine.SetRange(SubcontractingLine."Document No", Rec."Document No");
                    if SubcontractingLine.FindSet then begin
                        repeat
                            //    MESSAGE(SubcontractingLine."Subcontractor Name");
                            ObjVendor.Reset;
                            ObjVendor.SetRange(ObjVendor."VAT Registration No.", SubcontractingLine."Tax PIN No.");
                            if not ObjVendor.Find('-') then begin
                                ObjVendor.Init;
                                ObjVendor."No." := '';
                                ObjVendor."VAT Registration No." := SubcontractingLine."Tax PIN No.";
                                ObjVendor.Name := SubcontractingLine."Subcontractor Name";
                                Message(SubcontractingLine."Subcontractor Name");
                                ObjVendor."Vendor Posting Group" := 'CONTRACTORS';
                                if not ObjVendor.Get(ObjVendor."No.") then
                                    ObjVendor.Insert(true);


                                ProjectVendors.Init;
                                ProjectVendors."Contract No" := Rec."Purchase Contract ID";
                                ProjectVendors."Vendor No" := ObjVendor."No.";
                                ProjectVendors."Vendor Name" := SubcontractingLine."Subcontractor Name";
                                ProjectVendors."Vendor Type" := SubcontractingLine.Type;
                                if not ProjectVendors.Get(Rec."Purchase Contract ID", ObjVendor."No.") then
                                    ProjectVendors.Insert(true);
                            end;

                        until SubcontractingLine.Next = 0;
                    end;


                    //Check if all the subcontractors have a PIN
                    SubcontractingLine.Reset;
                    SubcontractingLine.SetRange(SubcontractingLine."Document No", Rec."Document No");
                    if SubcontractingLine.FindSet then
                        repeat
                            SubcontractingLine.TestField("Tax PIN No.");
                        until SubcontractingLine.Next = 0;

                    //Update Job
                    Job.Reset;
                    Job.SetRange(Job."No.", Rec."Project Code");
                    if Job.FindSet then begin
                        Job."Last Variation Request No." := Rec."Variation Order No";
                        Job.Modify(true);
                    end;

                    Rec.Posted := true;
                    Rec."Posted By" := UserId;
                    Rec."Posted Date Time" := CreateDatetime(Today, Time);
                    Rec.Modify(true);
                    Message('Request %1 posted Successfully', Rec."Document No");
                end;
            }
            action("Suggest Required Documents")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Required Documents action.';

                trigger OnAction()
                begin
                    //    RMSManagement.FnSuggestSubContractorRequiredDocuments(Rec);
                    Message('Required documents suggested successfully');
                end;
            }
            action("Genarate Evaluation Report")
            {
                ApplicationArea = Basic;
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Genarate Evaluation Report action.';

                trigger OnAction()
                begin
                    //  RMSManagement.FnPostSubcontractingHeader(Rec);
                end;
            }
        }
    }

    var
        DMSManagement: Codeunit "DMS Management";
        DocType: Record "DMS Documents";
        Vendor: Record Vendor;
        ProjectVendors: Record "Project Vendors";
        SubcontractingLine: Record "Subcontracting Line";
        ObjVendor: Record Vendor;
        RMSManagement: Codeunit "RMS Management";
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Job: Record Job;
}

