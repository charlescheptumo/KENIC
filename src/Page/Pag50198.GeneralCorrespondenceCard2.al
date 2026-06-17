page 50198 "General Correspondence Card-2"
{
    ApplicationArea = All;
    Caption = 'General Correspondence Card-2';
    PageType = Card;
    SourceTable = "General Correspondence Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.', Comment = '%';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
                field("To all Staff"; Rec."To all Staff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To all Staff field.', Comment = '%';
                }
                field("Urgency Status"; Rec."Urgency Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Urgency Status field.', Comment = '%';
                }

                field("External Reference No"; Rec."External Reference No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Reference No field.', Comment = '%';
                }
                field("Communication Subject"; Rec."Communication Subject")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Communication Subject field.', Comment = '%';
                }
                field("Communication Content"; Rec."Communication Content")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Communication Content field.', Comment = '%';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.', Comment = '%';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field(Sent; Rec.Sent)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sent field.', Comment = '%';
                }
                field("Authorization Remarks"; Rec."Authorization Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Authorization Remarks field.', Comment = '%';
                }
                field("Signed By"; Rec."Signed By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Signed By field.', Comment = '%';
                }
                group("Additional Communication Contents")
                {
                    Editable = FALSE;
                    field("Communication Content2"; Rec."Communication Content2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Communication Content2 field.', Comment = '%';
                    }
                    field("Communication Content3"; Rec."Communication Content3")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Communication Content3 field.', Comment = '%';
                    }
                    field("Communication Content4"; Rec."Communication Content4")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Communication Content4 field.', Comment = '%';
                    }
                    field("Communication Content5"; Rec."Communication Content5")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Communication Content5 field.', Comment = '%';
                    }
                    field("Communication Content6"; Rec."Communication Content6")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Communication Content6 field.', Comment = '%';
                    }
                    field("Communication Content7"; Rec."Communication Content7")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Communication Content7 field.', Comment = '%';
                    }
                    field("Communication Content8"; Rec."Communication Content8")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Communication Content8 field.', Comment = '%';
                    }
                    field("Communication Content9"; Rec."Communication Content9")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Communication Content9 field.', Comment = '%';
                    }
                    field("Communication Content10"; Rec."Communication Content10")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Communication Content10 field.', Comment = '%';
                    }
                }
                // field("Sender No"; Rec."Sender No")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Sender No field.', Comment = '%';
                // }
                // field(Delegated; Rec.Delegated)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Delegated field.', Comment = '%';
                // }
                // field("On behalf Of No"; Rec."On behalf Of No")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the On behalf Of No field.', Comment = '%';
                // }
                // field("On behalf Of Name"; Rec."On behalf Of Name")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the On behalf Of Name field.', Comment = '%';
                // }
                // field("On behalf Of Job ID"; Rec."On behalf Of Job ID")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the On behalf Of Job ID field.', Comment = '%';
                // }
                // field("On behalf Of Job Title"; Rec."On behalf Of Job Title")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the On behalf Of Job Title field.', Comment = '%';
                // }
                // field("Sender Name"; Rec."Sender Name")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Sender Name field.', Comment = '%';
                // }
                field("Sender Job ID"; Rec."Sender Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Job ID field.', Comment = '%';
                }
                field("Sender Job Title"; Rec."Sender Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Job Title field.', Comment = '%';
                }
                field("Sender Directorate Code"; Rec."Sender Directorate Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Directorate Code field.', Comment = '%';
                }
                field("Sender Directorate Name"; Rec."Sender Directorate Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Directorate Name field.', Comment = '%';
                }
                field("Sender Directorate Email"; Rec."Sender Directorate Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Directorate Email field.', Comment = '%';
                }
                field("Sender Region Code"; Rec."Sender Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Region Code field.', Comment = '%';
                }
                field("Sender Region Name"; Rec."Sender Region Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Region Name field.', Comment = '%';
                }
                field("Sender Department Code"; Rec."Sender Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Department Code field.', Comment = '%';
                }
                field("Sender Department Name"; Rec."Sender Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender Department Name field.', Comment = '%';
                }
                field("Rejection Comments"; Rec."Rejection Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rejection Comments field.', Comment = '%';
                }
                field("Rejected By"; Rec."Rejected By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rejected By field.', Comment = '%';
                }
            }
            part("Internal Correspondence Lines"; "Internal Correspondence Lines")
            {
                SubPageLink = "Document No" = FIELD("Document No"),
                            "Document Type" = FIELD("Document Type"),
                            Type = FIELD(Type);
                Visible = Rec.Type = Rec.Type::Internal;
                Editable = FALSE;
            }
            part("External Correspondence Lines"; "External Correspondence Lines")
            {
                SubPageLink = "Document No" = FIELD("Document No"),
                            "Document Type" = FIELD("Document Type"),
                            Type = FIELD(Type);
                Visible = Rec.Type = Rec.Type::External;
                Editable = FALSE;
            }
            part("General Correspond Approvals"; "General Correspond Approvals")
            {
                SubPageLink = "Document No" = FIELD("Document No"),
                            "Document Type" = FIELD("Document Type"),
                            Type = FIELD(Type);
            }
        }
        area(FactBoxes)
        {
            // part("Portal Attachments"; "Portal Documents")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Portal Attachments';
            //     SubPageLink = ApplicationNo = field("Document No");
            // }
            part(Attachments; "Sharepoint File List")
            {
                ApplicationArea = Basic;
                SubPageLink = "No." = field("Document No");
            }
            systempart(Control1000000020; Links)
            {
            }
            // part("Attached Documents"; "Doc. Attachment List Factbox1")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Attachment';
            //     SubPageLink = "Table ID" = CONST(57008), "No." =
            //     FIELD("No.");


            // }
            systempart(Control1000000017; Notes)
            {
            }
            systempart(Control1000000018; MyNotes)
            {
            }
            systempart(Control1000000019; Links)
            {
            }
        }
    }
    actions
    {
        area(Processing)
        {
            // action("Send Approval Request")
            // {
            //     Promoted = true;
            //     PromotedIsBig = true;
            //     Visible = Rec.Status = Rec.Status::Open;
            //     Image = SendTo;
            //     PromotedCategory = Process;
            //     ToolTip = 'Executes the Send Approval Request action.';

            //     trigger OnAction()
            //     begin
            //         if Confirm('Are you sure you want to send approval request for ' + Rec."Document No" + '?') then begin
            //             Hrportal.SendGeneralCorrespondenceApproval(Rec."Document No");
            //             Rec.Status := Rec.Status::"Pending Approval";
            //             Rec.Sent := true;
            //             Rec.Modify(true);
            //             Message('Approval Request Sent Successfully.');
            //         end;
            //     end;
            // }
            // action("Cancel Approval Request")
            // {
            //     Promoted = true;
            //     PromotedIsBig = true;
            //     Visible = Rec.Status = Rec.Status::"Pending Approval";
            //     Image = CancelApprovalRequest;
            //     PromotedCategory = Process;
            //     ToolTip = 'Cancel the approval request for this document.';

            //     trigger OnAction()
            //     begin
            //         if Confirm('Are you sure you want to cancel approval request for ' + Rec."Document No" + '?') then begin
            //             Hrportal.CancelGeneralCorrespondenceApproval(Rec."Document No");
            //             Rec.Status := Rec.Status::Open;
            //             Rec.Sent := false;
            //             Rec.Modify(true);
            //             Message('Approval Request Cancelled Successfully.');
            //         end;
            //     end;
            // }

            action(Print)
            {
                Promoted = true;
                PromotedIsBig = true;
                Image = PrintDocument;
                PromotedCategory = Process;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                BEGIN
                    IF Rec."Document Type" = Rec."Document Type"::Letter THEN BEGIN
                        Rec.RESET;
                        Rec.SETRANGE("Document No", Rec."Document No");
                        REPORT.RUN(72108, TRUE, TRUE, Rec);
                    END
                    ELSE BEGIN
                        Rec.RESET;
                        Rec.SETRANGE("Document No", Rec."Document No");
                        // REPORT.RUN(72107, TRUE, TRUE, Rec);
                        Report.run(Report::"Memo Report Internal", TRUE, TRUE, Rec);
                    END;
                END;

            }
            action(Forward)
            {
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;
                Image = SendTo;
                PromotedCategory = Process;
                ToolTip = 'Executes the Forward action.';
                trigger OnAction()
                BEGIN
                    IF CONFIRM('Are you sure you want to Forward ' + Rec."Document No" + ' ?') = TRUE THEN BEGIN
                        RMSManagement.FnForwardCorrespondenceApprovalRequest(Rec);
                    END;
                END;
            }
            action(Reject)
            {
                //   CaptionML=ENU=Reject with Comments;
                Promoted = true;
                PromotedIsBig = true;
                Image = CancelApprovalRequest;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Reject action.';
                trigger OnAction()
                BEGIN
                    Rec.TESTFIELD("Rejection Comments");
                    RMSManagement.FnRejectCorrespondenceApprovalRequest(Rec);
                    Rec."Rejected By" := USERID;
                    Rec.Status := Rec.Status::Open;
                    Rec.Sent := FALSE;
                    Rec.MODIFY(TRUE);
                    RMSManagement.FnNotifyInitiatorInternalCorrespondenceRejection(Rec);
                    //RMSManagement.FnNotifyInitiatorInternalCorrespondenceRejection(Rec);
                    MESSAGE('Approval Request Rejected');
                END;
            }
            action(Approve)
            {
                //   CaptionML=ENU=Sign;
                Promoted = true;
                // Enabled = Approved = FALSE;
                PromotedIsBig = true;
                Caption = 'Approve';
                Image = SendTo;
                PromotedCategory = Process;
                ToolTip = 'Executes the Approve action.';
                trigger OnAction()
                BEGIN
                    Rec.CALCFIELDS("Current Approver");
                    // IF "Requires Authorization" = FALSE THEN BEGIN
                    //     IF CONFIRM('Are you sure you want to Approve ' + "Document No" + ' ?') = TRUE THEN BEGIN
                    //         RMSManagement.FnApproveCorrespondenceApprovalRequest(Rec);
                    //         Status := Status::Approved;
                    //         "Signed By" := USERID;
                    //         Approved := TRUE;
                    //         Sent := TRUE;
                    //         MODIFY(TRUE);
                    //         MESSAGE('%1 Approved Successfully', "External Reference No");
                    //     END;
                    // END
                    // ELSE BEGIN
                    RMSManagement.FnApproveCorrespondenceApprovalRequestWithAuthorization(Rec);
                    Rec.Status := Rec.Status::Signed;
                    Rec."Signed By" := USERID;
                    Rec.Approved := TRUE;
                    Rec.Sent := TRUE;
                    Rec.MODIFY(TRUE);
                    MESSAGE('%1 Approved Successfully', Rec."External Reference No");
                    // END;
                END;

            }
            action("View Original Correspondence")
            {
                //   CaptionML=ENU=View Original Correspondence;
                RunObject = Page "Incoming Correspondences Card";
                RunPageLink = "Document No" = FIELD(Salutation);
                Promoted = true;
                Enabled = Rec."Linked to Incoming Document" = TRUE;
                PromotedIsBig = true;
                Image = OpenJournal;
                PromotedCategory = Process;
                ToolTip = 'Executes the View Original Correspondence action.';
            }
            action(AttachDocument)
            {
                //   CaptionML=ENU=Attach Document;
                Promoted = true;
                PromotedIsBig = true;
                Image = Attach;
                PromotedCategory = Category6;
                PromotedOnly = true;
                ToolTip = 'Executes the AttachDocument action.';
                Visible = Rec.Status = Rec.Status::Open;
                trigger OnAction()
                BEGIN
                    Rec.TestField(Status, Rec.Status::Open);
                    DMSManagement.UploadEvalReportsrDocuments(DMSDocuments."Document Type"::IFS, Rec."Document No", 'Internal Correspondence', Rec.RECORDID, Rec."Sender Region Code");
                END;
            }
            action("Upload Content via Template")
            {
                Visible = false;
                ToolTip = 'Executes the Upload Content via Template action.';
                // trigger OnAction()
                // VAR
                //              AllFilesFilterTxt : TextConst '@@@={Locked};ENU=*.*';
                //              AllFilesDescriptionTxt : TextConst '@@@="{Split=r''\|''}{Locked=s''1''}";ENU=All Files (*.*)|*.*';
                //              TempBlobs : Record 99008535;
                //              Name : Text[100];
                //            BEGIN
                //              RMSManagement.UploadCorrespondenceviaTemplate(Rec,TempBlobs,'Upload',Name);
                //            END;

            }
            action(Authorize)
            {
                Promoted = true;
                Visible = Rec."Requires Authorization" = TRUE;
                Enabled = Rec.Approved = TRUE;
                PromotedIsBig = true;
                Image = Approve;
                PromotedCategory = Process;
                ToolTip = 'Executes the Authorize action.';
                trigger OnAction()
                BEGIN
                    IF CONFIRM('Are you sure you want to Approve this Document ' + Rec."Document No" + '?') THEN BEGIN
                        RMSManagement.FnAuthorizeCorrespondenceApprovalRequest(Rec);

                        RMSManagement.FnNotifyInitiatorInternalCorrespondenceApproval(Rec);
                        RMSManagement.FnNotifyRecipientsGeneralCorrespondenceOnApproval(Rec);
                        Rec.Status := Rec.Status::Approved;
                        Rec."Authorized By" := USERID;
                        Rec."Authorizaion Date" := CURRENTDATETIME;
                        Rec.MODIFY;

                    END;
                END;

            }
            action(Send)
            {
                ToolTip = 'Executes the Send action.';
                trigger OnAction()
                BEGIN
                    RMSManagement.FnNotifyRecipientsGeneralCorrespondenceOnApproval(Rec);
                END;
            }
        }

    }

    trigger OnOpenPage()
    BEGIN
        // AuthorizeApprove := FALSE;
        // //CALCFIELDS("Current Approver");

        // InternalCorrespondApprovals.RESET;
        // InternalCorrespondApprovals.SETRANGE(InternalCorrespondApprovals."Document No", "Document No");
        // InternalCorrespondApprovals.SETRANGE(InternalCorrespondApprovals."Document Type", "Document Type");
        // InternalCorrespondApprovals.SETRANGE(InternalCorrespondApprovals.Type, Type);
        // IF InternalCorrespondApprovals.FINDLAST THEN BEGIN
        //     IF "Signatory User ID" <> InternalCorrespondApprovals."User ID" THEN BEGIN
        //         AuthorizeApprove := TRUE;
        //     END;
        // END;
    END;

    trigger OnAfterGetRecord()
    BEGIN
        // AuthorizeApprove := FALSE;
        // CALCFIELDS("Current Approver");
        // InternalCorrespondApprovals.RESET;
        // InternalCorrespondApprovals.SETRANGE(InternalCorrespondApprovals."Document No", "Document No");
        // InternalCorrespondApprovals.SETRANGE(InternalCorrespondApprovals."Document Type", "Document Type");
        // InternalCorrespondApprovals.SETRANGE(InternalCorrespondApprovals.Type, Type);
        // IF InternalCorrespondApprovals.FINDLAST THEN BEGIN
        //     IF "Signatory User ID" <> InternalCorrespondApprovals."User ID" THEN BEGIN
        //         AuthorizeApprove := TRUE;
        //     END;
        // END;
    END;

    trigger OnAfterGetCurrRecord()
    BEGIN
        // AuthorizeApprove := FALSE;
        // CALCFIELDS("Current Approver");
        // InternalCorrespondApprovals.RESET;
        // InternalCorrespondApprovals.SETRANGE(InternalCorrespondApprovals."Document No", "Document No");
        // InternalCorrespondApprovals.SETRANGE(InternalCorrespondApprovals."Document Type", "Document Type");
        // InternalCorrespondApprovals.SETRANGE(InternalCorrespondApprovals.Type, Type);
        // IF InternalCorrespondApprovals.FINDLAST THEN BEGIN
        //     IF "Signatory User ID" <> InternalCorrespondApprovals."User ID" THEN BEGIN
        //         AuthorizeApprove := TRUE;
        //     END;
        // END;
    END;

    VAR
        RMSManagement: Codeunit "RMS Management";
        Hrportal: Codeunit "HRPortal";

        InternalCorrespondApprovals: Record "General Correspond Approval";
        DMSDocuments: Record 50007;
        DMSManagement: Codeunit 50009;
        licenseno: Boolean;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        //   MergePDF : Codeunit 57011;
        FileDirectoryX: Text;
        FileNameX: Text;
        FileName1: Text;
        FileName2: Text;
        FileName3: Text;
        FileName4: Text;
        FileName5: Text;
        FileName6: Text;
        FileName7: Text;
        FileName8: Text;
        FileName61: Text;
        FileName71: Text;
        FileName62: Text;
        FileDirectoryX1: Text;
        FileNameX1: Text;
        FileDirectory1: Text;
        FileName31: Text;
        FileName41: Text;
        FileName51: Text;
        FileName66: Text;
        FileName76: Text;
        FileDirectory: Text;
        AuthorizeApprove: Boolean;
}
