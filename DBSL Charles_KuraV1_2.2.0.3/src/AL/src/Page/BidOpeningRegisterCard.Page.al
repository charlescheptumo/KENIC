#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75262 "Bid Opening Register Card"
{
    PageType = Card;
    SourceTable = "Bid Opening Register";
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
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Region field.';
                }
                field("Bid Envelop Type"; Rec."Bid Envelop Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Envelop Type field.';
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Name field.';
                }
                field("Appointed Bid Opening Com"; Rec."Appointed Bid Opening Com")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tender Opening Committee Code';
                    Editable = true;
                    ToolTip = 'Specifies the value of the Tender Opening Committee Code field.';
                }
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Date field.';
                }
                field("Bid Opening Start Time"; Rec."Bid Opening Start Time")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Bid Opening Start Time field.';
                }
                field("Bid Opening End Date"; Rec."Bid Opening End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening End Date field.';
                }
                field("Bid Opening End Time"; Rec."Bid Opening End Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Bid Opening End Time field.';
                }
                field("Bid Opening Venue"; Rec."Bid Opening Venue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Venue field.';
                }
                field("Posted"; Rec."Posted")
                {
                    ApplicationArea = Basic;
                    //ToolTip = 'Specifies the value of the Bid Opening Venue field.';
                }
                field("Opening Person 1"; Rec."Opening Person 1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Person 1 field.';
                }
                field("Opening Person 2"; Rec."Opening Person 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Person 2 field.';
                }
                field("Opening Person 3"; Rec."Opening Person 3")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Person 3 field.';
                }
                field("Opening Person 4"; Rec."Opening Person 4")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Person 4 field.';
                }
                field("Opening Person 5"; Rec."Opening Person 5")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Person 5 field.';
                }
                field("Pre-bid Purchaser Code"; Rec."Pre-bid Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Lead Procurement Officer';
                    ToolTip = 'Specifies the value of the Lead Procurement Officer field.';
                }
                field("Tender Evaluation Deadline"; Rec."Tender Evaluation Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Evaluation Deadline field.';
                }
                field("No. of Intention To Bid Vendor"; Rec."No. of Intention To Bid Vendor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Intention To Bid Vendor field.';
                }
                field("No. of Submitted Bids"; Rec."No. of Submitted Bids")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Submitted Bids field.';
                }
                field("Total Engineer Estimates"; Rec."Total Engineer Estimates")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Engineer Estimates field.';
                }
                field("Required Bid Security Amount"; Rec."Required Bid Security Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Required Bid Security Amount (LCY) field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
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
            part(Control28; "Bid Opening Register Line")
            {
                SubPageLink = Code = field(Code);
            }
            group("Termination Details")
            {
                Caption = 'Termination Details';
                field("Tender Cancellation Reason"; Rec."Tender Cancellation Reason")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Cancellation Reason field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Terminated By"; Rec."Terminated By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Terminated By field.';
                }
                field("Date Terminated"; Rec."Date Terminated")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Terminated field.';
                }
                field(Time; Rec.Time)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Time field.';
                }

            }
        }
        area(factboxes)
        {
            // part("Attached Documents"; "Doc. Attachment List Factbox1")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Attachments';
            //     SubPageLink = "Table ID" = const(70173);
            // }

            part(Attachments; "Sharepoint File List")
            {
                ApplicationArea = Basic;
                SubPageLink = "No." = field("Code");
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup30)
            {
                action("Attendance Register")
                {
                    ApplicationArea = Basic;
                    Image = AllocatedCapacity;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bid Opening Bidder Attendance";
                    RunPageLink = Code = field(upperlimit(Code)),
                                  "IFS Code" = field("IFS Code");
                    ToolTip = 'Executes the Attendance Register action.';
                }
                action("Bid Opening Tender Committee")
                {
                    ApplicationArea = Basic;
                    Image = TeamSales;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bid Opening Tender Committee";
                    RunPageLink = "Document No." = field(Code);
                    ToolTip = 'Executes the Bid Opening Tender Committee action.';
                }
                action("Tender Opening Summary")
                {
                    ApplicationArea = Basic;
                    Image = WIPEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Tender Opening Summary Note";
                    RunPageLink = "Register ID" = field(Code);
                    ToolTip = 'Executes the Tender Opening Summary action.';
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print Opening Register';
                    Image = PrintAttachment;
                    Promoted = true;
                    PromotedCategory = "Report";
                    Visible = false;
                    ToolTip = 'Executes the Print Opening Register action.';

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(70040, true, true, Rec);
                    end;
                }
                action("Print Minutes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Print Minutes';
                    Image = PrintAttachment;
                    Promoted = true;
                    PromotedCategory = "Report";
                    ToolTip = 'Executes the Print Minutes action.';

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(70100, true, true, Rec);
                        FileDirectoryX := 'C:\SCM\Tender\';
                        // //D:\CUENAV_BACKUP\CUENAV_Documents\CUEL\Awaiting Completeness Card\ACC043
                        FileNameX := rec."IFS Code" + 'Opening.pdf';
                        // IF FILE.EXISTS(FileDirectoryX + FileNameX) THEN
                        //     FILE.ERASE(FileDirectoryX + FileNameX);//51217
                        //MERGE PDF
                        FileDirectory := 'C:\SCM\Tender\';
                        //D:\CUENAV_BACKUP\CUENAV_Documents\CUEL\Awaiting Completeness Card\ACC043
                        FileName := rec."IFS Code" + 'Opening.pdf';
                        // // Report.SaveAsPdf(70100, FileDirectory + FileName, Rec);
                    end;
                }
                action("Print Opening Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Print Opening Summary';
                    Image = PrintAttachment;
                    Promoted = true;
                    PromotedCategory = "Report";
                    ToolTip = 'Executes the Print Opening Summary action.';

                    trigger OnAction()
                    begin
                        // MergeFiles.fnCreateFolder("IFS Code");
                        REC.Reset;
                        rec.SetRange(Code, REC.Code);
                        Report.Run(70121, true, true, Rec);
                        FileDirectoryX := 'C:\SCM\Tender\' + rec."IFS Code" + '\';
                        //     // //D:\CUENAV_BACKUP\CUENAV_Documents\CUEL\Awaiting Completeness Card\ACC043
                        FileNameX := rec."IFS Code" + '_2_Opening.pdf';
                        // if FILE.Exists(FileDirectoryX + FileNameX) then
                        //     FILE.Erase(FileDirectoryX + FileNameX);//51217
                        //     //MERGE PDF
                        FileDirectory := 'C:\SCM\Tender\' + rec."IFS Code" + '\';
                        //     //D:\CUENAV_BACKUP\CUENAV_Documents\CUEL\Awaiting Completeness Card\ACC043
                        FileName := rec."IFS Code" + '_2_Opening.pdf';
                        // // Report.SaveAsPdf(70121, FileDirectory + FileName, Rec);
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Post action.';

                    trigger OnAction()
                    begin
                        Procurement.PostBidOpeningRegister(Rec)
                    end;
                }
                action(AttachDocuments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = true;
                    ToolTip = 'Executes the Attach Document action.';

                    trigger OnAction()
                    begin
                        //DMSManagement.UploadTenderopeningregisterDocuments(Code,'Tender Opening Register',RECORDID,"Primary Region");
                        DMSManagement.UploadStaffClaimDocuments(DMSDocuments."document type"::IFS, Rec.Code, 'Tender Opening', Rec.RecordId, 'R48');
                    end;
                }
                action("Unseal Bid")
                {
                    ApplicationArea = Basic;
                    Image = OpenWorksheet;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Unseal Bid action.';

                    trigger OnAction()
                    var
                        BidOpeningRegisterLine1: Record "Bid Opening Register Line";
                    begin
                        Procurement.UnsealBid(Rec, BidOpeningRegisterLine1);
                    end;
                }
                action("Send Bid Opening Codes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Bid Opening Codes';
                    Image = OpenJournal;
                    Promoted = true;
                    ToolTip = 'Executes the Send Bid Opening Codes action.';

                    trigger OnAction()
                    begin
                        Procurement.FnSendSecretCodeOnIFSBidOpening(Rec)
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
                        // ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                    end;
                }
                action("Initiate Tender Termination")
                {
                    ApplicationArea = Basic;
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Initiate Tender Termination action.';

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure to Terminate the Tender Process ?') = true then begin
                            Procurement.FnPostOpeningTermination(Rec);
                            Message('Process Initiated Successfully, Check on the generated Opinion');
                        end;
                    end;
                }
                action("Engineer Estimates")
                {
                    ApplicationArea = Basic;
                    Image = JobLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Engineer Estimates";
                    Visible = false;
                    RunPageLink = "Job No." = field("Job No");
                    ToolTip = 'Executes the Engineer Estimates action.';
                }
                action("Generate Evaluation Matrix")
                {
                    ApplicationArea = Basic;
                    Image = GetEntries;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Generate Evaluation Matrix action.';

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange("IFS Code", Rec."IFS Code");
                        Report.Run(70119, true, true, Rec);
                    end;
                }
                action("Import Attendance Register")
                {
                    ApplicationArea = Basic;
                    Caption = 'Import Attendance Register';
                    Image = Register;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Config. Package Card";
                    RunPageLink = Code = filter('OPENING');
                    Visible = true;
                    ToolTip = 'Executes the Import Attendance Register action.';

                    trigger OnAction()
                    begin
                        //DMSManagement.UploadTenderopeningregisterDocuments(Code,'Tender Opening Register',RECORDID,"Primary Region");
                        //DMSManagement.UploadStaffClaimDocuments(DMSDocuments."Document Type"::IFS,Rec.Code,'Tender Opening',RECORDID,'R48');
                    end;
                }
                action("Import Attendance Reg DataPort")
                {
                    ApplicationArea = Basic;
                    Caption = 'Import Attendance Register Uisng DataPort';
                    Image = Register;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Config. Package Card";
                    RunPageLink = Code = filter('OPENING');
                    ToolTip = 'Import Attendance Register Uisng DataPort';
                    Visible = true;

                    trigger OnAction()
                    begin
                        //DMSManagement.UploadTenderopeningregisterDocuments(Code,'Tender Opening Register',RECORDID,"Primary Region");
                        //DMSManagement.UploadStaffClaimDocuments(DMSDocuments."Document Type"::IFS,Rec.Code,'Tender Opening',RECORDID,'R48');
                    end;
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
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        // if ApprovalsMgmt.CheckBidOpeningApprovalPossible(Rec) then
                        //   ApprovalsMgmt.OnSendBidOpeningForApproval(Rec);

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
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //  WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        //  ApprovalsMgmt.OnCancelBidOpeningApprovalRequest(Rec);
                        //  WorkflowWebhookMgt.FindAndCancel(RecordId);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";
    begin
        DocType := DocType::IFS;
        CurrPage.Attachments.Page.Documenttype(DocType, Rec.Code);

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Technical;
        Rec."Document Type" := Rec."Document Type"::IFS;
    end;

    var
        Procurement: Codeunit "Procurement Processing";
        Text001: label 'Do you want to post?';
        //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowWorkflowStatus: Boolean;
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
        FileDirectoryX: Text;
        FileNameX: Text;
        FileName: Text;
        FileDirectory: Text;
        MergeFiles: Codeunit MergeCurriculum;
}

#pragma implicitwith restore

