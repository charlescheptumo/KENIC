namespace KENIC.KENIC;

page 50358 "I&M Transaction List"
{
    ApplicationArea = All;
    Caption = 'I&M Transactions';
    PageType = List;
    SourceTable = "I&M Transaction";
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
                field(IMTransactionId; Rec.IMTransactionId) { ApplicationArea = All; }
                field(TransactionReference; Rec.TransactionReference) { ApplicationArea = All; }
                field(TransactionDate; Rec.TransactionDate) { ApplicationArea = All; }
                field(PaymentType; Rec.PaymentType) { ApplicationArea = All; }
                field(Amount; Rec.Amount) { ApplicationArea = All; }
                field(Currency; Rec.Currency) { ApplicationArea = All; }
                field(CustomerRef; Rec.CustomerRef) { ApplicationArea = All; }
                field(ExternalRefNumber; Rec.ExternalRefNumber) { ApplicationArea = All; }
                field(PayerName; Rec.PayerName) { ApplicationArea = All; }
                field(PayerMobileNumber; Rec.PayerMobileNumber) { ApplicationArea = All; }
                field(SenderBankCode; Rec.SenderBankCode) { ApplicationArea = All; }
                field(SenderAccountNumber; Rec.SenderAccountNumber) { ApplicationArea = All; }
                field(SenderAccountName; Rec.SenderAccountName) { ApplicationArea = All; }
                field(SenderAddress; Rec.SenderAddress) { ApplicationArea = All; }
                field(ChequeNumber; Rec.ChequeNumber) { ApplicationArea = All; }
                field(Narration; Rec.Narration) { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
                field(CustomerConfirmed; Rec.CustomerConfirmed) { ApplicationArea = All; }
                field(ErpRefId; Rec.ErpRefId) { ApplicationArea = All; }
                field(ApiClientId; Rec.ApiClientId) { ApplicationArea = All; }
                field(OrgId; Rec.OrgId) { ApplicationArea = All; }
                field(ShortCode; Rec.ShortCode) { ApplicationArea = All; }
                field(CreatedDate; Rec.CreatedDate) { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetIMTransactions)
            {
                ApplicationArea = All;
                Caption = 'Get I&M Transactions';
                Image = Refresh;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    Dialog: Page "Get I&M Transaction";
                begin
                    Dialog.RunModal();
                    CurrPage.Update(false);
                end;
            }

            action(CreateTransaction)
            {
                ApplicationArea = All;
                Caption = 'Create Transaction';
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
