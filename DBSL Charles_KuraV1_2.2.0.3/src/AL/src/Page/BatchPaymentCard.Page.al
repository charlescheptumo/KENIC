#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95318 "Batch Payment Card"
{
    PageType = Card;
    SourceTable = "Bank Payments Batching";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'General Details';
                field("Batch No"; Rec."Batch No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Batch No field.';
                }
                field("Description/Remarks"; Rec."Description/Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description/Remarks field.';
                }
                field("Prepared By"; Rec."Prepared By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Prepared By field.';
                }
                field("Total PV Lines"; Rec."Total PV Lines")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total PV Lines field.';
                }
                field("Total Approved Lines"; Rec."Total Approved Lines")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Approved Lines field.';
                }
                field("Total Approved Amount"; Rec."Total Approved Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Approved Amount field.';
                }
                field("Payment File Generated"; Rec."Payment File Generated")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payment File Generated field.';
                }
                field("File Sent to Bank"; Rec."File Sent to Bank")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the File Sent to Bank field.';
                }
                field("Payment Processed"; Rec."Payment Processed")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payment Processed field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Date Sent to Bank"; Rec."Date Sent to Bank")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Sent to Bank field.';
                }
                field("Date Processed"; Rec."Date Processed")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Processed field.';
                }
                field("Approval  Status"; Rec."Approval  Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval  Status field.';
                }
                field("Enter OTP"; Rec."Enter OTP")
                {
                    ApplicationArea = Basic;
                    Caption = 'OTP';
                    ToolTip = 'Specifies the value of the OTP field.';
                }
            }
            part(Control11; "Batch Payment Lines")
            {
                SubPageLink = "Batch No" = field("Batch No");
            }
        }
    }

    actions
    {
        area(creation)
        {
            group(ActionGroup14)
            {
                action(ResendOTP)
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the ResendOTP action.';

                    // trigger OnAction()
                    // begin
                    //     ApprovalEntry.Reset;
                    //     ApprovalEntry.SetRange("Document Type",ApprovalEntry."document type"::"45");
                    //     ApprovalEntry.SetRange("Document No.","Batch No");
                    //     ApprovalEntry.SetRange(ApprovalEntry.Status,ApprovalEntry.Status::Open);
                    //     if ApprovalEntry.FindFirst() then begin
                    //       ApprovalEntry."OTP Status":=ApprovalEntry."otp status"::"1";
                    //       ApprovalEntry.Modify();
                    //       Message('OTP Sent');
                    //     end;
                    // end;
                }
                action("Bank Payment Report")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Bank Payment Report action.';

                    trigger OnAction()
                    begin
                        Rec.SetRange("Batch No", Rec."Batch No");
                        Report.Run(72044, true, true, Rec);
                    end;
                }
                action("Generate Bank Payment File")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send to Bank';
                    Image = CashFlow;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Send to Bank action.';

                    trigger OnAction()
                    begin
                        if not (Rec."Approval  Status" = Rec."approval  status"::Approved) then
                            Error('Document has not been approved, you cannot generate payment file');
                        if Confirm('Do you want to generate Bank Payment file for Batch No. %1, you will not be able to edit the document after generating the payment file', false, Rec."Batch No") = false then exit;

                        if Rec."Payment File Generated" then
                            Error('Payment file has already been generated');

                        KCBPaymentLines.Reset;
                        KCBPaymentLines.SetRange("Batch No", Rec."Batch No");
                        KCBPaymentLines.SetRange(Approved, true);
                        if KCBPaymentLines.Find('-') then begin
                            //   QuickPayIntegration.GeneratePaymentFile("Batch No");
                            Rec."Payment File Generated" := true;
                        end
                        else
                            Error('No payment Lines selected');

                        Message('Bank payment file generated succesfully');
                    end;
                }
            }
            group(ActionGroup29)
            {
                Caption = 'Approvals';
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
                        //Generate Payment Lines

                        GeneratePaymentLines();

                        KCBPaymentLines.Reset;
                        KCBPaymentLines.SetRange("Batch No", Rec."Batch No");
                        if not KCBPaymentLines.FindFirst() then begin
                            Error('Generate Payment Lines before sending document for approval');
                        end;

                        //if ApprovalsMgmt.CheckBPaymentReqApprovalPossible(Rec) then
                        //   ApprovalsMgmt.OnSendBPaymentReqForApproval(Rec);
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
                        //  ApprovalsMgmt.OnCancelBPaymentReqApprovalRequest(Rec);
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
                        // ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                    end;
                }
                action(Approve)
                {
                    ApplicationArea = Basic;
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Approve action.';

                    trigger OnAction()
                    var
                        lastApprover: Boolean;
                    begin
                        ApprovalEntry.Reset;
                        ApprovalEntry.SetCurrentkey("Sequence No.");
                        ApprovalEntry.SetAscending("Sequence No.", true);
                        ApprovalEntry.SetRange("Document No.", Rec."Batch No");
                        if ApprovalEntry.FindLast() then begin
                            if ApprovalEntry."Approver ID" = UserId then begin


                                //Update Flag
                                lastApprover := true;

                                BankPaymentsBatchingLines.Reset;
                                BankPaymentsBatchingLines.SetRange("Batch No", Rec."Batch No");
                                BankPaymentsBatchingLines.SetRange(Approve, true);
                                if not BankPaymentsBatchingLines.FindFirst() then begin
                                    Error('You have not selected any lines, kindly tick the check box for the lines you would like to approve under KCB Payment Lines');
                                end;
                            end;
                        end;
                        if Rec."Enter OTP" <> Rec."OTP Verification" then
                            Error('Please Enter OTP received on E-Mail');


                        ///   ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);

                        Rec."Enter OTP" := '';

                        if lastApprover then begin

                            //MESSAGE('Begin');
                            BankPaymentsBatchingLines.Reset;
                            BankPaymentsBatchingLines.SetRange(BankPaymentsBatchingLines."Batch No", Rec."Batch No");
                            if BankPaymentsBatchingLines.Find('-') then begin
                                repeat

                                    BankPaymentsBatchingLines.Used := BankPaymentsBatchingLines.Approve;
                                    BankPaymentsBatchingLines.Modify();

                                //MESSAGE('Accesed');

                                until BankPaymentsBatchingLines.Next = 0;
                            end;

                        end;
                        Message('The batch %1 has been approved', Rec."Batch No");
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Basic;
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Reject action.';

                    trigger OnAction()
                    begin
                        BankPaymentsBatching.Reset;
                        BankPaymentsBatching.SetRange("Batch No", Rec."Batch No");
                        BankPaymentsBatching.SetRange("Approval  Status", BankPaymentsBatching."approval  status"::Approved);
                        if BankPaymentsBatching.FindFirst() then begin
                            Error('Document already approved.You cannot modify an approved document.');
                        end;
                        //ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Basic;
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Delegate action.';

                    trigger OnAction()
                    begin
                        BankPaymentsBatching.Reset;
                        BankPaymentsBatching.SetRange("Batch No", Rec."Batch No");
                        BankPaymentsBatching.SetRange("Approval  Status", BankPaymentsBatching."approval  status"::Approved);
                        if BankPaymentsBatching.FindFirst() then begin
                            Error('Document already approved.You cannot modify an approved document.');
                        end;
                        //   ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                    end;
                }
                action(Release)
                {
                    ApplicationArea = Basic;
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Release action.';

                    trigger OnAction()
                    begin
                        BankPaymentsBatching.Reset;
                        BankPaymentsBatching.SetRange("Batch No", Rec."Batch No");
                        BankPaymentsBatching.SetRange("Approval  Status", BankPaymentsBatching."approval  status"::Approved);
                        if BankPaymentsBatching.FindFirst() then begin
                            Error('Document already approved.You cannot modify an approved document.');
                        end;
                        Rec."Approval  Status" := Rec."approval  status"::Approved;
                        Rec.Modify();

                        Message('The batch %1 has been released successfully', Rec."Batch No");
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Basic;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Reopen action.';

                    trigger OnAction()
                    begin
                        Rec."Approval  Status" := Rec."approval  status"::Open;
                        Rec.Modify();

                        Message('The batch %1 has been reopened successfully', Rec."Batch No");
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        if not Rec."Payment File Generated" then
            Edittable := true;
    end;

    var
        KCBPaymentLines: Record "KCB Payment Lines";
        BankPaymentsBatchingLines: Record "Bank Payments Batching Lines";
        PVLines: Record "PV Lines";
        QuickPayIntegration: Codeunit "QuickPay Integration";
        Edittable: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        ApprovalEntry: Record "Approval Entry";
        BankPaymentsBatching: Record "Bank Payments Batching";

    local procedure GeneratePaymentLines()
    begin
        KCBPaymentLines.Reset;

        BankPaymentsBatchingLines.Reset();
        BankPaymentsBatchingLines.SetRange("Batch No", Rec."Batch No");
        BankPaymentsBatchingLines.SetFilter("Document No.", '<>%1', '');
        if BankPaymentsBatchingLines.FindSet() then begin

            KCBPaymentLines.SetRange("Batch No", BankPaymentsBatchingLines."Batch No");
            if KCBPaymentLines.Find('-') then begin
                KCBPaymentLines.DeleteAll;
            end;
            repeat

                PVLines.Reset;
                PVLines.SetRange(No, BankPaymentsBatchingLines."Document No.");
                if PVLines.Find('-') then begin
                    KCBPaymentLines.Init;
                    KCBPaymentLines.Entry := 0;
                    KCBPaymentLines.Trcode := '65';//PayMode
                    if BankPaymentsBatchingLines."Pay Mode" = 'EFT' then
                        KCBPaymentLines.Trcode := '26';//PayMode

                    KCBPaymentLines."pay Mode" := BankPaymentsBatchingLines."Pay Mode";
                    KCBPaymentLines.DrAccount := BankPaymentsBatchingLines."Source Bank Acc No.";// To come from header
                    KCBPaymentLines.DrName := BankPaymentsBatchingLines."Source Bank Acc Name";
                    KCBPaymentLines.DrBnkCode := '1100';
                    if PVLines."Payment Type" = PVLines."payment type"::"Bank Transfer" then begin
                        if PVLines."Account No" = '' then
                            Error('Bank Account No for ' + BankPaymentsBatchingLines."Document No." + ' is blank');
                        KCBPaymentLines.CrAccount := PVLines."Account No";
                    end
                    else
                        if PVLines."Payment Type" = PVLines."payment type"::"Payment Voucher" then begin
                            if PVLines."Payee Bank Account Number" = '' then
                                Error('Bank Account No for ' + BankPaymentsBatchingLines."Document No." + ' is blank');
                            KCBPaymentLines.CrAccount := PVLines."Payee Bank Account Number";
                        end;
                    KCBPaymentLines.CrName := PVLines."Account Name";
                    KCBPaymentLines.CrBnkCode := PVLines."Payee Bank Branch Code";
                    KCBPaymentLines.Reference := BankPaymentsBatchingLines."Document No." + '-' + Format(BankPaymentsBatchingLines."Entry No");
                    KCBPaymentLines.Amount := Format(ROUND(PVLines."Net Amount"));
                    KCBPaymentLines."Amount Decimal" := ROUND(PVLines."Net Amount");
                    KCBPaymentLines."Batch No" := BankPaymentsBatchingLines."Batch No";
                    KCBPaymentLines."Document No" := BankPaymentsBatchingLines."Document No.";
                    KCBPaymentLines."Payment Narration" := BankPaymentsBatchingLines."Payment Narration";
                    KCBPaymentLines.Insert;
                end;

            until BankPaymentsBatchingLines.Next() = 0;
        end;
    end;
}

