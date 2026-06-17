page 50197 "General Correspondence Card"
{
    ApplicationArea = All;
    Caption = 'Memo Card';
    PageType = Card;
    SourceTable = "General Correspondence Header";
    // DeleteAllowed = false;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';

                    trigger OnValidate()
                    begin
                        IfLetterVisible();
                    end;
                }
                field("Letter Type"; Rec."Letter Type")
                {
                    ApplicationArea = Basic;
                    Visible = IfLetter;
                    ToolTip = 'Specifies the value of the Letter Type field.', Comment = '%';
                }
                field("Employee Document Type"; Rec."Employee Document Type")
                {
                    ApplicationArea = Basic;
                    trigger OnValidate()
                    begin
                        EmplNoSer(Rec);
                        InitializeVariables();

                    end;

                }
                group(DepartmentVisible)
                {
                    ShowCaption = false;
                    Visible = Departmental;
                    field("Directorate Code"; Rec."Directorate Code")
                    {
                        ToolTip = 'Specifies the value of the Directorate Code field.', Comment = '%';
                    }
                    field("Department Code"; Rec."Department Code")
                    {
                        ApplicationArea = Basic;
                        Editable = Departmental;

                    }
                    field("Department Sub Type"; Rec."Department SubType")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Department SubType field.', Comment = '%';



                        trigger OnValidate()
                        begin
                            // IF Rec.AssistEditType() THEN
                            //     CurrPage.UPDATE;
                            // NoSer(Rec);
                            //  FileNoseries(Rec);
                            // Message('"Document No"::: %1', Rec."Document No");
                        end;
                    }
                    field("Sub Category"; Rec."Sub Category")
                    {
                        ToolTip = 'Specifies the value of the Sub Category field.', Comment = '%';

                        trigger OnValidate()
                        begin
                            FileNoseries(Rec);
                        end;
                    }


                }


                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.', Comment = '%';
                    // Editable = ChangeMemoNos;
                    // trigger OnAssistEdit()
                    // begin
                    //     IF Rec.AssistEdit() THEN
                    //         CurrPage.UPDATE;
                    // end;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.', Comment = '%';
                }
                field("Type of Memo"; Rec."Type of Memo")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    Visible = false;
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
                field(Salutation; Rec.Salutation)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Salutation field.', Comment = '%';
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
                group("Additional Communication Contents")
                {
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
                    field("Rich Text"; RichText)
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Rich Text Test field.', Comment = '%';
                        ExtendedDataType = RichContent;
                        MultiLine = true;
                    }
                }
                group("Signatory Details")
                {
                    field("Sender No"; Rec."Sender No")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Signatory No';
                        ToolTip = 'Specifies the value of the Signatory No field.', Comment = '%';
                    }
                    field(Delegated; Rec.Delegated)
                    {
                        ApplicationArea = Basic;
                        Visible = false;
                        ToolTip = 'Specifies the value of the Delegated field.', Comment = '%';
                    }
                    field("On behalf Of No"; Rec."On behalf Of No")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the On behalf Of No field.', Comment = '%';
                    }
                    field("On behalf Of Name"; Rec."On behalf Of Name")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the On behalf Of Name field.', Comment = '%';
                    }
                    field("On behalf Of Job ID"; Rec."On behalf Of Job ID")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the On behalf Of Job ID field.', Comment = '%';
                    }
                    field("On behalf Of Job Title"; Rec."On behalf Of Job Title")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the On behalf Of Job Title field.', Comment = '%';
                    }
                    field("Sender Name"; Rec."Sender Name")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Signatory Name';
                        ToolTip = 'Specifies the value of the Signatory Name field.', Comment = '%';
                    }
                    field("Sender Job ID"; Rec."Sender Job ID")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Signatory Job ID';
                        ToolTip = 'Specifies the value of the Signatory Job ID field.', Comment = '%';
                    }
                    field("Sender Job Title"; Rec."Sender Job Title")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Signatory Job Title';
                        ToolTip = 'Specifies the value of the Signatory Job Title field.', Comment = '%';
                    }
                    // field("Sender Directorate Code"; Rec."Sender Directorate Code")
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'Signatory Directorate Code';
                    //     ToolTip = 'Specifies the value of the Signatory Directorate Code field.', Comment = '%';
                    // }
                    // field("Sender Directorate Name"; Rec."Sender Directorate Name")
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'Signatory Directorate Name';
                    //     ToolTip = 'Specifies the value of the Signatory Directorate Name field.', Comment = '%';
                    // }
                    // field("Sender Directorate Email"; Rec."Sender Directorate Email")
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'Signatory Directorate Email';
                    //     ToolTip = 'Specifies the value of the Signatory Directorate Email field.', Comment = '%';
                    // }
                    field("Sender Region Code"; Rec."Sender Region Code")
                    {
                        ApplicationArea = Basic;
                        Visible = false;
                        ToolTip = 'Specifies the value of the Signatory Region Code field.', Comment = '%';
                    }
                    field("Sender Region Name"; Rec."Sender Region Name")
                    {
                        ApplicationArea = Basic;
                        Visible = false;
                        ToolTip = 'Specifies the value of the Signatory Region Name field.', Comment = '%';
                    }
                    field("Sender Department Code"; Rec."Sender Department Code")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Signatory Department Code';
                        ToolTip = 'Specifies the value of the Signatory Department Code field.', Comment = '%';
                    }
                    field("Sender Department Name"; Rec."Sender Department Name")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Signatory Department Name';
                        ToolTip = 'Specifies the value of the Signatory Department Name field.', Comment = '%';
                    }
                }
                group("Rejection Details")
                {
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
                field("Current Approver"; Rec."Current Approver")
                {
                    ApplicationArea = Basic;
                }
                field("Creator No"; Rec."Creator No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creator No field.', Comment = '%';
                }
            }
            part("Internal Correspondence Liness"; "Internal Correspondence Lines")
            {
                SubPageView = WHERE("Notification Type" = CONST(Receipient));
                SubPageLink = "Document No" = FIELD("Document No"),
                            "Document Type" = FIELD("Document Type"),
                            Type = FIELD(Type);
                Visible = Rec.Type = Rec.Type::Internal;
                Enabled = Rec."To all Staff" = FALSE;
            }
            part("Internal Correspondence Lines"; "Internal Correspondence Lines")
            {
                // CaptionML=ENU=Correspondence CC Lines;
                SubPageView = WHERE("Notification Type" = CONST(CC));
                SubPageLink = "Document No" = FIELD("Document No"),
                            "Document Type" = FIELD("Document Type"),
                            Type = FIELD(Type);
                Visible = Rec.Type = Rec.Type::Internal;
                Enabled = Rec."To all Staff" = FALSE;
            }
            part("External Correspondence Lines"; "External Correspondence Lines")
            {
                SubPageLink = "Document No" = FIELD("Document No"),
                            "Document Type" = FIELD("Document Type"),
                            Type = FIELD(Type);
                Visible = Rec.Type = Rec.Type::External;
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
            action(PrintSharepoint)
            {
                ApplicationArea = Basic;
                Promoted = true;
                Visible = false;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    CustomFunction: Codeunit "Custom Function";
                    Ins: Instream;
                    TempBlob: Codeunit "Temp Blob";
                    OuStr: OutStream;
                    RecRef: RecordRef;
                    DocType: Enum "Approval Document Type";
                    CorrepondenceHeader: Record "General Correspondence Header";
                begin
                    Clear(RecRef);
                    CorrepondenceHeader.Reset();
                    CorrepondenceHeader.SetRange("Document No", Rec."Document No");
                    IF CorrepondenceHeader.FindFirst() Then begin
                        RecRef.GetTable(CorrepondenceHeader);
                        TempBlob.CreateOutStream(OuStr);
                        if Rec."Type of Memo" = Rec."Type of Memo"::EAP then begin
                            Report.SaveAs(Report::"Memo Report EAP", '', ReportFormat::Pdf, OuStr, RecRef);
                        end else if Rec."Type of Memo" = Rec."Type of Memo"::Internal then begin
                            Report.SaveAs(Report::"Memo Report Internal", '', ReportFormat::Pdf, OuStr, RecRef);
                        end;
                        TempBlob.CreateInStream(Ins);
                        DocType := DocType::Memos;
                        //CustomFunction.ReportstoSharepoint(Rec."Document No", DocType, Ins, Rec."Document No" + ' Printout.pdf');
                    end;
                end;
            }
            action(Print)
            {
                Promoted = true;
                PromotedIsBig = true;
                Image = PrintDocument;
                PromotedCategory = Process;
                trigger OnAction()
                BEGIN
                    IF Rec."Document Type" = Rec."Document Type"::Memo THEN BEGIN
                        Rec.RESET;
                        Rec.SETRANGE("Document No", Rec."Document No");
                        Report.run(Report::"Memo Report Internal", TRUE, TRUE, Rec);

                        // report.run(72107, TRUE, TRUE, Rec);
                        // if Rec."Type of Memo" = Rec."Type of Memo"::Internal then begin
                        //     report.run(50064, TRUE, TRUE, Rec);
                        // end else begin
                        //     report.run(50065, TRUE, TRUE, Rec);
                        // end;
                        // if Rec."Type of Memo" = Rec."Type of Memo"::EAP then begin
                        //     report.run(Report::"Memo Report EAP", TRUE, TRUE, Rec);
                        // end else if Rec."Type of Memo" = Rec."Type of Memo"::Internal then begin
                        //     report.run(Report::"Memo Report Internal", TRUE, TRUE, Rec);
                        // end;
                    END;
                    // IF "Document Type" = "Document Type"::Letter THEN BEGIN
                    //     IF Type = Type::External THEN BEGIN
                    //         RESET;
                    //         SETRANGE("Document No", "Document No");
                    //         REPORT.RUN(72110, TRUE, TRUE, Rec);
                    //     END
                    //     ELSE BEGIN
                    //         RESET;
                    //         SETRANGE("Document No", "Document No");
                    //         REPORT.RUN(72109, TRUE, TRUE, Rec);
                    //     END;
                    // END;
                END;

            }
            action("Send Approval Request")
            {
                Promoted = true;
                PromotedIsBig = true;
                Image = SendApprovalRequest;
                PromotedCategory = Category4;


                trigger OnAction()
                var
                    UserSetup: Record "User Setup";
                    FirstApproverIsRegistry: Boolean;
                begin
                    // Validate that approvers exist
                    InternalCorrespondApprovals.Reset();
                    InternalCorrespondApprovals.SetRange("Document No", Rec."Document No");
                    InternalCorrespondApprovals.SetRange("Document Type", Rec."Document Type");
                    InternalCorrespondApprovals.SetRange(Type, Rec.Type);

                    if not InternalCorrespondApprovals.FindSet() then
                        Error('No approvers have been defined. Please add approvers before sending for approval.');

                    FirstApproverIsRegistry := false;

                    repeat
                        InternalCorrespondApprovals.TestField("User ID");
                        InternalCorrespondApprovals.TestField(Sequence);

                        // Check if Sequence 1 approver is from Registry
                        if InternalCorrespondApprovals.Sequence = 1 then begin
                            if UserSetup.Get(InternalCorrespondApprovals."User ID") then begin
                                if UserSetup."Registrar Approval" then
                                    FirstApproverIsRegistry := true
                                else
                                    Error('The first approver (Sequence 1) must be from the Registry Office. Please assign a Registry user as the first approver.');
                            end else begin
                                Error('User Setup not found for User ID: %1', InternalCorrespondApprovals."User ID");
                            end;

                            Rec."Current Approver" := InternalCorrespondApprovals."User ID";
                            Rec.Modify();
                        end;
                    until InternalCorrespondApprovals.Next() = 0;

                    if not FirstApproverIsRegistry then
                        Error('No approver with Sequence 1 found. Please ensure you have a Registry Office user assigned as the first approver.');

                    // Send approval request through the General Correspondence workflow
                    RMSManagement.FnSendInternalCorrespondenceApprovalRequest(Rec);

                    Rec.Status := Rec.Status::"Pending Approval";
                    Rec.Modify();

                    Message('Approval Request sent successfully to the General Correspondence workflow.');
                end;
            }

            // action("Send Approval Request")
            // {
            //     Promoted = true;
            //     PromotedIsBig = true;
            //     Image = SendApprovalRequest;
            //     PromotedCategory = Category4;
            //     Visible = true;

            //     trigger OnAction()
            //     var
            //         UserSetup: Record "User Setup";
            //         FirstApproverIsRegistry: Boolean;
            //         Var_Varaint: Variant;
            //         CustomApprovalMgt: Codeunit "Custom Approvals Codeunit";

            //     begin

            //         Rec.TestField(Status, Rec.Status::Open);
            //          Var_Varaint := Rec;
            //         if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(Var_Varaint) then
            //             CustomApprovalMgt.OnSendDocForApproval(Var_Varaint);
            //         // // Validate that approvers exist
            //         // InternalCorrespondApprovals.Reset();
            //         // InternalCorrespondApprovals.SetRange("Document No", Rec."Document No");
            //         // InternalCorrespondApprovals.SetRange("Document Type", Rec."Document Type");
            //         // InternalCorrespondApprovals.SetRange(Type, Rec.Type);

            //         // if not InternalCorrespondApprovals.FindSet() then
            //         //     Error('No approvers have been defined. Please add approvers before sending for approval.');

            //         // FirstApproverIsRegistry := false;

            //         // repeat
            //         //     InternalCorrespondApprovals.TestField("User ID");
            //         //     InternalCorrespondApprovals.TestField(Sequence);

            //         //     // Check if Sequence 1 approver is from Registry
            //         //     if InternalCorrespondApprovals.Sequence = 1 then begin
            //         //         if UserSetup.Get(InternalCorrespondApprovals."User ID") then begin
            //         //             if UserSetup."Registrar Approval" then
            //         //                 FirstApproverIsRegistry := true
            //         //             else
            //         //                 Error('The first approver (Sequence 1) must be from the Registry Office. Please assign a Registry user as the first approver.');
            //         //         end else begin
            //         //             Error('User Setup not found for User ID: %1', InternalCorrespondApprovals."User ID");
            //         //         end;

            //         //         Rec."Current Approver" := InternalCorrespondApprovals."User ID";
            //         //         Rec.Modify();
            //         //     end;
            //         // until InternalCorrespondApprovals.Next() = 0;

            //         // if not FirstApproverIsRegistry then
            //         //     Error('No approver with Sequence 1 found. Please ensure you have a Registry Office user assigned as the first approver.');

            //         // // Send approval request through the General Correspondence workflow
            //         // RMSManagement.FnSendInternalCorrespondenceApprovalRequest(Rec);

            //         // Rec.Status := Rec.Status::"Pending Approval";
            //         // Rec.Modify();

            //         Message('Approval Request sent successfully to the General Correspondence workflow.');
            //     end;
            // }
            action("Cancel Approval Request")
            {
                Promoted = true;
                PromotedIsBig = true;
                Image = CancelApprovalRequest;
                PromotedCategory = Category4;
                Visible = true;
                trigger OnAction()
                BEGIN
                    // Rec.TestField(Status, Rec.Status::"Pending Approval");
                    RMSManagement.FnCancelCorrespondenceApprovalRequest(Rec);
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify();
                    //Sent:=FALSE;
                    //MODIFY(TRUE);
                    MESSAGE('Approval Request Cancelled Successfully');
                END;

            }



            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ToolTip = 'Executes the Approvals action.';
                Visible = true;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }

            // action("Test")
            // {
            //     Promoted = true;
            //     PromotedIsBig = true;
            //     Image = CancelApprovalRequest;
            //     PromotedCategory = Category4;
            //     trigger OnAction()
            //     var
            //         HRPortal: Codeunit 50012;
            //     BEGIN
            //         HRPortal.InsertGeneralCorrespondenceHeader('', 'ADAK015', 1, 1, 'Test Sub', 'Test Content', '', '', '', '', '', '', '', '', '', true, 'ICT', 'ICT INTERNAL SUPPORT- ADAK ICT 3', 1, 0);
            //         //Sent:=FALSE;
            //         //MODIFY(TRUE);
            //         MESSAGE('Approval Request Cancelled Successfully');
            //     END;

            // }
            action(AttachDocument)
            {
                //   CaptionML=ENU=Attach Document;
                Promoted = true;
                PromotedIsBig = true;
                Image = Attach;
                PromotedCategory = Category6;
                PromotedOnly = true;
                Visible = false;
                trigger OnAction()
                BEGIN
                    DMSManagement.UploadEvalReportsrDocuments(DMSDocuments."Document Type"::IFS, Rec."Document No", 'Internal Correspondence', Rec.RECORDID, Rec."Sender Region Code");
                END;

            }
            action("View Original Correspondence")
            {
                //   CaptionML=ENU=View Original Correspondence;
                RunObject = Page "Incoming Correspondences Card";
                RunPageLink = "Document No" = FIELD("Incoming Document No");
                Promoted = true;
                Enabled = Rec."Linked to Incoming Document" = TRUE;
                PromotedIsBig = true;
                Image = OpenJournal;
                PromotedCategory = Process;
            }
            action("Portal Documents")
            {
                ApplicationArea = Basic;
                Image = Documents;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Opens attached documents from the portal.';
                // RunObject = Page "Portal Documents";
                // RunPageLink = ApplicationNo = field("Document No");
            }
            action(Reopen)
            {
                trigger OnAction()
                BEGIN
                    Rec.Status := Rec.Status::Open;
                    Rec.MODIFY;
                END;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                Image = Post;

                trigger OnAction()
                var
                    CustomFunction: Codeunit "Custom Function";
                    Ins: Instream;
                    TempBlob: Codeunit "Temp Blob";
                    OuStr: OutStream;
                    OutStream: OutStream;
                    Instream: InStream;
                    RecRef: RecordRef;
                    FileName: Text;
                    DocType: Enum "Approval Document Type";
                    CorrepondenceHeader: Record "General Correspondence Header";
                begin
                    GeneralCorrespondenceLine.Reset();
                    GeneralCorrespondenceLine.SetRange("Document No", Rec."Document No");
                    if GeneralCorrespondenceLine.FindSet then begin
                        repeat
                            if GeneralCorrespondenceLine."Recipient Email" = '' then
                                Error('Kindly insert the email for the member %1', GeneralCorrespondenceLine."Recipient Name");
                            Recepient := GeneralCorrespondenceLine."Recipient Email";
                            Subject := Rec."Communication Subject";
                            Body += 'Dear ' + GeneralCorrespondenceLine."Recipient Name" + ',';
                            Body += '<br>This memo is based to cater for ' + Rec."Communication Content" + '.';
                            Body += '<br>Also the below items are additionals for this memo: ';
                            Body += '<ul>';
                            if Rec."Communication Content2" <> '' then
                                Body += '<li>' + Rec."Communication Content2" + '</li>';
                            if Rec."Communication Content3" <> '' then
                                Body += '<li>' + Rec."Communication Content3" + '</li>';
                            if Rec."Communication Content4" <> '' then
                                Body += '<li>' + Rec."Communication Content4" + '</li>';
                            if Rec."Communication Content5" <> '' then
                                Body += '<li>' + Rec."Communication Content5" + '</li>';
                            if Rec."Communication Content6" <> '' then
                                Body += '<li>' + Rec."Communication Content6" + '</li>';
                            if Rec."Communication Content7" <> '' then
                                Body += '<li>' + Rec."Communication Content7" + '</li>';
                            if Rec."Communication Content8" <> '' then
                                Body += '<li>' + Rec."Communication Content8" + '</li>';
                            if Rec."Communication Content9" <> '' then
                                Body += '<li>' + Rec."Communication Content9" + '</li>';
                            if Rec."Communication Content10" <> '' then
                                Body += '<li>' + Rec."Communication Content10" + '</li>';
                            Body += '<br>Kind Regards,';
                            Body += '<br>' + Rec."Creator Name" + '.';
                            EmailMessage.Create(Recepient, Subject, Body, true);
                            if Rec."Type of Memo" = Rec."Type of Memo"::EAP then begin
                                TempBlob.CreateOutStream(OutStream);
                                Report.SaveAs(Report::"Memo Report EAP", '', ReportFormat::PDF, OutStream, RecRef);
                                TempBlob.CreateInStream(Instream);
                                FileName := 'Correspondence Memo ' + Rec."Document No" + '.pdf';
                                EmailMessage.AddAttachment(FileName, 'pdf', Instream);
                            end else begin
                                TempBlob.CreateOutStream(OutStream);
                                Report.SaveAs(Report::"Memo Report Internal", '', ReportFormat::PDF, OutStream, RecRef);
                                TempBlob.CreateInStream(Instream);
                                FileName := 'Correspondence Memo ' + Rec."Document No" + '.pdf';
                                EmailMessage.AddAttachment(FileName, 'pdf', Instream);
                            end;
                            Email.Send(EmailMessage, EmailScenario::Default);
                        until GeneralCorrespondenceLine.Next = 0;
                    end;

                    Rec.Posted := true;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        DocType: Enum "Approval Document Type";
        DocNo: code[20];
    begin
        DocType := DocType::Memos;
        DocNo := Rec."Document No";
        CurrPage.Attachments.Page.Documenttype(DocType, Rec."Document No");
        RichText := Rec.GetRichText();
    end;

    trigger OnOpenPage()
    begin
        OnApproved := false;
        ChangeMemoNos := false;
        if Rec.Status = Rec.Status::Approved then
            OnApproved := true;
        InitializeVariables();
        // if Rec."Document No" = '' then begin
        //     if Rec."Department Code" = 'FINANCE' then begin
        //         // HumanResourcesSetup.TestField("Finance Memo Nos");
        //         if Rec."Document No" <> xRec."Document No" then
        //             NoSeriesManagement.TestManual(HumanResourcesSetup."Finance Memo Nos");
        //     end else
        //         // if GeneralCorrespondenceHeader."Department Code" = 'HCA' then begin
        //         if Rec."Department Code" = 'HCA' then begin
        //             // HumanResourcesSetup.TestField("Human Capital Memo Nos");
        //             if Rec."Document No" <> xRec."Document No" then
        //                 NoSeriesManagement.TestManual(HumanResourcesSetup."Human Capital Memo Nos");
        //         end else
        //             // if GeneralCorrespondenceHeader."Department Code" = 'SCM' then begin
        //             if Rec."Department Code" = 'SCM' then begin
        //                 // HumanResourcesSetup.TestField("SCM Memo Nos");
        //                 if Rec."Document No" <> xRec."Document No" then
        //                     NoSeriesManagement.TestManual(HumanResourcesSetup."SCM Memo Nos");
        //             end else
        //                 // if GeneralCorrespondenceHeader."Department Code" = 'CORPORATE' then begin
        //                 if Rec."Department Code" = 'CORPORATE' then begin
        //                     // HumanResourcesSetup.TestField("Corporate Memo Nos");
        //                     if Rec."Document No" <> xRec."Document No" then
        //                         NoSeriesManagement.TestManual(HumanResourcesSetup."Corporate Memo Nos");
        //                 end else
        //                     // if GeneralCorrespondenceHeader."Department Code" = 'ICT' then begin
        //                     if Rec."Department Code" = 'ICT' then begin
        //                         // HumanResourcesSetup.TestField("ICT Memo Nos");
        //                         if Rec."Document No" <> xRec."Document No" then
        //                             NoSeriesManagement.TestManual(HumanResourcesSetup."ICT Memo Nos");
        //                     end else
        //                         // if GeneralCorrespondenceHeader."Department Code" = 'STANDARDS' then begin
        //                         if Rec."Department Code" = 'STANDARDS' then begin
        //                             // HumanResourcesSetup.TestField("Standards and Compliance Memo Nos");
        //                             if Rec."Document No" <> xRec."Document No" then
        //                                 NoSeriesManagement.TestManual(HumanResourcesSetup."Standards and Compliance Memo Nos");
        //                         end else
        //                             // if GeneralCorrespondenceHeader."Department Code" = 'AUDIT' then begin
        //                             if Rec."Department Code" = 'AUDIT' then begin
        //                                 // HumanResourcesSetup.TestField("Audit Memo Nos");
        //                                 if Rec."Document No" <> xRec."Document No" then
        //                                     NoSeriesManagement.TestManual(HumanResourcesSetup."Audit Memo Nos");
        //                             end else
        //                                 // if GeneralCorrespondenceHeader."Department Code" = 'LEGAL' then begin
        //                                 if Rec."Department Code" = 'LEGAL' then begin
        //                                     // HumanResourcesSetup.TestField("Legal Memo Nos");
        //                                     if Rec."Document No" <> xRec."Document No" then
        //                                         NoSeriesManagement.TestManual(HumanResourcesSetup."Legal Memo Nos");
        //                                 end else
        //                                     // if GeneralCorrespondenceHeader."Department Code" = 'EDUCATION' then begin
        //                                     if Rec."Department Code" = 'EDUCATION' then begin
        //                                         // HumanResourcesSetup.TestField("Education Memo Nos");
        //                                         if Rec."Document No" <> xRec."Document No" then
        //                                             NoSeriesManagement.TestManual(HumanResourcesSetup."Education Memo Nos");
        //                                     end else begin
        //                                         if Rec."Document No" <> xRec."Document No" then
        //                                             NoSeriesManagement.TestManual(HumanResourcesSetup."General Correspondences Nos");
        //                                     end;
        // end
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        IfLetter := false;
        Departmental := true;
        // if Rec."Document Type" = Rec."Document Type"::Memo then begin
        //     if Rec."Department Code" = 'ADMIN' then begin
        //         if Rec."Document No" <> xRec."Document No" then
        //         SupplyChainDocsNos(Rec);
        //     end else
        //     if Rec."Department Code" = 'FINANCE' then begin
        //         if Rec."Document No" <> xRec."Document No" then

        //     end else
        //         if Rec."Department Code" = 'HCA' then begin
        //             if Rec."Document No" <> xRec."Document No" then
        //         end else
        //             if Rec."Department Code" = 'SCM' then begin
        //                 if Rec."Document No" <> xRec."Document No" then
        //             end else
        //                 if Rec."Department Code" = 'CORPORATE' then begin
        //                     if Rec."Document No" <> xRec."Document No" then
        //                 end else
        //                     if Rec."Department Code" = 'ICT' then begin
        //                         if Rec."Document No" <> xRec."Document No" then
        //                     end else
        //                         if Rec."Department Code" = 'STANDARDS' then begin
        //                             if Rec."Document No" <> xRec."Document No" then
        //                         end else
        //                             if Rec."Department Code" = 'AUDIT' then begin
        //                                 if Rec."Document No" <> xRec."Document No" then
        //                             end else
        //                                 if Rec."Department Code" = 'LEGAL' then begin
        //                                     if Rec."Document No" <> xRec."Document No" then
        //                                 end else
        //                                     if Rec."Department Code" = 'EDUCATION' then begin
        //                                         if Rec."Document No" <> xRec."Document No" then
        //                                     end else if Rec."Department Code" = 'EAP' then begin
        //                                         if Rec."Document No" <> xRec."Document No" then
        //                                     end else begin
        //                                         if Rec."Document No" <> xRec."Document No" then
        //                                             NoSeriesManagement.TestManual(HumanResourcesSetup."General Correspondences Nos");
        //                                     end;
        // end else
        // if Rec."Document Type" = Rec."Document Type"::Letter then begin

        // end;
    end;

    VAR
        RMSManagement: Codeunit "RMS Management";
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
        // MergePDF: Codeunit 57011;
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
        OnApproved: Boolean;
        Recepient, Subject, Body : Text;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailScenario: Enum "Email Scenario";
        GeneralCorrespondenceLine: Record "General Correspondence Line";
        NoSeriesManagement: Codeunit "No. Series";
        HumanResourcesSetup: Record "Memo Nos Setup";
        MemoNosSetup: Record "Memo Nos Setup";
        MemoNoSetupII: Record "Memo Nos SetupII";
        CustomFunction: Codeunit "Custom Function";
        ChangeMemoNos: Boolean;
        AdministrationDocs: Enum "Administration Docs";
        AuditDocs: Enum "Audit Docs";
        CorporateDocs: Enum "Corporate Communication Docs";
        EduResearchDocs: Enum "Education and Research Docs";
        FinanceDocs: Enum "Finance and Accounts Docs";
        HumanCapitalDocs: Enum "Human Capital Docs";
        ICTDocs: Enum "ICT Docs";
        LegalDocs: Enum "Legal Docs";
        PersonnelDocs: Enum "Personnel Files Docs";
        StandardDocs: Enum "Standards and Compliance Docs";
        SCMDocs: Enum "Supply Chain Management Docs";
        TransportDocs: Enum "Transport Docs";
        IfLetter: Boolean;
        RichText: Text;
        //[InDataSet]
        Departmental: Boolean;




    procedure IfLetterVisible()
    begin
        IfLetter := false;
        if Rec."Document Type" = Rec."Document Type"::Letter then
            IfLetter := true;
    end;

    procedure IfDepartmentVisible()
    begin

        if Rec."Employee Document Type" = Rec."Employee Document Type"::Open then
            Departmental := false;

    end;

    local procedure InitializeVariables()
    begin
        case Rec."Employee Document Type" of
            Rec."Employee Document Type"::Open:
                SetFieldsVisible(false);
            Rec."Employee Document Type"::Confidential:
                SetFieldsVisible(true);
            Rec."Employee Document Type"::Department:
                SetFieldsVisible(true);
        end;
    end;

    local procedure SetFieldsVisible(NewDepartmentVisible: Boolean)
    begin
        Departmental := NewDepartmentVisible;
    end;


    procedure EmplNoSer(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    var
        EmployeeNo: Code[50];
        UserSetup: Record "User Setup";

    begin
        if UserSetup.Get(userId) then
            EmployeeNo := UserSetup."Employee No."
        else
            Error('Employee No. on the User Setup is blank');
        if Rec."Document No" = '' then begin
            HumanResourcesSetup.Get();
            MemoNosSetup.Get();
            if Rec."Employee Document Type" = Rec."Employee Document Type"::Confidential then begin
                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."Employee Confidential", WorkDate(), true) + '/' + EmployeeNo;
            end else
                if Rec."Employee Document Type" = Rec."Employee Document Type"::Open then begin
                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."Employee Open", WorkDate(), true) + '/' + EmployeeNo;
                end;
            //Rec."Document No" := Rec."Document No" + '/'+ EmployeeNo;
        end;
    end;


    procedure FileNoseries(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    var
        NoSeries: Code[50];
        SubtypeCategories: Record "Memo subtypeII";

    begin
        if Rec."Document No" = '' then begin
            if Rec."Document Type" = Rec."Document Type"::Memo then begin
                SubtypeCategories.Reset;
                SubtypeCategories.SetRange(Subtype, Rec."Sub Category");
                if SubtypeCategories.FindFirst() then
                    Rec."Document No" := NoSeriesManagement.GetNextNo(SubtypeCategories."No series", WorkDate(), true);
            end;

        end;

    end;

    procedure NoSer(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    begin
        if Rec."Document No" = '' then begin
            HumanResourcesSetup.Get();
            MemoNosSetup.Get();
            if Rec."Document Type" = Rec."Document Type"::Memo then begin
                // if Rec."Department Code" = 'ADMINISTRATION' then begin
                if Rec."Department Code" = 'SCM' then begin
                    SupplyChainDocsNos(Rec);
                end else
                    if Rec."Department Code" = 'HRM&D' then begin
                        HumanCapitalDocsNos(Rec);
                    end else
                        if Rec."Department Code" = 'ADM' then begin
                            AdministrationNos(Rec);
                        end else
                            //  if Rec."Department Code" = 'CC' then begin
                            //     CorporateCommunicationNos(Rec);
                            //  end else
                            //  if Rec."Department Code" = 'CD' then begin
                            //     CurriculumDevelopmentNos(Rec);
                            //  end else
                            if Rec."Department Code" = 'CON' then begin
                                ConsultancyNos(Rec);
                            end else
                                if Rec."Department Code" = 'CS' then begin
                                    CorporateServicesNos(Rec);
                                end else
                                    //   if Rec."Department Code" = 'EB' then begin
                                    //     EducationalBroadcastingNos(Rec);
                                    //   end else 
                                    //    if Rec."Department Code" = 'E-L' then begin
                                    //     E-LearningNos(Rec);
                                    //    end else
                                    //     if Rec."Department Code" = 'EM' then begin
                                    //     EducationalMediaNos(Rec);
                                    //     end else
                                    if Rec."Department Code" = 'ER' then begin
                                        EducationalResourcesNos(Rec);
                                    end else
                                        if Rec."Department Code" = 'F&A' then begin
                                            FinanceAccountsNos(Rec);
                                        end else
                                            if Rec."Department Code" = 'IA' then begin
                                                InternalAuditNos(Rec);
                                            end else
                                                // if Rec."Department Code" = 'ICT' then begin
                                                // InformationCommNos(Rec);
                                                // end else
                                                // if Rec."Department Code" = 'LS' then begin
                                                // LegalServicesNos(Rec);
                                                // end else
                                                if Rec."Department Code" = 'NRC' then begin
                                                    NACECEResourceCentreNos(Rec);
                                                end else
                                                    // if Rec."Department Code" = 'P & P' then begin
                                                    // PrintPublishingNos(Rec);
                                                    // end else
                                                    if Rec."Department Code" = 'PL' then begin
                                                        PlanningNos(Rec);
                                                    end else
                                                        if Rec."Department Code" = 'PRE-PRI' then begin
                                                            PreprimaryprimaryNos(Rec);
                                                        end else
                                                            if Rec."Department Code" = 'PRQAS' then begin
                                                                PlanningResearchQANos(Rec);
                                                            end else
                                                                //  if Rec."Department Code" = 'QA' then begin
                                                                // QualityAssuranceNos(Rec);
                                                                //  end else
                                                                //   if Rec."Department Code" = 'RKM' then begin
                                                                // ReseachKnowledgeNos(Rec);
                                                                //   end else
                                                                if Rec."Department Code" = 'SEC' then begin
                                                                    SecondaryNos(Rec);
                                                                end else
                                                                    if Rec."Department Code" = 'SNE & A' then begin
                                                                        SpecialNeedsAPBETNos(Rec);
                                                                    end else
                                                                        if Rec."Department Code" = 'TE' then begin
                                                                            TeacherEducationNos(Rec);
                                                                        end else
                                                                            if Rec."Department Code" = 'TS' then begin
                                                                                TechnicalServicesNos(Rec);
                                                                            end else
                                                                                if Rec."Department Code" = 'TVET' then begin
                                                                                    TechVocTrainingNos(Rec);
                                                                                end;
            end;
            if Rec."Document Type" = Rec."Document Type"::Letter then begin
                if Rec."Letter Type" = Rec."Letter Type"::"Letter EAP" then begin
                    //EAPDocsNos(Rec);
                end else if Rec."Letter Type" = Rec."Letter Type"::"Letter Staff" then begin
                    //StaffDocsNos(Rec);
                end;
            end;
        end;
        // if xRec."Department SubType" <> Rec."Department SubType" then begin
        //     HumanResourcesSetup.Get();
        //     MemoNosSetup.Get();
        //     if Rec."Document Type" = Rec."Document Type"::Memo then begin
        //         if Rec."Department Code" ='SCM' then begin
        //             SupplyChainDocsNos(Rec);
        //         end else
        //         if Rec."Department Code" ='HRM&D' then begin
        //             HumanCapitalDocsNos(Rec);
        //         end;
        //     end;
        //     if Rec."Document Type" = Rec."Document Type"::Letter then begin
        //         if Rec."Letter Type" = Rec."Letter Type"::"Letter EAP" then begin
        //             //EAPDocsNos(Rec);
        //         end else if Rec."Letter Type" = Rec."Letter Type"::"Letter Staff" then begin
        //             //StaffDocsNos(Rec);
        //         end;
        //     end;
        // end
    end;

    // procedure SupplyChainDocsNos(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    // begin
    //     MemoNosSetup.Get();
    //     if Rec."Department SubType" = 'PROCUREMENT AND STORES POLICY' then begin
    //         Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PROCUREMENT AND STORES POLICY", WorkDate(), true);
    //     end else
    //         if Rec."Department SubType" = 'TENDER COMMITTEE' then begin
    //             Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."Tender Committee", WorkDate(), true);
    //         end;
    // end;
    procedure SupplyChainDocsNos(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    begin
        MemoNosSetup.Get();

        // Check if the Department SubType matches and assign the appropriate document number
        if Rec."Department SubType" = 'PROCUREMENT AND STORES POLICY' then begin
            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PROCUREMENT AND STORES POLICY", WorkDate(), true);
        end else
            if Rec."Department SubType" = 'TENDER COMMITTEE' then begin
                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."TENDER COMMITTEE", WorkDate(), true);
            end else
                if Rec."Department SubType" = 'PROCUREMENT COMMITTEE' then begin
                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PROCUREMENT COMMITTEE", WorkDate(), true);
                end else
                    if Rec."Department SubType" = 'INSPECTION AND ACCEPTANCE COMMITTEE' then begin
                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."INSPECTION AND ACCEPTANCE COMMITTEE", WorkDate(), true);
                    end else
                        if Rec."Department SubType" = 'TENDER EVALUATION COMMITTEE' then begin
                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."TENDER EVALUATION COMMITTEE", WorkDate(), true);
                        end else
                            if Rec."Department SubType" = 'TENDER & QUOTATIONS COMM. APPOINTMENTS' then begin
                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."TENDER & QUOTATIONS COMM. APPOINTMENTS", WorkDate(), true);
                            end else
                                if Rec."Department SubType" = 'LETTERS OF INTRODUCTION - SUPPLIERS/SERVICE PROVIDERS' then begin
                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."LETTERS OF INTRODUCTION - SUPPLIERS/SERVICE PROVIDERS", WorkDate(), true);
                                end else
                                    if Rec."Department SubType" = 'EXTERNAL ADVERTISEMENTS' then begin
                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."EXTERNAL ADVERTISEMENTS", WorkDate(), true);
                                    end else
                                        if Rec."Department SubType" = 'DISPOSAL OF ASSETS' then begin
                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."DISPOSAL OF ASSETS", WorkDate(), true);
                                        end else
                                            if Rec."Department SubType" = 'STORES SERVICES' then begin
                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."STORES SERVICES", WorkDate(), true);
                                            end else
                                                if Rec."Department SubType" = 'PURCHASE OF STORES' then begin
                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PURCHASE OF STORES", WorkDate(), true);
                                                end else
                                                    if Rec."Department SubType" = 'TENDER EVALUATION RECOMMENDATIONS' then begin
                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."TENDER EVALUATION RECOMMENDATIONS", WorkDate(), true);
                                                    end else
                                                        if Rec."Department SubType" = 'INSURANCE POLICIES' then begin
                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."INSURANCE POLICIES", WorkDate(), true);
                                                        end else
                                                            if Rec."Department SubType" = 'PPOA CORRESPONDENCES' then begin
                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PPOA CORRESPONDENCES", WorkDate(), true);
                                                            end;
    end;


    procedure HumanCapitalDocsNos(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    begin
        MemoNosSetup.Get();
        if Rec."Department SubType" = 'Human Resources POLICY' then begin
            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."Human Resources POLICY", WorkDate(), true);
        end else
            if Rec."Department SubType" = 'HRM POLICY' then begin
                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."HRM POLICY", WorkDate(), true);
            end;
    end;


    procedure SpecialNeedsAPBETNos(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    begin
        MemoNosSetup.Get();

        // Check if the Department SubType matches and assign the appropriate document number
        if Rec."Department SubType" = 'SPECIAL EDUCATION COURSE PANEL' then begin
            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SPECIAL EDUCATION COURSE PANEL", WorkDate(), true);
        end else
            if Rec."Department SubType" = 'SPECIAL EDUCATION GENERAL CORRESPONDENCE' then begin
                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SPECIAL EDUCATION GENERAL CORRESPONDENCE", WorkDate(), true);
            end else
                if Rec."Department SubType" = 'SIGN LANGUAGE' then begin
                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SIGN LANGUAGE", WorkDate(), true);
                end else
                    if Rec."Department SubType" = 'DISABILITY MAINSTREAMING' then begin
                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."DISABILITY MAINSTREAMING", WorkDate(), true);
                    end else
                        if Rec."Department SubType" = 'SPECIAL EDUCATION PHYSICALLY HANDICAPPED PANEL' then begin
                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SPECIAL EDUCATION PHYSICALLY HANDICAPPED PANEL", WorkDate(), true);
                        end else
                            if Rec."Department SubType" = 'SPECIAL EDUCATION MENTALLY HANDICAPPED PANEL' then begin
                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SPECIAL EDUCATION MENTALLY HANDICAPPED PANEL", WorkDate(), true);
                            end else
                                if Rec."Department SubType" = 'SPECIAL EDUCATION VISUALLY HANDICAPPED PANEL' then begin
                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SPECIAL EDUCATION VISUALLY HANDICAPPED PANEL", WorkDate(), true);
                                end else
                                    if Rec."Department SubType" = 'SPECIAL EDUCATION DEAF-BLIND PANEL' then begin
                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SPECIAL EDUCATION DEAF-BLIND PANEL", WorkDate(), true);
                                    end else
                                        if Rec."Department SubType" = 'SPECIAL EDUCATION GIFTED AND TALENTED PANEL' then begin
                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SPECIAL EDUCATION GIFTED AND TALENTED PANEL", WorkDate(), true);
                                        end else
                                            if Rec."Department SubType" = 'AUTISM' then begin
                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."AUTISM", WorkDate(), true);
                                            end else
                                                if Rec."Department SubType" = 'LEARNING DISABILITY PANEL CORRESPONDENCE' then begin
                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."LEARNING DISABILITY PANEL CORRESPONDENCE", WorkDate(), true);
                                                end else
                                                    if Rec."Department SubType" = 'SPECIAL EDUCATION HEARING IMPAIRED PANEL' then begin
                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SPECIAL EDUCATION HEARING IMPAIRED PANEL", WorkDate(), true);
                                                    end;
    end;

    procedure TechVocTrainingNos(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    begin
        MemoNosSetup.Get();

        // Check if the Department SubType matches and assign the appropriate document number
        if Rec."Department SubType" = 'TIVET COURSE PANEL CORRESPONDENCE' then begin
            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."TIVET COURSE PANEL CORRESPONDENCE", WorkDate(), true);
        end else
            if Rec."Department SubType" = 'TOURISM MANAGEMENT PANEL CORRESPONDENCE' then begin
                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."TOURISM MANAGEMENT PANEL CORRESPONDENCE", WorkDate(), true);
            end else
                if Rec."Department SubType" = 'INSURANCE COURSES CORRESPONDENCE' then begin
                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."INSURANCE COURSES CORRESPONDENCE", WorkDate(), true);
                end else
                    if Rec."Department SubType" = 'BUSINESS AND HOSPITALITY MANAGEMENT PANEL' then begin
                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."BUSINESS AND HOSPITALITY MANAGEMENT PANEL", WorkDate(), true);
                    end else
                        if Rec."Department SubType" = 'DISASTER AND RISK MANAGEMENT' then begin
                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."DISASTER AND RISK MANAGEMENT", WorkDate(), true);
                        end else
                            if Rec."Department SubType" = 'SECRETARIAL NATIONAL PANEL CORRESPONDENCE' then begin
                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECRETARIAL NATIONAL PANEL CORRESPONDENCE", WorkDate(), true);
                            end else
                                if Rec."Department SubType" = 'CO-OPERATIVE EDUCATION' then begin
                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."CO-OPERATIVE EDUCATION", WorkDate(), true);
                                end else
                                    if Rec."Department SubType" = 'ENTREPRENEURSHIP PANEL CORRESPONDENCE' then begin
                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."ENTREPRENEURSHIP PANEL CORRESPONDENCE", WorkDate(), true);
                                    end else
                                        if Rec."Department SubType" = 'TRANSPORT PANEL GENERAL CORRESPONDENCE' then begin
                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."TRANSPORT PANEL GENERAL CORRESPONDENCE", WorkDate(), true);
                                        end else
                                            if Rec."Department SubType" = 'BUILDING AND CIVIL ENGINEERING PANEL CORRESPONDENCE' then begin
                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."BUILDING AND CIVIL ENGINEERING PANEL CORRESPONDENCE", WorkDate(), true);
                                            end else
                                                if Rec."Department SubType" = 'DOMESTIC/HOME MANAGEMENT PANEL CORRESPONDENCE' then begin
                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."DOMESTIC/HOME MANAGEMENT PANEL CORRESPONDENCE", WorkDate(), true);
                                                end else
                                                    if Rec."Department SubType" = 'FRONT OFFICE MANAGEMENT PANEL CORRESPONDENCE' then begin
                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."FRONT OFFICE MANAGEMENT PANEL CORRESPONDENCE", WorkDate(), true);
                                                    end else
                                                        if Rec."Department SubType" = 'CATERING AND ACCOMMODATION PANEL CORRESPONDENCE' then begin
                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."CATERING AND ACCOMMODATION PANEL CORRESPONDENCE", WorkDate(), true);
                                                        end else
                                                            if Rec."Department SubType" = 'WATER ENGINEERING PANEL CORRESPONDENCE' then begin
                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."WATER ENGINEERING PANEL CORRESPONDENCE", WorkDate(), true);
                                                            end else
                                                                if Rec."Department SubType" = 'COMPUTER STUDIES' then begin
                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."COMPUTER STUDIES", WorkDate(), true);
                                                                end else
                                                                    if Rec."Department SubType" = 'MECHANICAL AUTOMOBILE AGRICULTURAL AND PRIME MOVER' then begin
                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."MECHANICAL AUTOMOBILE AGRICULTURAL AND PRIME MOVER", WorkDate(), true);
                                                                    end else
                                                                        if Rec."Department SubType" = 'LEATHER TECHNOLOGY PANEL CORRESPONDENCE' then begin
                                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."LEATHER TECHNOLOGY PANEL CORRESPONDENCE", WorkDate(), true);
                                                                        end else
                                                                            if Rec."Department SubType" = 'FISHERIES TECHNOLOGY PANEL CORRESPONDENCE' then begin
                                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."FISHERIES TECHNOLOGY PANEL CORRESPONDENCE", WorkDate(), true);
                                                                            end else
                                                                                if Rec."Department SubType" = 'MEDICAL ENGINEERING PANEL CORRESPONDENCE' then begin
                                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."MEDICAL ENGINEERING PANEL ORRESPONDENCE", WorkDate(), true);
                                                                                end else
                                                                                    if Rec."Department SubType" = 'TEXTILE AND GARMENT MANAGEMENT PANEL' then begin
                                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."TEXILE AND GARMENT MANAGEMENT PANEL", WorkDate(), true);
                                                                                    end else
                                                                                        if Rec."Department SubType" = 'ELECTRICAL ELECTRONICS AND TELECOMMUNICATION ENGINEERING' then begin
                                                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."ELECTRICAL ELECTRONICS AND TELECOMMUNICATIONENGINEERING", WorkDate(), true);
                                                                                        end else
                                                                                            if Rec."Department SubType" = 'INFORMATION STUDIES' then begin
                                                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."INFORMATION STUDIES", WorkDate(), true);
                                                                                            end else
                                                                                                if Rec."Department SubType" = 'FOOD PROCESSING TECHNOLOGY' then begin
                                                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."FOOD PROCESSING TECHNOLOGY", WorkDate(), true);
                                                                                                end else
                                                                                                    if Rec."Department SubType" = 'AGRICULTURE PANEL CORRESPONDENCE' then begin
                                                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."AGRICULTURE PANEL CORRESPONDENCE", WorkDate(), true);
                                                                                                    end else
                                                                                                        if Rec."Department SubType" = 'APPLIED SCIENCES PANEL CORRESPONDENCE' then begin
                                                                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."APPLIED SCIENCES PANEL CORRESPONDENCE", WorkDate(), true);
                                                                                                        end else
                                                                                                            if Rec."Department SubType" = 'NUTRITION AND DIETETICS' then begin
                                                                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."NUTRITION AND DIETETICS", WorkDate(), true);
                                                                                                            end else
                                                                                                                if Rec."Department SubType" = 'SUPPLY CHAIN MANAGEMENT PANEL CORRESPONDENCE' then begin
                                                                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SUPPLY CHAIN MANAGEMENT PANEL CORRESPONDENCE", WorkDate(), true);
                                                                                                                end else
                                                                                                                    if Rec."Department SubType" = 'MEDICAL LABORATORY TECHNOLOGY' then begin
                                                                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."MEDICAL LABORATORY TECHNOLOGY", WorkDate(), true);
                                                                                                                    end else
                                                                                                                        if Rec."Department SubType" = 'ANALYTICAL CHEMISTRY' then begin
                                                                                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."ANALYTICAL CHEMISTRY", WorkDate(), true);
                                                                                                                        end else
                                                                                                                            if Rec."Department SubType" = 'COMMUNITY HEALTH AND NUTRITION' then begin
                                                                                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."COMMUNITY HEALTH AND NUTRITION", WorkDate(), true);
                                                                                                                            end else
                                                                                                                                if Rec."Department SubType" = 'SUSTAINABLE AGRICULTURE' then begin
                                                                                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SUSTAINABLE AGRICULTURE", WorkDate(), true);
                                                                                                                                end else
                                                                                                                                    if Rec."Department SubType" = 'FOOD AND BEVERAGES' then begin
                                                                                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."FOOD AND BEVERAGES", WorkDate(), true);
                                                                                                                                    end else
                                                                                                                                        if Rec."Department SubType" = 'HUMAN RESOURCE MANAGEMENT PANEL' then begin
                                                                                                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."HUMAN RESOURCE MANAGEMENT PANEL", WorkDate(), true);
                                                                                                                                        end else
                                                                                                                                            if Rec."Department SubType" = 'SCIENCE LABORATORY TECHNOLOGY PANEL' then begin
                                                                                                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SCIENCE LABORATORY TECNOLOGY PANEL", WorkDate(), true);
                                                                                                                                            end else
                                                                                                                                                if Rec."Department SubType" = 'ACCOUNTING PANEL CORRESPONDENCE' then begin
                                                                                                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."ACCOUNTING PANEL CORRESPONDENCE", WorkDate(), true);
                                                                                                                                                end;
    end;

    procedure PlanningResearchQANos(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    begin
        MemoNosSetup.Get();

        // Check if the Department SubType matches and assign the appropriate document number
        if Rec."Department SubType" = 'RESEARCH AND EVALUATION' then begin
            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."RESEARCH AND EVALUATION", WorkDate(), true);
        end else
            if Rec."Department SubType" = 'REQUEST TO CONDUCT RESEARCH' then begin
                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."REQUEST TO CONDUCT RESEARCH", WorkDate(), true);
            end else
                if Rec."Department SubType" = 'RESEARCH JOURNAL' then begin
                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."RESEARCH JOURNAL", WorkDate(), true);
                end else
                    if Rec."Department SubType" = 'KIE EDUCATION SYMPOSIUM' then begin
                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."KIE EDUCATION SYMPOSIUM", WorkDate(), true);
                    end else
                        if Rec."Department SubType" = 'COLLABORATIONS WITH RESEARCH INSTITUTIONS' then begin
                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."COLLABORATIONS WITH RESEARCH INSTITUTIONS", WorkDate(), true);
                        end else
                            if Rec."Department SubType" = 'RESEARCH PANEL CORRESPONDENCE' then begin
                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."RESEARCH PANEL CORRESPONDENCE", WorkDate(), true);
                            end else
                                if Rec."Department SubType" = 'BASIC RESEARCH' then begin
                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."BASIC RESEARCH", WorkDate(), true);
                                end else
                                    if Rec."Department SubType" = 'APPLIED RESEARCH' then begin
                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."APPLIED RESEARCH", WorkDate(), true);
                                    end;
    end;

    procedure EducationalResourcesNos(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    begin
        MemoNosSetup.Get();

        if Rec."Department SubType" = 'LIBRARY SERVICES' then begin
            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."LIBRARY SERVICES", WorkDate(), true);
        end else
            if Rec."Department SubType" = 'KENYA GAZETTE' then begin
                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."KENYA GAZETTE", WorkDate(), true);
            end else
                if Rec."Department SubType" = 'BOOKSHOP POLICY' then begin
                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."BOOKSHOP POLICY", WorkDate(), true);
                end else
                    if Rec."Department SubType" = 'BOOKSHOP MATTER 1' then begin
                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."BOOKSHOP MATTER 1", WorkDate(), true);
                    end else
                        if Rec."Department SubType" = 'BOOKSHOP REPORTS' then begin
                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."BOOKSHOP REPORTS", WorkDate(), true);
                        end else
                            if Rec."Department SubType" = 'REQUEST FOR SYLLABI' then begin
                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."REQUEST FOR SYLLABI", WorkDate(), true);
                            end else
                                if Rec."Department SubType" = 'REQUEST FOR BOOKS' then begin
                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."REQUEST FOR BOOKS", WorkDate(), true);
                                end else
                                    if Rec."Department SubType" = 'BOOKSHOP SALES' then begin
                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."BOOKSHOP SALES", WorkDate(), true);
                                    end else
                                        if Rec."Department SubType" = 'RESOURCE MATERIALS POLICY' then begin
                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."RESOURCE MATERIALS POLICY", WorkDate(), true);
                                        end else
                                            if Rec."Department SubType" = 'EDUCATIONAL RESOURCES GENERAL CORRESPONDENCE' then begin
                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."EDUCATIONAL RESOURCES GENERAL CORRESPONDENCE", WorkDate(), true);
                                            end else
                                                if Rec."Department SubType" = 'DISSEMINATION AND UTILIZATION OF CURRICULUM SUPPORT MATERIALS' then begin
                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."DISSEMINATION AND UTILIZATION OF CURRICULUM SUPPORT MATERIALS", WorkDate(), true);
                                                end else
                                                    if Rec."Department SubType" = 'E R MATERIALS DEVELOPMENT & PRODUCTION' then begin
                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."E R MATERIALS DEVELOPMENT & PRODUCTION", WorkDate(), true);
                                                    end else
                                                        if Rec."Department SubType" = 'PRINT & PUBLICATION POLICY' then begin
                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PRINT & PUBLICATION POLICY", WorkDate(), true);
                                                        end else
                                                            if Rec."Department SubType" = 'PRINT & PUBLICATION MATTER 1' then begin
                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PRINT & PUBLICATION MATTER 1", WorkDate(), true);
                                                            end else
                                                                if Rec."Department SubType" = 'PRINT AND PUBLICATIONS' then begin
                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PRINT AND PUBLICATIONS", WorkDate(), true);
                                                                end else
                                                                    if Rec."Department SubType" = 'INTERNATIONAL STANDARD BOOK NUMBER (ISBN)' then begin
                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."INTERNATIONAL STANDARD BOOK NUMBER (ISBN)", WorkDate(), true);
                                                                    end else
                                                                        if Rec."Department SubType" = 'PRINTING MACHINES' then begin
                                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PRINTING MACHINES", WorkDate(), true);
                                                                        end else
                                                                            if Rec."Department SubType" = 'REQUEST FOR PRINTING SERVICES - EXTERNAL CLIENTS' then begin
                                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."REQUEST FOR PRINTING SERVICES - EXTERNAL CLIENTS", WorkDate(), true);
                                                                            end else
                                                                                if Rec."Department SubType" = 'REQUEST FOR PRINTING SERVICES - TIVET' then begin
                                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."REQUEST FOR PRINTING SERVICES - TIVET", WorkDate(), true);
                                                                                end else
                                                                                    if Rec."Department SubType" = 'REQUEST FOR PRINTING SERVICES - BASIC' then begin
                                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."REQUEST FOR PRINTING SERVICES - BASIC", WorkDate(), true);
                                                                                    end else
                                                                                        if Rec."Department SubType" = 'REQUEST FOR PRINTING SERVICES-RM&E' then begin
                                                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."REQUEST FOR PRINTING SERVICES-RM&E", WorkDate(), true);
                                                                                        end else
                                                                                            if Rec."Department SubType" = 'REQUEST FOR PRINTING SERVICES-ER' then begin
                                                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."REQUEST FOR PRINTING SERVICES-ER", WorkDate(), true);
                                                                                            end else
                                                                                                if Rec."Department SubType" = 'REQUEST FOR PRINTING SERVICES-CS' then begin
                                                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."REQUEST FOR PRINTING SERVICES-CS", WorkDate(), true);
                                                                                                end else
                                                                                                    if Rec."Department SubType" = 'REQUEST FOR PRINTING SERVICES-SP' then begin
                                                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."REQUEST FOR PRINTING SERVICES-SP", WorkDate(), true);
                                                                                                    end else
                                                                                                        if Rec."Department SubType" = 'REQUEST FOR PRINTING SERVICES-EEM' then begin
                                                                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."REQUEST FOR PRINTING SERVICES-EEM", WorkDate(), true);
                                                                                                        end else
                                                                                                            if Rec."Department SubType" = 'REPAIR AND MAINTENANCE OF PRINTING EQUIPMENT' then begin
                                                                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."REPAIR AND MAINTENANCE OF PRINTING EQUIPMENT", WorkDate(), true);
                                                                                                            end;
    end;


    procedure AdministrationNos(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    begin
        MemoNosSetup.Get();
        MemoNoSetupII.Get();

        // Check if the Department SubType matches and assign the appropriate document number
        if Rec."Department SubType" = 'CONTRACTS & AGREEMENTS' then begin
            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."CONTRACTS & AGREEMENTS", WorkDate(), true);
        end else
            if Rec."Department SubType" = 'LITIGATIONS' then begin
                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."LITIGATIONS", WorkDate(), true);
            end else
                if Rec."Department SubType" = 'INTEGRITY AND CORRUPTION PREVENTION' then begin
                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."INTEGRITY AND CORRUPTION PREVENTION", WorkDate(), true);
                end else
                    if Rec."Department SubType" = 'COMMITTEE ON DEVELOPMENT OF KIE POLICY AND DRAFT BILL CF: KICD ACTS AND REGULATIONS' then begin
                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."COMMITTEE ON DEVELOPMENT OF KIE POLICY AND DRAFT BILL CF: KICD ACTS AND REGULATIONS", WorkDate(), true);
                    end else
                        if Rec."Department SubType" = 'LAWS OF KENYA - BILLS' then begin
                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."LAWS OF KENYA - BILLS", WorkDate(), true);
                        end else
                            if Rec."Department SubType" = 'PARLIAMENTARY QUESTIONS' then begin
                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."PARLIAMENTARY QUESTIONS", WorkDate(), true);
                            end else
                                if Rec."Department SubType" = 'LEGAL DOCUMENTS - TRANSFER' then begin
                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."LEGAL DOCUMENTS - TRANSFER", WorkDate(), true);
                                end else
                                    if Rec."Department SubType" = 'ADM PUBLIC COMPLAINTS' then begin
                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."ADM PUBLIC COMPLAINTS", WorkDate(), true);
                                    end else
                                        if Rec."Department SubType" = 'ISO QUALITY MANAGEMENT SYSTEM' then begin
                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."ISO QUALITY MANAGEMENT SYSTEM", WorkDate(), true);
                                        end else
                                            if Rec."Department SubType" = 'CORRUPTION PREVENTION COMMITTEE' then begin
                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."CORRUPTION PREVENTION COMMITTEE", WorkDate(), true);
                                            end else
                                                if Rec."Department SubType" = 'KIE COMMITTEES GENERAL' then begin
                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."KIE COMMITTEES GENERAL", WorkDate(), true);
                                                end else
                                                    if Rec."Department SubType" = 'MANAGEMENT COMMITTEE' then begin
                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."MANAGEMENT COMMITTEE", WorkDate(), true);
                                                    end else
                                                        if Rec."Department SubType" = 'SENIOR MANAGEMENT COMMITTEE' then begin
                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."SENIOR MANAGEMENT COMMITTEE", WorkDate(), true);
                                                        end else
                                                            if Rec."Department SubType" = 'DIRECTORS APPOINTMENT TO EXTERNAL BOARDS/COUNCILS' then begin
                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."DIRECTORS APPOINTMENT TO EXTERNAL BOARDS/COUNCILS", WorkDate(), true);
                                                            end else
                                                                if Rec."Department SubType" = 'MEMBERSHIP TO EXTERNAL BOARDS/COUNCILS-GENERAL' then begin
                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."MEMBERSHIP TO EXTERNAL BOARDS/COUNCILS-GENERAL", WorkDate(), true);
                                                                end else
                                                                    if Rec."Department SubType" = 'SCHOOL EQUIPMENT PRODUCTION UNIT(SEPU)' then begin
                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."SCHOOL EQUIPMENT PRODUCTION UNIT(SEPU)", WorkDate(), true);
                                                                    end else
                                                                        if Rec."Department SubType" = 'KNEC COUNCIL' then begin
                                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."KNEC COUNCIL", WorkDate(), true);
                                                                        end else
                                                                            if Rec."Department SubType" = 'KNEC SECURITY COMMITTEE' then begin
                                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."KNEC SECURITY COMMITTEE", WorkDate(), true);
                                                                            end else
                                                                                if Rec."Department SubType" = 'KISE COUNCIL' then begin
                                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."KISE COUNCIL", WorkDate(), true);
                                                                                end else
                                                                                    if Rec."Department SubType" = 'KEMI COUNCIL' then begin
                                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."KEMI COUNCIL", WorkDate(), true);
                                                                                    end else
                                                                                        if Rec."Department SubType" = 'KTTC BOARD' then begin
                                                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."KTTC BOARD", WorkDate(), true);
                                                                                        end else
                                                                                            if Rec."Department SubType" = 'HONOURS AND AWARDS' then begin
                                                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."HONOURS AND AWARDS", WorkDate(), true);
                                                                                            end else
                                                                                                if Rec."Department SubType" = 'EQUIPMENT SERVICE CONTRACTS' then begin
                                                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."EQUIPMENT SERVICE CONTRACTS", WorkDate(), true);
                                                                                                end else
                                                                                                    if Rec."Department SubType" = 'ADMINISTRATIVE CIRCULARS' then begin
                                                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."ADMINISTRATIVE CIRCULARS", WorkDate(), true);
                                                                                                    end else
                                                                                                        if Rec."Department SubType" = 'ISO STEERING COMMITTEE' then begin
                                                                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."ISO STEERING COMMITTEE", WorkDate(), true);
                                                                                                        end else
                                                                                                            if Rec."Department SubType" = 'KICD COUNCIL GENERAL' then begin
                                                                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."KICD COUNCIL GENERAL", WorkDate(), true);
                                                                                                            end else
                                                                                                                if Rec."Department SubType" = 'NATIONAL COHESION AND VALUES COMMITTEE' then begin
                                                                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."NATIONAL COHESION AND VALUES COMMITTEE", WorkDate(), true);
                                                                                                                end else
                                                                                                                    if Rec."Department SubType" = 'LINKAGES AND PARTNERSHIP' then begin
                                                                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."LINKAGES AND PARTNERSHIP", WorkDate(), true);
                                                                                                                    end;
    end;

    procedure CorporateServicesNos(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    begin
        MemoNosSetup.Get();
        MemoNoSetupII.Get();

        // Check if the Department SubType matches and assign the appropriate document number
        if Rec."Department SubType" = 'L/6/P POLICY' then begin
            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."L/6/P POLICY", WorkDate(), true);
        end else
            if Rec."Department SubType" = 'L/6/1/1 MATTER 1' then begin
                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."L/6/1/1 MATTER 1", WorkDate(), true);
            end else
                if Rec."Department SubType" = 'MARKETING' then begin
                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."MARKETING", WorkDate(), true);
                end else
                    if Rec."Department SubType" = 'NEWS FLASH' then begin
                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."NEWS FLASH", WorkDate(), true);
                    end else
                        if Rec."Department SubType" = 'CURRICULUM WATCH' then begin
                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."CURRICULUM WATCH", WorkDate(), true);
                        end else
                            if Rec."Department SubType" = 'SHOWS/EXHIBITIONS' then begin
                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."SHOWS/EXHIBITIONS", WorkDate(), true);
                            end else
                                if Rec."Department SubType" = 'SPONSORSHIPS' then begin
                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."SPONSORSHIPS", WorkDate(), true);
                                end else
                                    if Rec."Department SubType" = 'INVITATIONS' then begin
                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."INVITATIONS", WorkDate(), true);
                                    end else
                                        if Rec."Department SubType" = 'CEREMONIES, CELEBRATIONS AND LAUNCH EVENTS' then begin
                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."CEREMONIES, CELEBRATIONS AND LAUNCH EVENTS", WorkDate(), true);
                                        end else
                                            if Rec."Department SubType" = 'VISITORS TO THE INSTITUTE' then begin
                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."VISITORS TO THE INSTITUTE", WorkDate(), true);
                                            end else
                                                if Rec."Department SubType" = 'DONATIONS' then begin
                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."DONATIONS", WorkDate(), true);
                                                end else
                                                    if Rec."Department SubType" = 'APPRECIATIONS AND COMMENDATIONS' then begin
                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."APPRECIATIONS AND COMMENDATIONS", WorkDate(), true);
                                                    end else
                                                        if Rec."Department SubType" = 'CONDOLENCES' then begin
                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."CONDOLENCES", WorkDate(), true);
                                                        end else
                                                            if Rec."Department SubType" = 'PUBLIC SERVICE WEEK' then begin
                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."PUBLIC SERVICE WEEK", WorkDate(), true);
                                                            end else
                                                                if Rec."Department SubType" = 'STAFF PARTY' then begin
                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."STAFF PARTY", WorkDate(), true);
                                                                end else
                                                                    if Rec."Department SubType" = 'STAFF CHOIR' then begin
                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."STAFF CHOIR", WorkDate(), true);
                                                                    end else
                                                                        if Rec."Department SubType" = 'SPORTS AND OTHER ACTIVITIES' then begin
                                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."SPORTS AND OTHER ACTIVITIES", WorkDate(), true);
                                                                        end else
                                                                            if Rec."Department SubType" = 'CORPORATE SOCIAL RESPONSIBILITY' then begin
                                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."CORPORATE SOCIAL RESPONSIBILITY", WorkDate(), true);
                                                                            end else
                                                                                if Rec."Department SubType" = 'APPOINTMENTS' then begin
                                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."APPOINTMENTS", WorkDate(), true);
                                                                                end else
                                                                                    if Rec."Department SubType" = 'CORPORATE PUBLIC COMPLAINTS' then begin
                                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."CORPORATE PUBLIC COMPLAINTS", WorkDate(), true);
                                                                                    end else
                                                                                        if Rec."Department SubType" = 'MEDIA REPORTS' then begin
                                                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."MEDIA REPORTS", WorkDate(), true);
                                                                                        end else
                                                                                            if Rec."Department SubType" = 'EXTERNAL VISITS BY KICD STAFF' then begin
                                                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNoSetupII."EXTERNAL VISITS BY KICD STAFF", WorkDate(), true);
                                                                                            end;
    end;

    procedure PlanningNos(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    begin
        MemoNosSetup.Get();

        // Check if the Department SubType matches and assign the appropriate document number
        if Rec."Department SubType" = 'PLANNING POLICY' then begin
            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PLANNING POLICY", WorkDate(), true);
        end else
            if Rec."Department SubType" = 'PLANNING MATTER 1' then begin
                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PLANNING MATTER 1", WorkDate(), true);
            end else
                if Rec."Department SubType" = 'VISION 2030' then begin
                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."VISION 2030", WorkDate(), true);
                end else
                    if Rec."Department SubType" = 'CUSTOMER SATISFACTION SURVEYS' then begin
                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."CUSTOMER SATISFACTION SURVEYS", WorkDate(), true);
                    end else
                        if Rec."Department SubType" = 'STRATEGIC PLAN' then begin
                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."STRATEGIC PLAN", WorkDate(), true);
                        end;
    end;

    procedure InternalAuditNos(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    begin
        MemoNosSetup.Get();

        // Check if the Department SubType matches and assign the appropriate document number
        if Rec."Department SubType" = 'AUDIT POLICY' then begin
            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."AUDIT POLICY", WorkDate(), true);
        end else
            if Rec."Department SubType" = 'KENAO' then begin
                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."KENAO", WorkDate(), true);
            end else
                if Rec."Department SubType" = 'ISO SURVEILANCE AUDITS' then begin
                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."ISO SURVEILANCE AUDITS", WorkDate(), true);
                end else
                    if Rec."Department SubType" = 'INTERNAL AUDITS' then begin
                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."INTERNAL AUDITS", WorkDate(), true);
                    end else
                        if Rec."Department SubType" = 'AUDIT COMMITTEE - AGENDA & MINUTES' then begin
                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."AUDIT COMMITTEE - AGENDA & MINUTES", WorkDate(), true);
                        end else
                            if Rec."Department SubType" = 'INVESTIGATIONS (D & SDDCS ONLY)' then begin
                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."INVESTIGATIONS (D & SDDCS ONLY)", WorkDate(), true);
                            end;
    end;

    procedure TeacherEducationNos(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    begin
        MemoNosSetup.Get();

        // Check if the Department SubType matches and assign the appropriate document number
        if Rec."Department SubType" = 'PTE GENERAL CORRESPONDENCE' then begin
            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PTE GENERAL CORRESPONDENCE", WorkDate(), true);
        end else
            if Rec."Department SubType" = 'DTE GENERAL CORRESPONDENCE' then begin
                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."DTE GENERAL CORESPONDENCE", WorkDate(), true);
            end else
                if Rec."Department SubType" = 'DIPLOMA IN PRIMARY TEACHER EDUCATION REVIEW' then begin
                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."DIPLOMA IN PRIMARY TEACHER EDUCATION REVIEW", WorkDate(), true);
                end else
                    if Rec."Department SubType" = 'PTE LANGUAGES PANEL CORRESPONDENCE' then begin
                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PTE LANGUAGES PANEL CORRESPONDENCE", WorkDate(), true);
                    end else
                        if Rec."Department SubType" = 'PTE SCIENCES & MATHEMATICS PANEL CORRESPONDENCE' then begin
                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PTE SCIENCES & MATHEMATICS PANEL CORRESPONDENCE", WorkDate(), true);
                        end else
                            if Rec."Department SubType" = 'PTE HUMANITIES PANEL CORRESPONDENCE' then begin
                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PTE HUMANITIES PANEL CORRESPONDENCE", WorkDate(), true);
                            end else
                                if Rec."Department SubType" = 'PTE CREATIVE ARTS PANEL CORRESPONDENCE' then begin
                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PTE CREATIVE ARTS PANEL CORRESPONDENCE", WorkDate(), true);
                                end else
                                    if Rec."Department SubType" = 'PTE PROFESSIONAL SUBJECTS' then begin
                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PTE PROFESSIONAL SUBJECTS", WorkDate(), true);
                                    end else
                                        if Rec."Department SubType" = 'DTE LANGUAGES PANEL CORRESPONDENCE' then begin
                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."DTE LANGUAGES PANEL CORRESPONDENCE", WorkDate(), true);
                                        end else
                                            if Rec."Department SubType" = 'DTE SCIENCES AND MATHEMATICS PANEL' then begin
                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."DTE SCIENCES AND MATHEMATICS PANEL", WorkDate(), true);
                                            end else
                                                if Rec."Department SubType" = 'DTE HUMANITIES PANEL CORRESPONDENCE' then begin
                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."DTE HUMANITIES PANEL CORRESPONDENCE", WorkDate(), true);
                                                end else
                                                    if Rec."Department SubType" = 'DTE CREATIVE ARTS PANEL CORRESPONDENCE' then begin
                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."DTE CREATIVE ARTS PANEL CORRESPONDENCE", WorkDate(), true);
                                                    end else
                                                        // if Rec."Department SubType" = 'DTE PROFESSIONAL & SUPPORT SUBJECTS PANEL' then begin
                                                        //     Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."DTE PROFESSIONAL & SUPPORT SUBJECTS PANEL", WorkDate(), true);
                                                        // end else
                                                        if Rec."Department SubType" = 'DTE TECHNICAL SUBJECTS PANEL CORRESPONDENCE' then begin
                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."DTE TECHNICAL SUBJECTS PANEL CORRESPONDENCE", WorkDate(), true);
                                                        end;
    end;

    procedure FinanceAccountsNos(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    begin
        MemoNosSetup.Get();

        // Check if the Department SubType matches and assign the appropriate document number
        if Rec."Department SubType" = 'FINANCE POLICY' then begin
            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."FINANCE POLICY", WorkDate(), true);
        end else
            if Rec."Department SubType" = 'CASH SURVEY BOARD COMMITTEE - TRANSFER' then begin
                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."CASH SURVEY BOARD COMMITTEE - TRANSFER", WorkDate(), true);
            end else
                if Rec."Department SubType" = 'INVESTMENTS' then begin
                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."INVESTMENTS", WorkDate(), true);
                end else
                    if Rec."Department SubType" = 'ESTIMATES' then begin
                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."ESTIMATES", WorkDate(), true);
                    end else
                        if Rec."Department SubType" = 'RETURNED CHEQUES' then begin
                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."RETURNED CHEQUES", WorkDate(), true);
                        end else
                            if Rec."Department SubType" = 'INVOICES AND STATEMENTS' then begin
                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."INVOICES AND STATEMENTS", WorkDate(), true);
                            end else
                                if Rec."Department SubType" = 'APPLICATIONS FOR IMPREST' then begin
                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."APPLICATIONS FOR IMPREST", WorkDate(), true);
                                end else
                                    if Rec."Department SubType" = 'KRA - VAT' then begin
                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."KRA - VAT", WorkDate(), true);
                                    end else
                                        if Rec."Department SubType" = 'M-PESA' then begin
                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."M-PESA", WorkDate(), true);
                                        end else
                                            if Rec."Department SubType" = 'GOVERNMENT GRANTS' then begin
                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."GOVERNMENT GRANTS", WorkDate(), true);
                                            end else
                                                if Rec."Department SubType" = 'DATA RETURNS' then begin
                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."DATA RETURNS", WorkDate(), true);
                                                end else
                                                    if Rec."Department SubType" = 'KIE FINANCES' then begin
                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."KIE FINANCES", WorkDate(), true);
                                                    end else
                                                        if Rec."Department SubType" = 'EQUITY BANK AGENCY - TRANSFER' then begin
                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."EQUITY BANK AGENCY - TRANSFER", WorkDate(), true);
                                                        end else
                                                            if Rec."Department SubType" = 'REMITTANCES' then begin
                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."REMITTANCES", WorkDate(), true);
                                                            end else
                                                                if Rec."Department SubType" = 'INSTITUTES DEBTORS' then begin
                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."INSTITUTES DEBTORS", WorkDate(), true);
                                                                end else
                                                                    if Rec."Department SubType" = 'KENYA COMMERCIAL BANK' then begin
                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."KENYA COMMERCIAL BANK", WorkDate(), true);
                                                                    end else
                                                                        if Rec."Department SubType" = 'STANDARD CHARTERED BANK' then begin
                                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."STANDARD CHARTERED BANK", WorkDate(), true);
                                                                        end else
                                                                            if Rec."Department SubType" = 'CO-OPERATIVE BANK' then begin
                                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."CO-OPERATIVE BANK", WorkDate(), true);
                                                                            end else
                                                                                if Rec."Department SubType" = 'REQUEST FOR TEMPORARY IMPREST - NON KICD STAFF' then begin
                                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."REQUEST FOR TEMPORARY IMPREST - NON KICD STAFF", WorkDate(), true);
                                                                                end;
    end;

    procedure NACECEResourceCentreNos(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    begin
        MemoNosSetup.Get();

        // Check if the Department SubType matches and assign the appropriate document number
        if Rec."Department SubType" = 'NRC POLICY' then begin
            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."NRC POLICY", WorkDate(), true);
        end else
            if Rec."Department SubType" = 'NRC COMMITTEE - AGENDA & MINUTES' then begin
                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."NRC COMMITTEE - AGENDA & MINUTES", WorkDate(), true);
            end else
                if Rec."Department SubType" = 'NRC LIFTS' then begin
                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."NRC LIFTS", WorkDate(), true);
                end else
                    if Rec."Department SubType" = 'NRC EQUIPMENT/MACHINES' then begin
                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."NRC EQUIPMENT/MACHINES", WorkDate(), true);
                    end else
                        if Rec."Department SubType" = 'HOTEL BOOKINGS' then begin
                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."HOTEL BOOKINGS", WorkDate(), true);
                        end else
                            if Rec."Department SubType" = 'BOOKINGS FOR NRC' then begin
                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."BOOKINGS FOR NRC", WorkDate(), true);
                            end else
                                if Rec."Department SubType" = 'NRC STAFFING' then begin
                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."NRC STAFFING", WorkDate(), true);
                                end else
                                    if Rec."Department SubType" = 'NRC MEDICAL EXAMINATION' then begin
                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."NRC MEDICAL EXAMINATION", WorkDate(), true);
                                    end else
                                        if Rec."Department SubType" = 'WAGES FOR NRC DAILY HIREES' then begin
                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."WAGES FOR NRC DAILY HIREES", WorkDate(), true);
                                        end else
                                            if Rec."Department SubType" = 'HOUSE KEEPING SERVICES' then begin
                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."HOUSE KEEPING SERVICES", WorkDate(), true);
                                            end else
                                                if Rec."Department SubType" = 'REQUISITION OF OFFICE BEVERAGES' then begin
                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."REQUISITION OF OFFICE BEVERAGES", WorkDate(), true);
                                                end else
                                                    if Rec."Department SubType" = 'NRC MARKETING' then begin
                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."NRC MARKETING", WorkDate(), true);
                                                    end else
                                                        if Rec."Department SubType" = 'COMMISSIONS FOR NRC BUSINESS' then begin
                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."COMMISSIONS FOR NRC BUSINESS", WorkDate(), true);
                                                        end else
                                                            if Rec."Department SubType" = 'NACECE RESOURCE CENTER' then begin
                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."NACECE RESOURCE CENTER", WorkDate(), true);
                                                            end;
    end;

    procedure TechnicalServicesNos(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    begin
        MemoNosSetup.Get();

        // Check if the Department SubType matches and assign the appropriate document number
        if Rec."Department SubType" = 'TECHNICAL SERVICES POLICY' then begin
            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."TECHNICAL SERVICES POLICY", WorkDate(), true);
        end else
            if Rec."Department SubType" = 'TECHNICAL SERVICES MATTER 1' then begin
                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."TECHNICAL SERVICES MATTER 1", WorkDate(), true);
            end else
                if Rec."Department SubType" = 'HIRE OF OB VAN' then begin
                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."HIRE OF OB VAN", WorkDate(), true);
                end else
                    if Rec."Department SubType" = 'INSTALLATION OF EQUIPMENTS' then begin
                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."INSTALLATION OF EQUIPMENTS", WorkDate(), true);
                    end else
                        if Rec."Department SubType" = 'HIRE OF EMS TECHNICAL EQUIPMENT' then begin
                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."HIRE OF EMS TECHNICAL EQUIPMENT", WorkDate(), true);
                        end else
                            if Rec."Department SubType" = 'REQUEST FOR USE OF EMS FACILITIES' then begin
                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."REQUEST FOR USE OF EMS FACILITIES", WorkDate(), true);
                            end else
                                if Rec."Department SubType" = 'REQUISITIONS FOR EMS TECHNICAL EQUIPMENT' then begin
                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."REQUISITIONS FOR EMS TECHNICAL EQUIPMENT", WorkDate(), true);
                                end else
                                    if Rec."Department SubType" = 'ELECTRONIC LEARNING POLICY' then begin
                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."ELECTRONIC LEARNING POLICY", WorkDate(), true);
                                    end else
                                        if Rec."Department SubType" = 'E-LEARNING CONSULTANCY SERVICES' then begin
                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."E-LEARNING CONSULTANCY SERVICES", WorkDate(), true);
                                        end else
                                            if Rec."Department SubType" = 'ELIMIKA' then begin
                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."ELIMIKA", WorkDate(), true);
                                            end else
                                                if Rec."Department SubType" = 'E-LEARNING' then begin
                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."E-LEARNING", WorkDate(), true);
                                                end else
                                                    if Rec."Department SubType" = 'DIGITAL CONTENT DEVELOPMENT' then begin
                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."DIGITAL CONTENT DEVELOPMENT", WorkDate(), true);
                                                    end else
                                                        if Rec."Department SubType" = 'PROGRAMMING POLICY' then begin
                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PROGRAMMING POLICY", WorkDate(), true);
                                                        end else
                                                            if Rec."Department SubType" = 'PROGRAMMING MATTER 1' then begin
                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PROGRAMMING MATTER 1", WorkDate(), true);
                                                            end else
                                                                if Rec."Department SubType" = 'DIGITAL BROADCAST CHANNEL' then begin
                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."DIGITAL BROADCAST CHANNEL", WorkDate(), true);
                                                                end else
                                                                    if Rec."Department SubType" = 'EDU-CHANNEL GENERALITIES' then begin
                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."EDU-CHANNEL GENERALITIES", WorkDate(), true);
                                                                    end else
                                                                        if Rec."Department SubType" = 'EDU-CHANNEL PROGRAMMING' then begin
                                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."EDU-CHANNEL PROGRAMMING", WorkDate(), true);
                                                                        end else
                                                                            if Rec."Department SubType" = 'ICT POLICY' then begin
                                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."ICT POLICY", WorkDate(), true);
                                                                            end else
                                                                                if Rec."Department SubType" = 'CURRICULUM INNOVATION CENTRE' then begin
                                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."CURRICULUM INNOVATION CENTRE", WorkDate(), true);
                                                                                end else
                                                                                    if Rec."Department SubType" = 'PROJECT 1' then begin
                                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PROJECT 1", WorkDate(), true);
                                                                                    end else
                                                                                        if Rec."Department SubType" = 'REQUISITIONS FOR ICT HARDWARE/INFRASTRUCTURE' then begin
                                                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."REQUISITIONS FOR ICT HARDWARE/INFRASTRUCTURE", WorkDate(), true);
                                                                                        end else
                                                                                            if Rec."Department SubType" = 'REPAIR AND MAINTENANCE OF ICT HARDWARE/INFRASTRUCTURE' then begin
                                                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."REPAIR AND MAINTENANCE OF ICT HARDWARE/INFRASTRUCTURE", WorkDate(), true);
                                                                                            end else
                                                                                                if Rec."Department SubType" = 'MANAGEMENT INFORMATION SYSTEMS' then begin
                                                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."MANAGEMENT INFORMATION SYSTEMS", WorkDate(), true);
                                                                                                end else
                                                                                                    if Rec."Department SubType" = 'KIE WEBSITE' then begin
                                                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."KIE WEBSITE", WorkDate(), true);
                                                                                                    end else
                                                                                                        if Rec."Department SubType" = 'SOFTWARE LICENCES' then begin
                                                                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SOFTWARE LICENCES", WorkDate(), true);
                                                                                                        end;
    end;

    procedure SecondaryNos(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    begin
        MemoNosSetup.Get();

        // Check if the Department SubType matches and assign the appropriate document number
        if Rec."Department SubType" = 'SECONDARY EDUCATION COURSE PANEL' then begin
            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY EDUCATION COURSE PANEL", WorkDate(), true);
        end else
            if Rec."Department SubType" = 'SECONDARY ALTERNATIVE CURRICULUM' then begin
                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY ALTERNATIVE CURRICULUM", WorkDate(), true);
            end else
                if Rec."Department SubType" = 'SECONDARY ENGLISH PANEL CORRESPONDENCE' then begin
                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY ENGLISH PANEL CORRESPONDENCE", WorkDate(), true);
                end else
                    if Rec."Department SubType" = 'SECONDARY KISWAHILI PANEL CORRESPONDENCE' then begin
                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY KISWAHILI PANEL CORRESPONDENCE", WorkDate(), true);
                    end else
                        if Rec."Department SubType" = 'SECONDARY GERMAN PANEL CORRESPONDENCE' then begin
                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY GERMAN PANEL CORRESPONDENCE", WorkDate(), true);
                        end else
                            if Rec."Department SubType" = 'SECONDARY FRENCH PANEL CORRESPONDENCE' then begin
                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY FRENCH PANEL CORRESPONDENCE", WorkDate(), true);
                            end else
                                if Rec."Department SubType" = 'SECONDARY ARABIC PANEL CORRESPONDENCE' then begin
                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY ARABIC PANEL CORRESPONDENCE", WorkDate(), true);
                                end else
                                    if Rec."Department SubType" = 'SECONDARY CHINESE PANEL CORRESPONDENCE' then begin
                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY CHINESE PANEL CORRESPONDENCE", WorkDate(), true);
                                    end else
                                        if Rec."Department SubType" = 'SECONDARY MATHEMATICS PANEL CORRESPONDENCE' then begin
                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY MATHEMATICS PANEL CORRESPONDENCE", WorkDate(), true);
                                        end else
                                            if Rec."Department SubType" = 'SECONDARY PHYSICS PANEL CORRESPONDENCE' then begin
                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY PHYSICS PANEL CORRESPONDENCE", WorkDate(), true);
                                            end else
                                                if Rec."Department SubType" = 'SECONDARY BIOLOGY PANEL CORRESPONDENCE' then begin
                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY BIOLOGY PANEL CORRESPONDENCE", WorkDate(), true);
                                                end else
                                                    if Rec."Department SubType" = 'SECONDARY AGRICULTURE PANEL CORRESPONDENCE' then begin
                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY AGRICULTURE PANEL CORRESPONDENCE", WorkDate(), true);
                                                    end else
                                                        if Rec."Department SubType" = 'SECONDARY HOMESCIENCE PANEL CORRESPONDENCE' then begin
                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY HOMESCIENCE PANEL CORRESPONDENCE", WorkDate(), true);
                                                        end else
                                                            if Rec."Department SubType" = 'SECONDARY COMPUTER STUDIES PANEL' then begin
                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY COMPUTER STUDIES PANEL", WorkDate(), true);
                                                            end else
                                                                if Rec."Department SubType" = 'SECONDARY MUSIC PANEL CORRESPONDENCE' then begin
                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY MUSIC PANEL CORRESPONDENCE", WorkDate(), true);
                                                                end else
                                                                    if Rec."Department SubType" = 'SECONDARY ART AND DESIGN PANEL CORRESPONDENCE' then begin
                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY ART AND DESIGN PANEL CORRESPONDENCE", WorkDate(), true);
                                                                    end else
                                                                        if Rec."Department SubType" = 'SECONDARY BUSINESS STUDIES PANEL' then begin
                                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY BUSINESS STUDIES PANEL", WorkDate(), true);
                                                                        end else
                                                                            if Rec."Department SubType" = 'SECONDARY GEOGRAPHY PANEL CORRESPONDENCE' then begin
                                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY GEOGRAPHY PANEL CORRESPONDENCE", WorkDate(), true);
                                                                            end else
                                                                                if Rec."Department SubType" = 'SECONDARY HISTORY PANEL CORRESPONDENCE' then begin
                                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY HISTORY PANEL CORRESPONDENCE", WorkDate(), true);
                                                                                end else
                                                                                    if Rec."Department SubType" = 'SECONDARY CRE PANEL CORRESPONDENCE' then begin
                                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY CRE PANEL CORRESPONDENCE", WorkDate(), true);
                                                                                    end else
                                                                                        if Rec."Department SubType" = 'SECONDARY IRE PANEL CORRESPONDENCE' then begin
                                                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY IRE PANEL CORRESPONDENCE", WorkDate(), true);
                                                                                        end else
                                                                                            if Rec."Department SubType" = 'SECONDARY HRE PANEL CORRESPONDENCE' then begin
                                                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY HRE PANEL CORRESPONDENCE", WorkDate(), true);
                                                                                            end else
                                                                                                if Rec."Department SubType" = 'SECONDARY PHYSICAL SCIENCES PANEL' then begin
                                                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY PHYSICAL SCIENCES PANEL", WorkDate(), true);
                                                                                                end else
                                                                                                    if Rec."Department SubType" = 'SECONDARY CHEMISTRY PANEL CORRESPONDENCE' then begin
                                                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY CHEMISTRY PANEL CORRESPONDENCE", WorkDate(), true);
                                                                                                    end else
                                                                                                        if Rec."Department SubType" = 'SECONDARY PE PANEL CORRESPONDENCE' then begin
                                                                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY PE PANEL CORRESPONDENCE", WorkDate(), true);
                                                                                                        end else
                                                                                                            if Rec."Department SubType" = 'SECONDARY WOODWORK PANEL CORRESPONDENCE' then begin
                                                                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY WOODWORK PANEL CORRESPONDENCE", WorkDate(), true);
                                                                                                            end else
                                                                                                                if Rec."Department SubType" = 'SECONDARY METALWORK PANEL CORRESPONDENCE' then begin
                                                                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY METALWORK PANEL CORRESPONDENCE", WorkDate(), true);
                                                                                                                end else
                                                                                                                    // if Rec."Department SubType" = 'SECONDARY BUILDING AND CONSTRUCTION PANEL' then begin
                                                                                                                    //     Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY BUILDING AND CONSTRUCTION PANEL", WorkDate(), true);
                                                                                                                    // end else
                                                                                                                    if Rec."Department SubType" = 'SECONDARY AVIATION PANEL CORRESPONDENCE' then begin
                                                                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY AVIATION PANEL CORRESPONDENCE", WorkDate(), true);
                                                                                                                    end else
                                                                                                                        if Rec."Department SubType" = 'SECONDARY POWER MECHANICS PANEL' then begin
                                                                                                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY POWER MECHANICS PANEL", WorkDate(), true);
                                                                                                                        end else
                                                                                                                            if Rec."Department SubType" = 'SECONDARY ELECTRICITY PANEL CORRESPONDENCE' then begin
                                                                                                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY ELECTRICITY PANEL CORRESPONDENCE", WorkDate(), true);
                                                                                                                            end else
                                                                                                                                if Rec."Department SubType" = 'SECONDARY DRAWING AND DESIGN PANEL' then begin
                                                                                                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY DRAWING AND DESIGN PANEL", WorkDate(), true);
                                                                                                                                end else
                                                                                                                                    if Rec."Department SubType" = 'SECONDARY GENERAL SCIENCE PANEL' then begin
                                                                                                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."SECONDARY GENERAL SCIENCE PANEL", WorkDate(), true);
                                                                                                                                    end;
    end;


    procedure ConsultancyNos(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    begin
        MemoNosSetup.Get();

        // Check if the Department SubType matches and assign the appropriate document number
        if Rec."Department SubType" = 'CONSULTANCY SERVICES' then begin
            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."CONSULTANCY SERVICES", WorkDate(), true);
        end else
            if Rec."Department SubType" = 'KENYA PORTS AUTHORITY BANDARI COLLEGE' then begin
                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."KENYA PORTS AUTHORITY BANDARI COLLEGE", WorkDate(), true);
            end else
                if Rec."Department SubType" = 'KENYA INSTITUTE OF BANKERS' then begin
                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."KENYA INSTITUTE OF BANKERS", WorkDate(), true);
                end else
                    if Rec."Department SubType" = 'PUBLIC PROCUREMENT OVERSIGHT AUTHORITY' then begin
                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PUBLIC PROCURENET OVERSIGHT AUTHORITY", WorkDate(), true);
                    end else
                        if Rec."Department SubType" = 'KENYA WILDLIFE SERVICES' then begin
                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."KENYA WILDLIFE SERVICES", WorkDate(), true);
                        end else
                            if Rec."Department SubType" = 'COMPUTER FOR SCHOOLS' then begin
                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."COMPUTER FOR SCHOOLS", WorkDate(), true);
                            end else
                                if Rec."Department SubType" = 'KENYA PRISONS' then begin
                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."KENYA PRISONS", WorkDate(), true);
                                end else
                                    if Rec."Department SubType" = 'KENYA POLICE SERVICE' then begin
                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."KENYA POLICE SERVICE", WorkDate(), true);
                                    end else
                                        if Rec."Department SubType" = 'YOUTH POLYTECHNIC PROGRAMMES' then begin
                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."YOUTH POLYTECHNIC PROGRAMMES", WorkDate(), true);
                                            // end else
                                            // if Rec."Department SubType" = 'DIRECTORATE OF OCCUPATIONAL SAFETY AND HEALTH SERVICES' then begin
                                            //     Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."DIRECTORATE OF OCCUPATIONAL SAFETY AND HEALTHSERVICES", WorkDate(), true);
                                        end;
    end;

    procedure PreprimaryprimaryNos(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    begin
        MemoNosSetup.Get();

        // Check if the Department SubType matches and assign the appropriate document number
        if Rec."Department SubType" = 'MATTER 1' then begin
            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."MATTER 1", WorkDate(), true);
        end else
            if Rec."Department SubType" = 'PRIMARY ENGLISH PANEL CORRESPONDENCE' then begin
                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PRIMARY ENGLISH PANEL CORRESPONDENCE", WorkDate(), true);
            end else
                if Rec."Department SubType" = 'PRIMARY KISWAHILI PANEL CORRESPONDENCE' then begin
                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PRIMARY KISWAHILI PANEL CORRESPONDENCE", WorkDate(), true);
                end else
                    if Rec."Department SubType" = 'PRIMARY MATHEMATICS PANEL CORRESPONDENCE' then begin
                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PRIMARY MATHEMATICS PANEL CORRESPONDENCE", WorkDate(), true);
                    end else
                        if Rec."Department SubType" = 'PRIMARY SCIENCE PANEL CORRESPONDENCE' then begin
                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PRIMARY SCIENCE PANEL CORRESPONDENCE", WorkDate(), true);
                        end else
                            if Rec."Department SubType" = 'PRIMARY CRE PANEL CORRESPONDENCE' then begin
                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PRIMARY CRE PANEL CORRESPONDENCE", WorkDate(), true);
                            end else
                                if Rec."Department SubType" = 'PRIMARY HINDU R E PANEL CORRESPONDENCE' then begin
                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PRIMARY HINDU R E PANEL CORRESPONDENCE", WorkDate(), true);
                                end else
                                    if Rec."Department SubType" = 'PRIMARY SOCIAL STUDIES PANEL CORRESPONDENCE' then begin
                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PRIMARY SOCIAL STUDIES PANEL CORRESPONDENCE", WorkDate(), true);
                                    end else
                                        if Rec."Department SubType" = 'PRIMARY ISLAMIC R E PANEL CORRESPONDENCE' then begin
                                            Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PRIMARY ISLAMIC R E PANEL CORRESPONDENCE", WorkDate(), true);
                                        end else
                                            if Rec."Department SubType" = 'PRIMARY CREATIVE ARTS PANEL CORRESPONDENCE' then begin
                                                Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PRIMARY CREATIVE ARTS PANEL CORRESPONDENCE", WorkDate(), true);
                                            end else
                                                if Rec."Department SubType" = 'PRIMARY MOTHERTONGUE PANEL CORRESPONDENCE' then begin
                                                    Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PRIMARY MOTHERTONGUE PANEL CORRESPONDENCE", WorkDate(), true);
                                                end else
                                                    if Rec."Department SubType" = 'PRIMARY P.E PANEL CORRESPONDENCE' then begin
                                                        Rec."Document No" := NoSeriesManagement.GetNextNo(MemoNosSetup."PRIMARY P.E PANEL CORRESPONDENCE", WorkDate(), true);
                                                    end;
    end;




    procedure ChangeDocumentNo(GeneralCorrespondenceHeader: Record "General Correspondence Header")
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.Reset();
        UserSetup.SetRange("User ID", UserId);
        UserSetup.SetRange("Update Memo Nos", true);
        if UserSetup.Find('-') then begin
            ChangeMemoNos := true;
        end
    end;

}
