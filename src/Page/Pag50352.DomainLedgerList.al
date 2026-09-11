namespace KENIC.KENIC;
using Microsoft.Sales.Customer;
using Microsoft.Sales.Document;
using Microsoft.Sales.History;
using Microsoft.Sales.Posting;

page 50352 "Domain Ledger List"
{
    ApplicationArea = All;
    Caption = 'Domain Ledger Entries';
    PageType = List;
    SourceTable = "Domain Ledger Entry";
    UsageCategory = Administration;
    InsertAllowed = false;
    DeleteAllowed = true;
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                }
                field(DomainName; Rec.DomainName)
                {
                    ApplicationArea = All;
                }
                field(TransType; Rec.TransType)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field(Tax; Rec.Tax)
                {
                    ApplicationArea = All;
                }
                field(TaxContent; Rec.TaxContent)
                {
                    ApplicationArea = All;
                }
                field(Total; Rec.Total)
                {
                    ApplicationArea = All;
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = All;
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;
                }
                field(Created; Rec.Created)
                {
                    ApplicationArea = All;
                }
                field(DocumentNumber; Rec.DocumentNumber)
                {
                    ApplicationArea = All;
                }
                field(ClientRoid; Rec.ClientRoid)
                {
                    ApplicationArea = All;
                }
                field(DomainRoid; Rec.DomainRoid)
                {
                    ApplicationArea = All;
                }
                field(TLD; Rec.TLD)
                {
                    ApplicationArea = All;
                }
                field(RefundAmount; Rec.RefundAmount)
                {
                    ApplicationArea = All;
                }
                field(RefundExpiry; Rec.RefundExpiry)
                {
                    ApplicationArea = All;
                }
                field(RefundGrace; Rec.RefundGrace)
                {
                    ApplicationArea = All;
                }
                field(RefundForId; Rec.RefundForId)
                {
                    ApplicationArea = All;
                }
                field(ExDate; Rec.ExDate)
                {
                    ApplicationArea = All;
                }
                field(CreditTransactionId; Rec.CreditTransactionId)
                {
                    ApplicationArea = All;
                }
                field(ProcessorAccountHistoryId; Rec.ProcessorAccountHistoryId)
                {
                    ApplicationArea = All;
                }
                field(IsPicked; Rec.IsPicked)
                {
                    ApplicationArea = All;
                }
                field(InvoiceCreated; Rec.InvoiceCreated)
                {
                    ApplicationArea = All;
                }
                field(IsPrinted; Rec.IsPrinted)
                {
                    ApplicationArea = All;
                }
                field(IsFilled; Rec.IsFilled)
                {
                    ApplicationArea = All;
                }
                field(RenewalRefund; Rec.RenewalRefund)
                {
                    ApplicationArea = All;
                }
                field(TaxInclusive; Rec.TaxInclusive)
                {
                    ApplicationArea = All;
                }
                field(LedgerLoginUsername; Rec.LedgerLoginUsername)
                {
                    ApplicationArea = All;
                }
                field("Sales Invoice No."; Rec."Sales Invoice No.")
                {
                    ApplicationArea = All;
                }
                field("Credit Memo No."; Rec."Credit Memo No.")
                {
                    ApplicationArea = All;
                }
                field("External Sales Document No."; Rec."External Sales Document No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetDomainLedger)
            {
                ApplicationArea = All;
                Caption = 'Get Domain Ledger';
                Image = Refresh;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    DomainDialog: Page "Get Domain Ledger";
                begin
                    DomainDialog.RunModal();
                    CurrPage.Update(false);
                end;
            }
            action(ProcessSingle)
            {
                ApplicationArea = All;
                Caption = 'Process Single Transaction';
                Image = Refresh;
                Visible = false;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                end;
            }
            action(ProcessBatch)
            {
                ApplicationArea = All;
                Caption = 'Process Batch Transactions';
                Image = Refresh;
                Promoted = true;
                Visible = false;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin

                end;
            }
            action(BackfillDomainLedger)
            {
                ApplicationArea = All;
                Caption = 'Write To Domain Ledger';
                Image = Refresh;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    DomainLedgerSync: Codeunit "Custom Function";
                    SyncedCount: Integer;
                    TotalCount: Integer;
                begin
                    TotalCount := DomainLedgerSync.BackfillDomainLedgerEntries(SyncedCount);
                    CurrPage.Update(false);
                    Message('%1 unsynced posted document(s) checked. %2 new Domain Ledger Entries created.', TotalCount, SyncedCount);
                end;
            }
            action(CreateInvoice)
            {
                ApplicationArea = All;
                Caption = 'Create Invoice';
                Image = CreateInvoice;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    CMSetup: Record "Cash Management Setup";
                    Customer: Record Customer;
                    SalesHeader: Record "Sales Header";
                    NewSalesHeader: Record "Sales Header";
                    SalesLine: Record "Sales Line";
                    OldSalesLine: Record "Sales Line";
                    NewSalesLine: Record "Sales Line";
                    SalesInvoiceHeader: Record "Sales Invoice Header";
                    OrigLedgerEntry: Record "Domain Ledger Entry";
                    CorrectPostedSalesInvoice: Codeunit "Correct Posted Sales Invoice";
                    ItemNo: Code[20];
                    InvoiceNo: Code[20];
                    OriginalInvoiceNo: Code[20];
                    CreditMemoNo: Code[20];
                    TempDocType: Enum "Sales Document Type";
                    TempNo: Code[20];
                    DotCount: Integer;
                    RefundDeferralCode: Code[30];
                    RefundDomainLengthYears: Integer;
                    PostedSalesInvHeader: Record "Sales Invoice Header";
                    PostedSalesCrMemoHeader: Record "Sales Cr.Memo Header";
                begin
                    if not (Rec.TransType in ['Registration', 'Renewal', 'AutoRenewal', 'Access fee', 'Application', 'Restoration', 'Transfer', 'Refund']) then
                        Error('Create Invoice is not available for transaction type: %1.', Rec.TransType);

                    if Rec.InvoiceCreated then
                        Error('A document has already been created for this entry (%1).', Rec."Sales Invoice No.");

                    if Rec.TransType = 'Refund' then begin
                        if Rec.RefundForId = 0 then
                            Error('Refund For ID is not set on this entry. Cannot create credit memo.');

                        OriginalInvoiceNo := CopyStr(Format(Rec.RefundForId), 1, 20);
                        CreditMemoNo := CopyStr(Format(Rec.ID), 1, 20);

                        if not SalesInvoiceHeader.Get(OriginalInvoiceNo) then
                            Error('Cannot create credit memo. The original invoice %1 (Domain Ledger ID: %2) has not been posted yet. Please post the original invoice first before processing this refund.', OriginalInvoiceNo, Rec.RefundForId);

                        if NewSalesHeader.Get(NewSalesHeader."Document Type"::"Credit Memo", CreditMemoNo) then
                            Error('A Credit Memo with number %1 already exists.', CreditMemoNo);

                        if not OrigLedgerEntry.Get(Rec.RefundForId) then
                            Error('Original Domain Ledger Entry %1 was not found. Cannot determine deferral code for refund.', Rec.RefundForId);

                        CMSetup.Get();
                        RefundDeferralCode := '';
                        if OrigLedgerEntry.TransType in ['Renewal', 'AutoRenewal', 'Registration'] then begin
                            RefundDomainLengthYears := GetDomainLengthYears(OrigLedgerEntry.Created, OrigLedgerEntry.ExDate);
                            if RefundDomainLengthYears > 0 then
                                RefundDeferralCode := GetDeferralCode(OrigLedgerEntry.TransType, RefundDomainLengthYears, CMSetup);
                        end;

                        if not CorrectPostedSalesInvoice.CreateCreditMemoCopyDocument(SalesInvoiceHeader, SalesHeader) then
                            Error('Could not create credit memo for invoice %1. The invoice may be fully or partially applied.', OriginalInvoiceNo);

                        TempDocType := SalesHeader."Document Type";
                        TempNo := SalesHeader."No.";

                        OldSalesLine.Reset();
                        OldSalesLine.SetRange("Document Type", TempDocType);
                        OldSalesLine.SetRange("Document No.", TempNo);
                        if OldSalesLine.FindSet() then
                            repeat
                                NewSalesLine := OldSalesLine;
                                NewSalesLine."Document No." := CreditMemoNo;
                                NewSalesLine.Insert(false);
                            until OldSalesLine.Next() = 0;

                        OldSalesLine.Reset();
                        OldSalesLine.SetRange("Document Type", TempDocType);
                        OldSalesLine.SetRange("Document No.", TempNo);
                        OldSalesLine.DeleteAll(false);

                        NewSalesHeader := SalesHeader;
                        NewSalesHeader."No." := CreditMemoNo;
                        NewSalesHeader."Posting No." := CreditMemoNo;
                        NewSalesHeader."Posting No. Series" := '';
                        NewSalesHeader."No. Series" := '';
                        NewSalesHeader.Insert(false);

                        SalesHeader.Delete(false);

                        NewSalesHeader.Status := NewSalesHeader.Status::Released;
                        NewSalesHeader.Modify(true);

                        if RefundDeferralCode <> '' then begin
                            NewSalesLine.Reset();
                            NewSalesLine.SetRange("Document Type", NewSalesHeader."Document Type");
                            NewSalesLine.SetRange("Document No.", NewSalesHeader."No.");
                            NewSalesLine.SetRange(Type, NewSalesLine.Type::Item);
                            if NewSalesLine.FindSet() then
                                repeat
                                    NewSalesLine.Validate("Deferral Code", RefundDeferralCode);
                                    NewSalesLine.Modify(true);
                                until NewSalesLine.Next() = 0;
                        end;

                        Rec.InvoiceCreated := true;
                        Rec."Credit Memo No." := NewSalesHeader."No.";
                        Rec."Sales Invoice No." := NewSalesHeader."No.";

                        Rec.Modify();

                        Commit();

                        if not TryReleaseSalesInvoice(NewSalesHeader) then begin
                            Message('Credit Memo %1 was created but could not be released automatically: %2\Please release and post it manually.', CreditMemoNo, GetLastErrorText());
                            OpenSalesCreditMemo(NewSalesHeader);
                        end else
                            if not TryPostSalesInvoice(NewSalesHeader) then begin
                                Message('Credit Memo %1 was released but could not be posted automatically: %2\Please post it manually.', CreditMemoNo, GetLastErrorText());
                                OpenSalesCreditMemo(NewSalesHeader);
                            end else begin
                                if PostedSalesCrMemoHeader.Get(CreditMemoNo) then begin
                                    PostedSalesCrMemoHeader."Domain Ledger Synced" := true;
                                    PostedSalesCrMemoHeader.Modify();
                                end;
                                Message('Credit Memo %1 created and posted successfully for %2 (refund of invoice %3).', NewSalesHeader."No.", Rec.DomainName, OriginalInvoiceNo);
                            end;

                        exit;
                    end;

                    if not Customer.Get(Rec.ClientRoid) then
                        Error('Customer %1 does not exist.', Rec.ClientRoid);

                    CMSetup.Get();
                    DotCount := CountDots(Rec.DomainName);
                    case Rec.TransType of
                        'Registration':
                            begin
                                if DotCount = 1 then begin
                                    CMSetup.TestField("Domain L2 Registration");
                                    ItemNo := CMSetup."Domain L2 Registration";
                                end else begin
                                    CMSetup.TestField("Domain Registration");
                                    ItemNo := CMSetup."Domain Registration";
                                end;
                            end;
                        'Renewal':
                            begin
                                if DotCount = 1 then begin
                                    CMSetup.TestField("Domain L2 Renewal");
                                    ItemNo := CMSetup."Domain L2 Renewal";
                                end else begin
                                    CMSetup.TestField("Domain Renewal");
                                    ItemNo := CMSetup."Domain Renewal";
                                end;
                            end;
                        'AutoRenewal':
                            begin
                                if DotCount = 1 then begin
                                    CMSetup.TestField("Domain L2 Autorenewal");
                                    ItemNo := CMSetup."Domain L2 Autorenewal";
                                end else begin
                                    CMSetup.TestField("Domain AutoRenewal");
                                    ItemNo := CMSetup."Domain AutoRenewal";
                                end;
                            end;
                        'Access fee':
                            begin
                                CMSetup.TestField("Access fee");
                                ItemNo := CMSetup."Access fee";
                            end;
                        'Application':
                            begin
                                CMSetup.TestField(Application);
                                ItemNo := CMSetup.Application;
                            end;
                        'Restoration':
                            begin
                                CMSetup.TestField(Restoration);
                                ItemNo := CMSetup.Restoration;
                            end;
                        'Transfer':
                            begin
                                CMSetup.TestField(Transfer);
                                ItemNo := CMSetup.Transfer;
                            end;
                    end;

                    InvoiceNo := CopyStr(Format(Rec.ID), 1, 20);

                    SalesHeader.Init();
                    SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
                    SalesHeader."No." := InvoiceNo;
                    SalesHeader."No. Series" := '';
                    SalesHeader."Posting No." := InvoiceNo;
                    SalesHeader."Posting No. Series" := '';
                    SalesHeader.Insert(false);
                    SalesHeader.Validate("Sell-to Customer No.", Customer."No.");
                    SalesHeader.Validate("Posting Date", Today);
                    SalesHeader.Validate("Document Date", Today);

                    SalesHeader.Modify(true);

                    SalesLine.Init();
                    SalesLine."Document Type" := SalesHeader."Document Type";
                    SalesLine."Document No." := SalesHeader."No.";
                    SalesLine."Line No." := 10000;

                    SalesLine.Validate(Type, SalesLine.Type::Item);
                    SalesLine.Validate("No.", ItemNo);
                    SalesLine.Validate(Quantity, 1);
                    SalesLine.Validate("Unit Price", Rec.Amount);

                    SalesLine.Description := CopyStr(Rec.Description, 1, 100);

                    SalesLine.Insert(true);

                    if Rec.TransType in ['Renewal', 'AutoRenewal', 'Registration'] then begin
                        DomainLengthYears := GetDomainLengthYears(Rec.Created, Rec.ExDate);
                        if DomainLengthYears > 0 then begin
                            DeferralCode := GetDeferralCode(Rec.TransType, DomainLengthYears, CMSetup);
                            if DeferralCode <> '' then
                                SalesLine.Validate("Deferral Code", DeferralCode)
                            else
                                Error('Deferral code is not set for %1 year(s) for transaction type %2 in Cash Management Setup.', DomainLengthYears, Rec.TransType);
                        end;
                    end;

                    SalesLine.Modify(true);

                    Rec.InvoiceCreated := true;
                    Rec."Sales Invoice No." := SalesHeader."No.";
                    SalesHeader.Status := SalesHeader.Status::Released;
                    Rec.Modify();

                    Commit();

                    if not TryReleaseSalesInvoice(SalesHeader) then begin
                        Message('Sales Invoice %1 was created but could not be released automatically: %2\Please release and post it manually.', InvoiceNo, GetLastErrorText());
                        OpenSalesInvoice(SalesHeader);
                    end else
                        if not TryPostSalesInvoice(SalesHeader) then begin
                            Message('Sales Invoice %1 was released but could not be posted automatically: %2\Please post it manually.', InvoiceNo, GetLastErrorText());
                            OpenSalesInvoice(SalesHeader);
                        end else begin
                            if PostedSalesInvHeader.Get(InvoiceNo) then begin
                                PostedSalesInvHeader."Domain Ledger Synced" := true;
                                PostedSalesInvHeader.Modify();
                            end;
                            Message('Sales Invoice %1 created and posted successfully for %2.', InvoiceNo, Rec.DomainName);
                        end;
                end;
            }
        }
    }

    var
        DomainLengthYears: Integer;
        DeferralCode: Code[30];

    local procedure GetDomainLengthYears(CreatedDT: DateTime; ExpiryDT: DateTime): Integer
    var
        CreatedD: Date;
        ExpiryD: Date;
        DaysDiff: Integer;
        Years: Integer;
    begin
        CreatedD := DT2Date(CreatedDT);
        ExpiryD := DT2Date(ExpiryDT);

        if ExpiryD <= CreatedD then
            exit(0);

        DaysDiff := ExpiryD - CreatedD;
        Years := Round(DaysDiff / 365, 1, '=');

        if Years < 1 then
            Years := 1;
        if Years > 5 then
            Years := 5;

        exit(Years);
    end;

    local procedure GetDeferralCode(TransType: Text[50]; Years: Integer; CMSetup: Record "Cash Management Setup"): Code[30]
    var
        DeferralCode: Code[30];
    begin
        if TransType in ['Renewal', 'AutoRenewal'] then begin
            case Years of
                1:
                    DeferralCode := CMSetup."1Y Defer code Renew";
                2:
                    DeferralCode := CMSetup."2Y Defer code Renew";
                3:
                    DeferralCode := CMSetup."3Y Defer code Renew";
                4:
                    DeferralCode := CMSetup."4Y Defer code Renew";
                5:
                    DeferralCode := CMSetup."5Y Defer code Renew";
            end;
        end else if TransType = 'Registration' then begin
            case Years of
                1:
                    DeferralCode := CMSetup."1Y Defer code Register";
                2:
                    DeferralCode := CMSetup."2Y Defer code Register";
                3:
                    DeferralCode := CMSetup."3Y Defer code Register";
                4:
                    DeferralCode := CMSetup."4Y Defer code Register";
                5:
                    DeferralCode := CMSetup."5Y Defer code Register";
            end;
        end;

        exit(DeferralCode);
    end;

    local procedure CountDots(DomainText: Text): Integer
    var
        i: Integer;
        DotCount: Integer;
    begin
        for i := 1 to StrLen(DomainText) do
            if CopyStr(DomainText, i, 1) = '.' then
                DotCount += 1;
        exit(DotCount);
    end;

    [TryFunction]
    local procedure TryReleaseSalesInvoice(var SalesHeader: Record "Sales Header")
    var
        ReleaseSalesDocument: Codeunit "Release Sales Document";
    begin
        ReleaseSalesDocument.PerformManualRelease(SalesHeader);
    end;

    [TryFunction]
    local procedure TryPostSalesInvoice(var SalesHeader: Record "Sales Header")
    var
        SalesPost: Codeunit "Sales-Post";
    begin
        SalesPost.Run(SalesHeader);
    end;

    local procedure OpenSalesInvoice(var SalesHeader: Record "Sales Header")
    var
        SalesInvoicePage: Page "Sales Invoice";
    begin
        SalesInvoicePage.SetRecord(SalesHeader);
        SalesInvoicePage.Run();
    end;

    local procedure OpenSalesCreditMemo(var SalesHeader: Record "Sales Header")
    var
        SalesCreditMemoPage: Page "Sales Credit Memo";
    begin
        SalesCreditMemoPage.SetRecord(SalesHeader);
        SalesCreditMemoPage.Run();
    end;
}
