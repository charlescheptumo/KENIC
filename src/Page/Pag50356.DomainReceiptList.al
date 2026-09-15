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
                field(ExternalReceiptNo; Rec."External Receipt No.") { ApplicationArea = All; }
                field(Posted; Rec.Posted) { ApplicationArea = All; }
                field("Posted By"; Rec."Posted By") { ApplicationArea = All; }
                field("Posted Date"; Rec."Posted Date") { ApplicationArea = All; }
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
                    DomainReceiptMgt: Codeunit "Payments-post";
                    ReceiptRec: Record "Domain Receipt";
                    PostingLog: Record "Transaction Posting Log";
                    PostedCount: Integer;
                    FailedCount: Integer;
                begin
                    ReceiptDialog.RunModal();
                    CurrPage.Update(false);

                    PostedCount := 0;
                    FailedCount := 0;

                    ReceiptRec.Reset();
                    ReceiptRec.SetRange(Posted, false);
                    if ReceiptRec.FindSet() then
                        repeat
                            Commit();
                            if DomainReceiptMgt.PostReceipt(ReceiptRec) then
                                PostedCount += 1
                            else begin
                                PostingLog.Init();

                                PostingLog."Source Table" := 'Domain Receipt';
                                PostingLog."Source Record ID" := ReceiptRec.ReceiptId;
                                PostingLog."Document No." := Format(ReceiptRec.ReceiptId);
                                PostingLog."Posting Date" := DT2Date(ReceiptRec.ReceiptDate);
                                PostingLog.Amount := ReceiptRec.Amount;
                                PostingLog."User ID" := CopyStr(UserId, 1, 50);
                                PostingLog.Posted := false;
                                PostingLog."Error Description" := CopyStr(GetLastErrorText(), 1, 500);
                                PostingLog."Log DateTime" := CurrentDateTime;

                                if PostingLog.FindLast() then
                                    PostingLog."Entry No." := PostingLog."Entry No." + 1
                                else
                                    PostingLog."Entry No." := 1;

                                PostingLog.Insert(true);

                                FailedCount += 1;
                            end;
                        until ReceiptRec.Next() = 0;

                    CurrPage.Update(false);

                    Message('%1 receipt(s) posted successfully. %2 receipt(s) failed and were logged - check View Posting Log for details.', PostedCount, FailedCount);
                end;
            }
            action(WriteToRegistry)
            {
                ApplicationArea = All;
                Caption = 'Write to Registry';
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Copies posted manually-created receipts that are not yet in the Domain Receipt registry.';

                trigger OnAction()
                var
                    DomainReceiptMgt: Codeunit "Payments-post";
                    PostedCount: Integer;
                    SyncedCount: Integer;
                begin
                    PostedCount := DomainReceiptMgt.SyncManualReceiptsToRegistry(SyncedCount);

                    CurrPage.Update(false);

                    Message(
                        '%1 posted receipt(s) found.\%2 new receipt(s) written to the Domain Receipt registry.\%3 receipt(s) were already in the registry.',
                        PostedCount,
                        SyncedCount,
                        PostedCount - SyncedCount);
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
                begin
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
            action(ViewPostingLog)
            {
                ApplicationArea = All;
                Caption = 'View Posting Log';
                Image = Log;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    PostingLog: Record "Transaction Posting Log";
                begin
                    PostingLog.SetRange("Source Table", 'Domain Receipt');
                    PostingLog.SetRange("Source Record ID", Rec.ReceiptId);
                    Page.Run(0, PostingLog);
                end;
            }
        }
    }
}