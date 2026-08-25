namespace KENIC.KENIC;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Document;
using Microsoft.Sales.History;

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
                    SalesInvoiceHeader: Record "Sales Invoice Header";
                    CorrectPostedSalesInvoice: Codeunit "Correct Posted Sales Invoice";
                    ItemNo: Code[20];
                    InvoiceNo: Code[20];
                    OriginalInvoiceNo: Code[20];
                    CreditMemoNo: Code[20];
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

                        if not CorrectPostedSalesInvoice.CreateCreditMemoCopyDocument(SalesInvoiceHeader, SalesHeader) then
                            Error('Could not create credit memo for invoice %1. The invoice may be fully or partially applied.', OriginalInvoiceNo);

                        SalesHeader.Rename(SalesHeader."Document Type", CreditMemoNo);
                        SalesHeader."Posting No." := CreditMemoNo;
                        SalesHeader."Posting No. Series" := '';
                        SalesHeader.Modify(true);

                        Rec.InvoiceCreated := true;
                        Rec."Credit Memo No." := SalesHeader."No.";
                        Rec."Sales Invoice No." := SalesHeader."No.";
                        Rec.Modify();

                        Message('Credit Memo %1 created successfully for %2 (refund of invoice %3).', SalesHeader."No.", Rec.DomainName, OriginalInvoiceNo);
                        exit;
                    end;

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
                    SalesLine.Insert(true);
                    SalesLine.Validate(Type, SalesLine.Type::Item);
                    SalesLine.Validate("No.", ItemNo);
                    SalesLine.Validate(Quantity, 1);
                    SalesLine.Validate("Unit Price", Rec.Amount);
                    SalesLine.Description := CopyStr(Rec.Description, 1, 100);
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