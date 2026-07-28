namespace KENIC.KENIC;

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
                    DomainDialog.RunModal();
                    CurrPage.Update(false);
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
        }
    }
}
