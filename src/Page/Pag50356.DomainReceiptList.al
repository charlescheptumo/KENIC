namespace KENIC.KENIC;

page 50356 "Domain Receipt List"
{
    ApplicationArea = All;
    Caption = 'Domain Receipts';
    PageType = List;
    SourceTable = "Domain Receipt";
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
                field(ReceiptId; Rec.ReceiptId) { ApplicationArea = All; }
                field(Roid; Rec.Roid) { ApplicationArea = All; }
                field(LedgerId; Rec.LedgerId) { ApplicationArea = All; }
                field(ReceiptDate; Rec.ReceiptDate) { ApplicationArea = All; }
                field(Amount; Rec.Amount) { ApplicationArea = All; }
                field(BankCode; Rec.BankCode) { ApplicationArea = All; }
                field(ChequeDate; Rec.ChequeDate) { ApplicationArea = All; }
                field(ChequeNumber; Rec.ChequeNumber) { ApplicationArea = All; }
                field(DrawerName; Rec.DrawerName) { ApplicationArea = All; }
                field(Cash; Rec.Cash) { ApplicationArea = All; }
                field(Details; Rec.Details) { ApplicationArea = All; }
                field(InWords; Rec.InWords) { ApplicationArea = All; }
                field(VatWithheld; Rec.VatWithheld) { ApplicationArea = All; }
                field(VatCertNo; Rec.VatCertNo) { ApplicationArea = All; }
                field(Voided; Rec.Voided) { ApplicationArea = All; }
                field(VoidDate; Rec.VoidDate) { ApplicationArea = All; }
                field(SmsTransId; Rec.SmsTransId) { ApplicationArea = All; }
                field(MpesaTrxId; Rec.MpesaTrxId) { ApplicationArea = All; }
                field(Mpesa; Rec.Mpesa) { ApplicationArea = All; }
                field(IPay; Rec.IPay) { ApplicationArea = All; }
                field(MpesaApiId; Rec.MpesaApiId) { ApplicationArea = All; }
                field(NcbaKes; Rec.NcbaKes) { ApplicationArea = All; }
                field(ImKes; Rec.ImKes) { ApplicationArea = All; }
                field(ImUsd; Rec.ImUsd) { ApplicationArea = All; }
                field(Posted;Rec.Posted) { ApplicationArea = All; }
                field("Posted By";Rec."Posted By") { ApplicationArea = All; }
                field("Posted Date";Rec."Posted Date") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetReceipts)
            {
                ApplicationArea = All;
                Caption = 'Get Domain Receipts';
                Image = Refresh;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ReceiptDialog: Page "Get Domain Receipt";
                begin
                    ReceiptDialog.RunModal();
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
            action(PostReceipt)
            {
                ApplicationArea = All;
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    DomainReceiptMgt: Codeunit "Payments-post";
                begin
                    DomainReceiptMgt.PostReceipt(Rec);
                    CurrPage.Update(false);
                end;
            }
        }
    }
}
