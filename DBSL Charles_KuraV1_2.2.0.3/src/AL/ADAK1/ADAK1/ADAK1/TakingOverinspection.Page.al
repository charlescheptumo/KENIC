#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
/// <summary>
/// Page Taking Over inspection (ID 72570).
/// </summary>
Page 72570 "Taking Over inspection"
{
    PageType = Card;
    SourceTable = "Inspection Headersss";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Inspection No"; Rec."Inspection No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection No field.';
                }
                field("Inspection Type"; Rec."Inspection Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Type field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract ID field.';
                }
                field("Final Taking Over Inspection?"; Rec."Final Taking Over Inspection?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Taking Over Inspection? field.';
                }
                field("Contractor Request No"; Rec."Contractor Request No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Request No field.';
                }
                field("Inspection Date"; Rec."Inspection Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Date field.';
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
                field("Committee No"; Rec."Committee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee No field.';
                }
                field("Project Supervision Template"; Rec."Project Supervision Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Supervision Template field.';
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Start Date field.';
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project End Date field.';
                }
                field("Revised End Date"; Rec."Revised End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revised End Date field.';
                }
                field("DLP Start Date"; Rec."DLP Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DLP Start Date field.';
                }
                field("DLP Period"; Rec."DLP Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DLP Period field.';
                }
                field("DLP End Date"; Rec."DLP End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DLP End Date field.';
                }
                field("Maintenance Period"; Rec."Maintenance Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintenance Period field.';
                }
                field("Awarded Tender Sum Inc Tax"; Rec."Awarded Tender Sum Inc Tax")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Awarded Tender Sum Inc Tax field.';
                }
                field("Payments To Date"; Rec."Payments To Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payments To Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
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
                field("Taking Over Certificate No."; Rec."Taking Over Certificate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taking Over Certificate No. field.';
                }
                field("Clause No."; Rec."Clause No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Clause No. field.';
                }
                field("Clause Description"; Rec."Clause Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Clause Description field.';
                }
            }
            part(Control40; "Project Inspection Line Subpag")
            {
                SubPageLink = "Inspection No" = field("Inspection No"),
                              "Inspection Type" = field("Inspection Type");
            }
            group("Project Details")
            {
                Caption = 'Project Details';
                Editable = false;
                field("Works Start Chainage"; Rec."Works Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works Start Chainage field.';
                }
                field("Works End Chainage"; Rec."Works End Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works End Chainage field.';
                }
                field("Primary Contractor Rep."; Rec."Primary Contractor Rep.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Contractor Rep. field.';
                }
                field("Contractor Representative Role"; Rec."Contractor Representative Role")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Representative Role field.';
                }
                field("Contractor Rep. Email"; Rec."Contractor Rep. Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Rep. Email field.';
                }
                field("Work Execution Plan 1D"; Rec."Work Execution Plan 1D")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Execution Plan 1D field.';
                }
                field("Commencement Order No"; Rec."Commencement Order No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commencement Order No field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Project Manager/Engineer"; Rec."Project Manager/Engineer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Manager/Engineer field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department ID field.';
                }
                field("Funding Agency No."; Rec."Funding Agency No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Agency No. field.';
                }
            }
            group("Overall Committee Decision")
            {
                Caption = 'Overall Committee Decision';
                field("Committee Decision"; Rec."Committee Decision")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee Decision field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Inspection Recommendations")
            {
                ApplicationArea = Basic;
                Caption = 'Inspection Committee Recommendations';
                Image = LedgerEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Committee Recommendations";
                RunPageLink = "Inpection Type" = field("Inspection Type"),
                              "Inspection No" = field("Inspection No");
                ToolTip = 'Executes the Inspection Committee Recommendations action.';
            }
            action("Committee Members")
            {
                ApplicationArea = Basic;
                Image = Register;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "IFS Tender Committee Member";
                RunPageLink = "Document No." = field("Committee No");
                ToolTip = 'Executes the Committee Members action.';
            }
            action("Inspection Snag List")
            {
                ApplicationArea = Basic;
                Image = AdjustEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Inspection Snag List";
                RunPageLink = "Inspection No" = field("Inspection No"),
                              "Inspection Type" = field("Inspection Type");
                ToolTip = 'Executes the Inspection Snag List action.';
            }
            action("Sections Taken Over")
            {
                ApplicationArea = Basic;
                Image = SKU;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Taking Over Sections";
                RunPageLink = "Inspection No" = field("Inspection No"),
                              "Document Type" = field("Inspection Type");
                ToolTip = 'Executes the Sections Taken Over action.';
            }
            action("Circulation Team")
            {
                ApplicationArea = Basic;
                Image = SignUp;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Contract Circulation Team";
                RunPageLink = "Document Type" = const("Taking Over Inspection"),
                              No = field("Inspection No");
                ToolTip = 'Executes the Circulation Team action.';
            }
            action("Taking Over Certificate")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Taking Over Certificate action.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Inspection Type", Rec."Inspection Type");
                    Rec.SetRange("Inspection No", Rec."Inspection No");
                    if Rec.FindSet then begin
                        Report.Run(72054, true, false, Rec);
                    end;
                end;
            }
            action("Attach Docs")
            {
                ApplicationArea = Basic;
                Caption = 'Attach Meeting Minutes';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Attach Meeting Minutes action.';

                trigger OnAction()
                begin
                    DMSManagement.UploadStaffClaimDocuments(DocType."document type"::"Transport Requisition", Rec."Inspection No", 'Testing', Rec.RecordId, '');
                    //Attached:=TRUE;
                    Rec.Modify();
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
                    // if ApprovalsMgmt.CheckIHReqApprovalPossible(Rec) then
                    //   ApprovalsMgmt.OnSendIHReqForApproval(Rec);
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
                    //  ApprovalsMgmt.OnCancelIHReqApprovalRequest(Rec);
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
                    //    ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
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

                    ProjectVendors.Reset;
                    ProjectVendors.SetRange(ProjectVendors."Contract No", Rec."Contract ID");
                    if ProjectVendors.FindSet then begin
                        TakingOverSection.Reset;
                        TakingOverSection.SetRange(TakingOverSection."Inspection No", Rec."Inspection No");
                        if TakingOverSection.FindSet then
                            repeat
                                if ((TakingOverSection."Start Chainage" >= ProjectVendors."Start Chainage(KM)") and (TakingOverSection."End Chainage" <= ProjectVendors."End Chainage(KM)")) then begin

                                    if Rec."Committee Decision" = Rec."committee decision"::Accept then begin
                                        ProcurementProcessing.FnNotifyContractorTakingOverInspectionAccept(Rec);
                                        ObjJob.Reset;
                                        ObjJob.SetRange(ObjJob."No.", Rec."Project ID");
                                        if ObjJob.FindSet then begin
                                            ObjJob.Status := ObjJob.Status::Completed;
                                            ObjJob.Modify(true);
                                        end;
                                    end;
                                    if Rec."Committee Decision" = Rec."committee decision"::Reject then begin
                                        ProcurementProcessing.FnNotifyContractorTakingOverInspectionReject(Rec);
                                    end;
                                end;
                            until ProjectVendors.Next = 0;
                    end;
                    Rec.Posted := true;
                    Rec.Modify(true);
                    Message('Posted successfully.');
                end;
            }
            action("Reject Document")
            {
                ApplicationArea = Basic;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Reject Document action.';

                trigger OnAction()
                begin
                    Rec.TestField("Rejection Remarks");
                    Rec.Rejected := true;
                    Rec."Rejected By" := UserId;
                    Rec.Modify();
                    Message('Document Rejected.');
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Inspection Type" := Rec."inspection type"::"Taking Over Inspection";
    end;

    var
        DMSManagement: Codeunit "DMS Management";
        DocType: Record "DMS Documents";
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        ProcurementProcessing: Codeunit "Procurement Processing";
        ProjectVendors: Record "Project Vendors";
        TakingOverSection: Record "Taking Over Section";
        ObjJob: Record Job;
}

