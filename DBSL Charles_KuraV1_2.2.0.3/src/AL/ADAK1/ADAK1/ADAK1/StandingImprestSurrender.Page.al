#pragma warning disable AA0005, AA0008, AL0603,AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57159 "Standing Imprest Surrender"
{
    PageType = Card;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const("Standing Imprest Surrender"),
                            Posted = const(false));
    // UsageCategory = Tasks;
    ApplicationArea = Basic;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field(BankAccount; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Account';
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Bank Account field.';
                    Visible = false;
                }
                field(BankName; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                    Visible = false;
                }
                field(SurrenderNarrations; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Surrender Narrations';
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Surrender Narrations field.';
                }
                field(ShortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field(DepartmentName; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field(ShortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field(Job; Rec.JobNo)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Job field.';
                }
                field(JobTaskNo; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Job Task No field.';
                }
                field(JobName; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Name field.';
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Currency field.';
                }
                field(TotalAmount; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                // field("Standing Imprest Limit"; Rec."Standing Imprest Limit")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Standing Imprest Amount';
                // }
                field("Standing Imprest Limit"; Rec."Standing Imprest Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Standing Imprest Amount';
                }
                field("Actual Spent"; Rec."Actual Amount Spent")
                {
                    ToolTip = 'Specifies the value of the Actual Amount Spent field.';

                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Amount field.';
                }
                field("Amount Spent"; Rec."Amount Spent")
                {
                    ToolTip = 'Specifies the value of the Amount Spent field.', Comment = '%';
                }
                field("Receipt Amount"; Rec."Receipt Amount")
                {
                    ToolTip = 'Specifies the value of the Receipt Amount field.', Comment = '%';
                }
                field("Imprest Remaining Amount"; Rec."Imprest Remaining Amount")
                {
                    ToolTip = 'Specifies the value of the Imprest Remaining Amount field.', Comment = '%';
                }
                field("Imprest Issue Doc. No"; Rec."Standing Imprest Issue Doc. No")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Imprest Issue Doc. No field.';
                    // trigger OnValidate()
                    // begin
                    //     CurrPage.Update(false);
                    // end;
                    trigger OnValidate()
                    begin
                        CurrPage.Update(false);
                        //  CopyLinksFromRequisition(Rec."Imprest Issue Doc. No");
                    end;

                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Reference No. field.';
                    trigger OnValidate()
                    begin
                        CurrPage.Update(false);
                        // CopyLinksFromRequisition(Rec."Reference No.");
                    end;
                }
                field(PostingDate; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    //Visible = false;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field(PostedBy; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field(PostedDate; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posted Date field.';
                }
            }
            part(Control1000000021; "Standing Surrender Lines")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = No = field("No.");
            }

        }
        area(factboxes)
        {
            systempart(Control1000000019; Notes)
            {
            }
            systempart(Control1000000020; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(PaymentVoucher)
            {
                Caption = 'Payment Voucher';
                Image = "Order";
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(56000),
                                  "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
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
            }
        }
        area(processing)
        {
            group(Functions)
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;
                    ToolTip = 'Executes the Send A&pproval Request action.';

                    trigger OnAction()
                    var
                        Var_Varaint: Variant;
                        CustomApprovalMgt: Codeunit "Custom Approvals Codeunit";
                    begin


                        // Rec.TestField(Rec.Job);
                        // Rec.TestField(Rec."Job Task No");
                        //Rec.TestField(Rec."Paying Bank Account");
                        Rec.TestField(Rec.Date);
                        Rec.TestField(Status, Rec.Status::Open);

                        //if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                        // ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
                        Var_Varaint := Rec;
                        if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(Var_Varaint) then
                            CustomApprovalMgt.OnSendDocForApproval(Var_Varaint);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovalsMgt: Codeunit "Custom Approvals Codeunit";
                    begin
                        //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                        Rec.TestField(Status, Rec.Status::"Pending Approval");
                        VarVariant := Rec;
                        CustomApprovalsMgt.OnCancelDocApprovalRequest(VarVariant);
                        rec.Status := rec.status::Open;
                    end;
                }
                separator(Action1000000043)
                {
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action(Action1000000040)
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the &Print action.';

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);


                        Rec.SetRange(Rec."No.", Rec."No.");
                        Report.Run(59098, true, true, Rec)
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Action1000000038)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    Visible = false;
                    ToolTip = 'Executes the Re&lease action.';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    Visible = false;
                    ToolTip = 'Executes the Re&open action.';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualReopen(Rec);
                        //ReleasePurchDoc.ReopenPV(Rec);
                    end;
                }
                separator(Action1000000036)
                {
                }
            }
            group(Posting)
            {
                Caption = 'P&osting';
                Image = Post;
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    ToolTip = 'Executes the P&ost action.';

                    trigger OnAction()
                    var
                        StandImpLimit: Record "Standing Imprest Limit";
                        RemainingAmount: Decimal;
                    begin
                        Rec.TestField(Rec."Paying Bank Account");
                        if (Rec.Status = Rec.Status::Released) then begin
                            //PaymentsPost.PostStandingImprestSurrenders(Rec)
                            PaymentsPost."Post StandingImprestSurrender"(Rec);
                        end else
                            Error('This document must be approved first');

                        //Create Reimbursment
                        Rec.CalcFields("Imprest Remaining Amount");
                        Rec.CalcFields("Amount Spent");
                        if Rec.Posted = true then begin
                            //if RemainingAmount > 0 then begin
                            if Confirm('Are you sure you want to create Standing Imprest Requisition (Reimbursement)?', false) = true then begin
                                CashMgt.Get;
                                //Insert Staff Claim Header
                                ObjPayments.Init;
                                ObjPayments.TransferFields(Rec);
                                ObjPayments."No." := NoSeriesManagement.GetNextNo(CashMgt."Standing Imprest Nos", Today, true);
                                ObjPayments."Document Type" := ObjPayments."document type"::"Standing Imprest";
                                ObjPayments."Payment Type" := ObjPayments."Payment Type"::"Standing Imprest";
                                ObjPayments.Date := Today;
                                ObjPayments."Account Type" := ObjPayments."Account Type"::Employee;
                                ObjPayments."Account No." := Rec."Account No.";
                                ObjPayments.Validate("Account No.");
                                ObjPayments.Posted := false;
                                ObjPayments.Status := ObjPayments.Status::Released;
                                ObjPayments."Payment Narration" := 'Reimbursment of standing Imprest';
                                ObjPayments.Job := CashMgt."Current Budget";
                                ObjPayments."Job Task No" := CashMgt."StandingImprest Posting Group";
                                ObjPayments."Posted By" := '';
                                ObjPayments."Imprest Issue Doc. No" := '';
                                ObjPayments."Shortcut Dimension 1 Code" := Rec."Shortcut Dimension 1 Code";
                                ObjPayments."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                                //ObjPayments."Posted Date" := 0D;
                                ObjPayments.Insert(true);

                                //Insert Staff Claim Lines

                                // StandImprestLines.Reset;
                                // StandImprestLines.SetRange(StandImprestLines.No, Rec."No.");
                                // if StandImprestLines.FindSet(true) then
                                //     repeat
                                //         ObjPVLines.Init;
                                //         //ObjPVLines.TRANSFERFIELDS(ImprestLines);
                                //         ObjPVLines.No := ObjPayments."No.";
                                //         ObjPVLines."Line No" := ObjPVLines.Count + 1;
                                //         ObjPVLines."Document Type" := ObjPVLines."Document Type"::"Standing Imprest";
                                //         ObjPVLines."Account Type" := ObjPVLines."Account Type"::"G/L Account";
                                //         //ObjPVLines."Account No" := ObjPVLines.
                                //         ObjPVLines."Account No" := StandImprestLines."Account No";
                                //         ObjPVLines.Validate("Account No");
                                //         ObjPVLines.Amount := StandImprestLines."Actual Amount Spent";
                                //         ObjPVLines.Validate(Amount);
                                //         Message(Format(ObjPVLines.Amount));
                                //         //ObjPVLines."Type of Expense" := StandImprestLines.Type;
                                //         //ObjPVLines.Description := PVLines."Transaction Name";
                                //         ObjPVLines.Insert(true);
                                //     until StandImprestLines.Next = 0;

                                //
                                ObjPVLines.Init;
                                ObjPVLines.No := ObjPayments."No.";
                                ObjPVLines."Line No" := 10000;
                                ObjPVLines."Document Type" := ObjPVLines."Document Type"::"Standing Imprest";
                                ObjPVLines."Account Type" := ObjPVLines."Account Type"::"G/L Account";
                                ObjPVLines."Account No" := CashMgt."Standing Imprest Account No";
                                ObjPVLines.Validate("Account No");
                                ObjPVLines.Description := 'Standing Imprest Reimbursment';
                                ObjPVLines.Amount := Rec."Amount Spent";
                                ObjPVLines.Validate(Amount);
                                ObjPVLines.Insert(true);


                            end
                            else
                                exit;
                            Message('Standing Imprest Requisition  %1 of amount %2 successfully created', ObjPayments."No.", Abs(Rec."Imprest Remaining Amount"));
                            //Email Notification
                            SendReimbursementNotification(Rec."Account No.", ObjPayments."No.");
                            //end;
                        end;
                        CurrPage.Close();
                    end;
                }
                action(Approve)
                {
                    ApplicationArea = Basic;
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = New;
                    ToolTip = 'Executes the Approve action.';
                }
                action(Reject)
                {
                    ApplicationArea = Basic;
                    Image = Reject;
                    ToolTip = 'Executes the Reject action.';
                }
                action(Delegate)
                {
                    ApplicationArea = Basic;
                    Image = Delegate;
                    ToolTip = 'Executes the Delegate action.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Standing Imprest Surrender";
        Rec."Document Type" := Rec."document type"::"Standing Imprest Surrender";
        Rec."Interim Standing Imprest" := false;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        PaymentsPost: Codeunit "Payments-Post";
        CashMgt: Record "Cash Management Setup";
        ObjPayments: Record payments;
        NoSeriesManagement: Codeunit "No. Series";
        StandImprestLines: Record "PV Lines";
        ObjPVLines: Record "PV Lines";


    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;


    local procedure SendReimbursementNotification(EmpNo: Code[20]; DocNo: Code[20])
    var
        Employee: Record Employee;
        SMTPMail: Codeunit "Email Message";
        Smail: Codeunit Email;
        SenderName: Text[250];
        Recipient: Text[250];
        Subject: Text[250];
        Body: Text[1000];
    begin
        SenderName := CompanyProperty.DisplayName;
        Employee.Reset();
        Employee.SetRange("No.", EmpNo);

        if Employee.FindSet() then
            repeat
                Recipient := Employee."Company E-Mail";
                Subject := 'Reimbursement Requisition Generated';
                Body :=
                    'Dear ' + Employee."First Name" + ' ' + Employee."Last Name" + '<br>' +
                    'A reimbursement requisition has been generated for document ' + DocNo + '.<br>' +
                    'Please login to the Employee Self Service Portal and initiate approvals.<br><br>' +
                    'Kind Regards,<br>' + CompanyProperty.DisplayName;

                SMTPMail.Create(Recipient, Subject, Body, true);
                Smail.Send(SMTPMail, Enum::"Email Scenario"::Default);
            until Employee.Next() = 0;
        message('Reimbursement notification Successful');
    end;

    procedure CalcUtilizedAmount(): Decimal
    var
        EmpLedgEntry: Record "Employee Ledger Entry";
        Total: Decimal;
    begin
        CashMgt.Get();
        Total := 0;
        EmpLedgEntry.Reset();
        EmpLedgEntry.SetRange("Employee No.", Rec."Account No.");
        EmpLedgEntry.SetRange("Imprest Document Type", EmpLedgEntry."Imprest Document Type"::"Standing Imprest");
        EmpLedgEntry.SetRange(Reversed, false);
        EmpLedgEntry.SetRange("Financial Year", CashMgt."Current Financial Year");

        if EmpLedgEntry.FindSet() then
            repeat
                EmpLedgEntry.CalcFields(Amount);
                Total += EmpLedgEntry.Amount;
            until EmpLedgEntry.Next() = 0;

        exit(Total);
    end;

    // local procedure CopyLinksFromRequisition(RequisitionNo: Code[20])
    // var
    //     SourceReq: Record payments;
    //     RecLink: Record "Record Link";
    //     ExistingLink: Record "Record Link";
    //     NewLink: Record "Record Link";
    // begin
    //     if RequisitionNo = '' then
    //         exit;

    //     SourceReq.Reset();
    //     SourceReq.SetRange("No.", RequisitionNo);
    //     SourceReq.SetRange(Posted, true);
    //     SourceReq.SetRange("Payment Type", SourceReq."Payment Type"::"Standing Imprest");

    //     if not SourceReq.FindFirst() then
    //         exit;

    //     RecLink.Reset();
    //     RecLink.SetRange("Record ID", SourceReq.RecordId);

    //     if not RecLink.FindSet() then
    //         exit;

    //     repeat
    //         ExistingLink.Reset();
    //         ExistingLink.SetRange("Record ID", Rec.RecordId);
    //         ExistingLink.SetRange(URL1, RecLink.URL1);

    //         if not ExistingLink.FindFirst() then begin
    //             NewLink.Init();
    //             NewLink."Record ID" := Rec.RecordId;
    //             NewLink.URL1 := RecLink.URL1;
    //             NewLink.Company := RecLink.Company;
    //             NewLink.Description := RecLink.Description;
    //             NewLink."User ID" := UserId;
    //             NewLink.Created := CurrentDateTime;
    //             NewLink.Type := RecLink.Type;
    //             if NewLink.Insert(true) then;
    //         end;
    //     until RecLink.Next() = 0;

    //     Message('Links copied from %1', RequisitionNo);
    // end;
}