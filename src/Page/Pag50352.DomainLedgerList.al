namespace KENIC.KENIC;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Document;

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
                Caption = 'Process SIngle Transaction';
                Image = Refresh;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    DomainDialog: Page "Get Domain Ledger";
                begin
                    // DomainDialog.RunModal();
                    // CurrPage.Update(false);
                end;
            }
            action(ProcessBatch)
            {
                ApplicationArea = All;
                Caption = 'Process batch Transactions';
                Image = Refresh;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    DomainDialog: Page "Get Domain Ledger";
                begin
                    // DomainDialog.RunModal();
                    // CurrPage.Update(false);
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
        SalesLine: Record "Sales Line";
        ItemNo: Code[20];
    begin
        if not (Rec.TransType in ['Registration', 'Renewal', 'AutoRenewal']) then
            Error('Create Invoice is only available for Registration, Renewal, or AutoRenewal transactions.');

        if Rec.InvoiceCreated then
            Error('An invoice has already been created for this entry (%1).', Rec."Sales Invoice No.");

        if not Customer.Get(Rec.ClientRoid) then
            Error('Customer %1 does not exist.', Rec.ClientRoid);

        CMSetup.Get();

        case Rec.TransType of
            'Registration':
                begin
                    CMSetup.TestField("Domain Registration");
                    ItemNo := CMSetup."Domain Registration";
                end;
            'Renewal':
                begin
                    CMSetup.TestField("Domain Renewal");
                    ItemNo := CMSetup."Domain Renewal";
                end;
            'AutoRenewal':
                begin
                    CMSetup.TestField("Domain AutoRenewal");
                    ItemNo := CMSetup."Domain AutoRenewal";
                end;
        end;

        SalesHeader.Init();
        SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
        SalesHeader.Insert(true);
        SalesHeader.Validate("Sell-to Customer No.", Customer."No.");
        SalesHeader.Validate("Posting Date", Today);
        SalesHeader.Validate("Document Date", Today);
        SalesHeader.Modify(true);

        SalesLine.Init();
        SalesLine."Document Type" := SalesHeader."Document Type";
        SalesLine."Document No." := SalesHeader."No.";
        SalesLine."Line No." := 10000;
        SalesLine.Insert(true);
        SalesLine.Validate(Type, SalesLine.Type::Item);
        SalesLine.Validate("No.", ItemNo);
        SalesLine.Validate(Quantity, 1);
        SalesLine.Validate("Unit Price", Rec.Amount);
        SalesLine.Description := Rec.Description;
        SalesLine.Modify(true);

        Rec.InvoiceCreated := true;
        Rec."Sales Invoice No." := SalesHeader."No.";
        Rec.Modify();

        Message('Sales Invoice %1 created successfully for %2.', SalesHeader."No.", Rec.DomainName);
    end;
}
        }

    }
}
