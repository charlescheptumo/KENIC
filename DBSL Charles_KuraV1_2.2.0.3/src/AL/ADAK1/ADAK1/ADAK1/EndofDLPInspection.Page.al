#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72580 "End of DLP Inspection"
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
                field("Refence No"; Rec."Refence No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Refence No field.';
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
            }
            part(Control41; "Project Inspection Line Subpag")
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
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency ID field.';
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
        area(factboxes)
        {
            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(72274),
                              "No." = field("Inspection No");
                // , "Document Type" = field("Document Type");
            }
            systempart(Control55; Links)
            {
            }
            systempart(Control57; Notes)
            {
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
            action("Minutes Circulation Team")
            {
                ApplicationArea = Basic;
                Image = SignUp;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Contract Circulation Team";
                RunPageLink = "Document Type" = filter("End of DLP Inspection"),
                              No = field("Inspection No");
                ToolTip = 'Executes the Minutes Circulation Team action.';
            }
            action("End of DLP Certificate")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the End of DLP Certificate action.';

                trigger OnAction()
                begin
                    //Get The Total Workplanned length from the Job

                    //Get The Taken Over sections workplanned length sum
                    //Compare the two to see if they are equal
                    //if not dont print the cert
                    if FnGetTotalWPlannedLengthInKM <= FnGetTotalTakenOverSectionLength then begin
                        Rec.Reset;
                        Rec.SetRange("Inspection Type", Rec."Inspection Type");
                        Rec.SetRange("Inspection No", Rec."Inspection No");
                        if Rec.FindSet then begin
                            Report.Run(72055, true, false, Rec);
                        end;
                    end
                    else
                        Error('Please confirm if the workplanned length has been fully taen over.');
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
                    // DMSManagement.UploadStaffClaimDocuments(DocType."document type"::"Transport Requisition",Rec."Inspection No",'Testing',RecordId,'');
                    //Attached:=TRUE;
                    Rec.Modify();
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Post action.';

                trigger OnAction()
                begin
                    if Rec."Has PBRM Component" = true then begin
                        if Confirm('Are you sure you want to post' + ' ' + Rec."Inspection No", true) = true then begin
                            Rec.TestField(Posted, false);
                            Rec.TestField(Status, Rec.Status::Released);


                            ProjectTransitionHeader.Init;
                            ProjectTransitionHeader."Document No." := '';
                            ProjectTransitionHeader."Project ID" := Rec."Project ID";
                            ProjectTransitionHeader.Validate("Project ID");
                            ProjectTransitionHeader."Contractor No." := Rec."Contractor No";
                            ProjectTransitionHeader.Validate("Contractor No.");
                            ProjectTransitionHeader."Purchase Contract ID" := Rec."Contract ID";
                            ProjectTransitionHeader.Validate("Purchase Contract ID");
                            ProjectTransitionHeader."Shortcut Dimension 1 Code" := Rec."Region ID";
                            ProjectTransitionHeader.Insert(true);

                            ProjecttTraHeaderNo := ProjectTransitionHeader."Document No.";

                            ProjectTransitionHeader.Reset;
                            ProjectTransitionHeader.SetRange(ProjectTransitionHeader."Document No.", ProjecttTraHeaderNo);
                            if ProjectTransitionHeader.FindSet then begin
                                ProjectTransition.SetTableview(ProjectTransitionHeader);
                                ProjectTransition.Run();
                            end;
                        end;
                    end;
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Send Approval Request action.';

                trigger OnAction()
                begin
                    Dialog.Message('Sent');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Cancel Approval Request action.';

                trigger OnAction()
                begin
                    Dialog.Message('Cancelled');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Approvals action.';

                trigger OnAction()
                begin
                    Dialog.Message('Approvals');
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
            action("Print Acknowledgement Letter")
            {
                ApplicationArea = Basic;
                Caption = 'Print Acknowledgement Letter';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print Acknowledgement Letter action.';

                trigger OnAction()
                begin
                    Rec.TestField("Refence No");
                    Rec.SetRange("Inspection No", Rec."Inspection No");
                    if Rec.FindSet then
                        Report.Run(72093, true, false, Rec);
                end;
            }
            action("Send Acknowledgement Letter")
            {
                ApplicationArea = Basic;
                Image = Receipt;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Send Acknowledgement Letter action.';

                trigger OnAction()
                begin
                    ProcProcess.FnNotifyContractorDLPAcknowledgementLetterNew(Rec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Inspection Type" := Rec."inspection type"::"End of DLP Inspection";
    end;

    var
        DMSManagement: Codeunit "DMS Management";
        DocType: Record "DMS Documents";
        ProjectTransitionHeader: Record "Project Transition Header";
        ProjectTransition: Page "Project Transition";
        ProjecttTraHeaderNo: Code[20];
        ProcProcess: Codeunit "Procurement Processing";
        TotalWPlannedLength: Decimal;
        TotalTakenOverLength: Decimal;
        ObjJob: Record Job;
        TakingOverSectionLine: Record "Taking Over Section Line";


    procedure FnGetTotalWPlannedLengthInKM(): Decimal
    begin
        ObjJob.Reset;
        ObjJob.SetRange(ObjJob."No.", Rec."Project ID");
        if ObjJob.FindSet then begin
            TotalWPlannedLength := ObjJob."Workplanned Length";
        end;
        exit(TotalWPlannedLength);
    end;


    procedure FnGetTotalTakenOverSectionLength(): Decimal
    begin
        TakingOverSectionLine.Reset;
        TakingOverSectionLine.SetRange(TakingOverSectionLine."Document No", Rec."Inspection No");
        TakingOverSectionLine.SetRange(TakingOverSectionLine."Project ID", Rec."Project ID");
        TakingOverSectionLine.CalcSums("Taking Over Length");
        TotalTakenOverLength := TakingOverSectionLine."Taking Over Length";
        exit(TotalTakenOverLength);
    end;
}

