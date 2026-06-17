#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75392 "IFS Tender Summary Card"
{
    PageType = Card;
    SourceTable = "Bid Tabulation Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Raised By"; Rec."Raised By")
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Lead';
                    ToolTip = 'Specifies the value of the Evaluation Lead field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Lead Name';
                    ToolTip = 'Specifies the value of the Evaluation Lead Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Designation/Title"; Rec."Designation/Title")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Designation/Title field.';
                }
                field("Tender Committee Role"; Rec."Tender Committee Role")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Committee Role field.';
                }
                field("Final Evaluation Report ID"; Rec."Final Evaluation Report ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Evaluation Report ID field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Name field.';
                }
                group("Awarded Winner")
                {
                    Caption = 'Awarded Winner';
                    field("Awarded Bid No"; Rec."Awarded Bid No")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Awarded Bid No field.';
                    }
                    field("Awarded Bidder No."; Rec."Awarded Bidder No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Awarded Bidder No. field.';
                    }
                    field("Awarded Bidder Name"; Rec."Awarded Bidder Name")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Awarded Bidder Name field.';
                    }
                    field("Award Tender Sum Inc Taxes"; Rec."Award Tender Sum Inc Taxes")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Award Tender Sum Inc Taxes field.';
                    }
                    field("Award Acceptance Deadline"; Rec."Award Acceptance Deadline")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Award Acceptance Deadline Duration field.';
                    }
                    field("Award Acceptance Response"; Rec."Award Acceptance Response")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Award Acceptance Response Deadline field.';
                    }
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Region field.';
                }
                group("Key Statistics")
                {
                    Caption = 'Key Statistics';
                    field("No of submitted bids"; Rec."No of submitted bids")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the No of submitted bids field.';
                    }
                    field("No of Opened Bids(Tech)"; Rec."No of Opened Bids(Tech)")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the No of Opened Bids(Tech) field.';
                    }
                    field("No of Opened Bids(Finance)"; Rec."No of Opened Bids(Finance)")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the No of Opened Bids(Finance) field.';
                    }
                    field("No of Responsive(Tech)"; Rec."No of Responsive(Tech)")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the No of Responsive(Tech) field.';
                    }
                    field("No of non- Responsive(Tech)"; Rec."No of non- Responsive(Tech)")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the No of non- Responsive(Tech) field.';
                    }
                    field("No of Responsive(Finance)"; Rec."No of Responsive(Finance)")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the No of Responsive(Finance) field.';
                    }
                    field("No of non- Responsive(Finance)"; Rec."No of non- Responsive(Finance)")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the No of non- Responsive(Finance) field.';
                    }
                }
                field("<General Procurement Remarks>"; ObjText)
                {
                    ApplicationArea = Basic;
                    Caption = 'Proffessional Opinion Remarks';
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Standard;
                    MultiLine = true;
                    ShowMandatory = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Proffessional Opinion Remarks field.';

                    trigger OnValidate()
                    begin
                        /*CALCFIELDS("General Procurement Remarks");
                        "General Procurement Remarks".CREATEINSTREAM(ObjInstr);
                        Obj.READ(ObjInstr);
                        
                        IF ObjText<>FORMAT(Obj) THEN
                        BEGIN
                         CLEAR("General Procurement Remarks");
                         CLEAR(Obj);
                         Obj.ADDTEXT(ObjText);
                         "General Procurement Remarks".CREATEOUTSTREAM(ObjOutStr);
                         Obj.WRITE(ObjOutStr);
                         //MODIFY;
                        END;*/

                    end;
                }
                field("General Procurement Remarks"; Rec."General Procurement Remarks")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proffessional Opinion Remarks';
                    Editable = noa;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Proffessional Opinion Remarks field.';

                    trigger OnValidate()
                    begin
                        /*CALCFIELDS("General Procurement Remarks");
                        "General Procurement Remarks".CREATEINSTREAM(ObjInstr);
                        Obj.READ(ObjInstr);
                        
                        IF ObjText<>FORMAT(Obj) THEN
                        BEGIN
                         CLEAR("General Procurement Remarks");
                         CLEAR(Obj);
                         Obj.ADDTEXT(ObjText);
                         "General Procurement Remarks".CREATEOUTSTREAM(ObjOutStr);
                         Obj.WRITE(ObjOutStr);
                         //MODIFY;
                        END;*/

                    end;
                }
                field("Reason for Rejection"; Rec."Reason for Rejection")
                {
                    ApplicationArea = Basic;
                    Editable = NOA1;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Reason for Rejection field.';
                }
                field("Tender Cancellation Reason"; Rec."Tender Cancellation Reason")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Cancellation Reason field.';
                }
                field("Reason for Tender Termination"; Rec."Reason for Tender Termination")
                {
                    ApplicationArea = Basic;
                    Caption = 'Termination Remarks';
                    Editable = NOA1;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Termination Remarks field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
            }
            part(Control20; "Proffesion Opinion Lines")
            {
                Editable = noa;
                SubPageLink = "Tabulation ID" = field(Code);
            }
            group("Procurement Plan Details")
            {
                Caption = 'Procurement Plan Details';
                Editable = false;
                field("Annual Procurement Plan ID"; Rec."Annual Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Procurement Plan ID field.';
                }
                field("Procurement Plan Date"; Rec."Procurement Plan Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Plan Date field.';
                }
                field("Procurement Plan Entry No"; Rec."Procurement Plan Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Plan Entry No field.';
                }
                field("Available Procurement Budget"; Rec."Available Procurement Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Available Procurement Budget field.';
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Method field.';
                }
            }
            group("Sourcing History")
            {
                Caption = 'Sourcing History';
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Date field.';
                }
                field("Evaluation Completion Date"; Rec."Evaluation Completion Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Completion Date field.';
                }
                field("Appointed Bid Opening Comm"; Rec."Appointed Bid Opening Comm")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointed Bid Opening Comm field.';
                }
                field("Appointed Bid Evaluation Com"; Rec."Appointed Bid Evaluation Com")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointed Bid Evaluation Com field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control67; Notes)
            {
            }
            systempart(Control77; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(IFP)
            {
                Caption = 'IFP';
                Image = "Order";
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Enabled = Rec."code" <> '';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        //ShowDocDim;
                        //CurrPage.SAVERECORD;
                    end;
                }
                action(Approvals)
                {
                    AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    var
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                    begin
                        //  ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "No." = field(Code);
                    ToolTip = 'View or add comments for the record.';
                }
                action(AttachDocument)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Attach Document action.';

                    trigger OnAction()
                    begin
                        // DMSManagement.UploadOpinionDocuments(DMSDocuments."document type"::IF Code, 'Professional Opinion', RecordId, d,"Primary Region");
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                    Visible = false;

                    // trigger OnAction()
                    // var
                    //     DocumentAttachmentDetails: Page "Document Attachment Details";
                    //     RecRef: RecordRef;
                    // begin
                    //     RecRef.GetTable(Rec);
                    //     DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    //     DocumentAttachmentDetails.RunModal;
                    // end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Caption = 'Professional Opinion';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    ToolTip = 'Executes the Professional Opinion action.';

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(70055, true, true, Rec);
                    end;
                }
                action("Print Opinion")
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;
                    Promoted = false;
                    ToolTip = 'Executes the Print Opinion action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(70099, true, true, Rec);
                    end;
                }
            }
        }
        area(processing)
        {
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //   ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group(ActionGroup30)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        //ReleasePurchDoc.ReleaseVendDebarment(Rec);
                        //Procurement.ReleaseSupplierRatingTemplate(Rec)
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        //ReleasePurchDoc.ReopenVendDebarment(Rec);
                        /*IF Released=FALSE THEN
                          ERROR('Document must be Released');
                        Released:=FALSE;
                        MODIFY;
                        MESSAGE('Supplier Rating Template %1 has been opened successfuly',Code);*/

                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                Visible = false;
                action("Suggest Final Evaluation Reports")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Final Evaluation Reports';
                    Ellipsis = true;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.SuggestProffesionOpinion(Rec);
                    end;
                }
                action("Proceed To Notice Of Award")
                {
                    ApplicationArea = Suite;
                    Caption = 'Proceed To Notice Of Award';
                    Ellipsis = true;
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';
                    Visible = corec;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to Proceed To Notice Of Award?') = true then begin
                            Procurement.PostProffesionOpinion(Rec);
                        end;
                    end;
                }
                action("Generate ICM")
                {
                    ApplicationArea = Suite;
                    Caption = 'Generate ICM';
                    Ellipsis = true;
                    Image = SendToMultiple;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';
                    Visible = corec;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to Generate ICM ?') = true then begin
                            Procurement.FnGenerateICM(Rec);
                        end;
                    end;
                }
                action("Approve Opinion")
                {
                    ApplicationArea = Basic;
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = NOA1;
                    ToolTip = 'Executes the Approve Opinion action.';

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to Approve ?') = true then begin
                            Rec.TestField("Document Status", Rec."document status"::Submitted);
                            Rec.TestField("Termination Request", false);
                            Rec."Document Status" := Rec."document status"::Approved;
                            Message('Opinion Approved');
                        end;
                    end;
                }
                action("Reject Opinion")
                {
                    ApplicationArea = Basic;
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = NOA1;
                    ToolTip = 'Executes the Reject Opinion action.';

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to Reject ?') = true then begin
                            Rec.TestField("Document Status", Rec."document status"::Submitted);
                            Rec.TestField("Termination Request", false);
                            Rec.TestField("Reason for Rejection");
                            Rec."Document Status" := Rec."document status"::Active;
                            Message('Opinion Rejected');
                        end;
                    end;
                }
                action("Terminate Tender")
                {
                    ApplicationArea = Basic;
                    Image = TerminationDescription;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = NOA1;
                    ToolTip = 'Executes the Terminate Tender action.';

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to Terminate the Tender Process ?') = true then begin
                            Rec.TestField("Termination Request", true);
                            Rec.TestField("Document Status", Rec."document status"::Submitted);
                            Rec.TestField("Tender Cancellation Reason");
                            Rec."Document Status" := Rec."document status"::Terminated;
                            Procurement.FnUncommitPRNOnTermination(Rec);
                            Rec.Modify(true);
                            Message('Tender Terminated');
                        end;
                    end;
                }
                action("View Evaluation Report")
                {
                    ApplicationArea = Basic;
                    Image = ViewOrder;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = Page "Final Evaluation Report Card2";
                    RunPageLink = Code = field("Final Evaluation Report ID");
                    ToolTip = 'Executes the View Evaluation Report action.';
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Visible = false;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //   if ApprovalsMgmt.CheckBidTabulationApprovalPossible(Rec) then
                        //      ApprovalsMgmt.OnSendBidTabulationForApproval(Rec);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //   WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        //  ApprovalsMgmt.OnCancelBidTabulationApprovalRequest(Rec);
                        // WorkflowWebhookMgt.FindAndCancel(RecordId);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        noa := false;
        if Rec."Document Status" = Rec."document status"::Active then begin
            noa := true
        end;
        NOA1 := false;
        if Rec."Document Status" = Rec."document status"::Submitted then begin
            NOA1 := true
        end;
        corec := false;
        if Rec."Document Status" = Rec."document status"::Approved then begin
            corec := true
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        noa := false;
        if Rec."Document Status" = Rec."document status"::Active then begin
            noa := true
        end;
        NOA1 := false;
        if Rec."Document Status" = Rec."document status"::Submitted then begin
            NOA1 := true
        end;
        corec := false;
        if Rec."Document Status" = Rec."document status"::Approved then begin
            corec := true
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Professional Opinion";
        Rec."Process Type" := Rec."process type"::IFS;
    end;

    trigger OnOpenPage()
    begin
        noa := false;
        if Rec."Document Status" = Rec."document status"::Active then begin
            noa := true
        end;
        NOA1 := false;
        if Rec."Document Status" = Rec."document status"::Submitted then begin
            NOA1 := true
        end;
        corec := false;
        if Rec."Document Status" = Rec."document status"::Approved then begin
            corec := true
        end;
    end;

    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowWorkflowStatus: Boolean;
        Procurement: Codeunit "Procurement Processing";
        noa: Boolean;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        corec: Boolean;
        NOA1: Boolean;
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
}

