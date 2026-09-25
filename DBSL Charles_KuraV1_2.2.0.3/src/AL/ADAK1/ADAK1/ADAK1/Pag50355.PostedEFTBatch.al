page 50382 "Posted EFT Batches"
{
    ApplicationArea = All;
    Caption = 'Posted EFT Batches';
    CardPageID = "Batch EFT Voucher";
    PageType = List;
    SourceTableView = where(Posted = const(true));
    SourceTable = "Batch EFT Voucher";
    DeleteAllowed=false;
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ToolTip = 'Specifies the value of the Paying Bank Account field.';
                }
                field("Paying Bank Account Name"; Rec."Paying Bank Account Name")
                {
                    ToolTip = 'Specifies the value of the Paying Bank Account Name field.';
                }
                field(Payee; Rec.Payee)
                {
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("EFT Reference No."; Rec."EFT Reference No.")
                {
                    ToolTip = 'Specifies the value of the EFT Reference No. field.';
                }
                field("Value Date"; Rec."Value Date")
                {
                    ToolTip = 'Specifies the value of the Value Date field.';
                }
                field(Posted; Rec.Posted)
                {
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Bank File Generated"; Rec."Bank File Generated")
                {
                    ToolTip = 'Specifies the value of the Bank File Generated field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(PostBatchEFT)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Enabled = Rec.Posted = false;
                ToolTip = 'Post the selected Batch EFT Voucher.';

                trigger OnAction()
                begin
                    PaymentsPost.PostBatchEFT(Rec);
                    CurrPage.Update(false);
                end;
            }
            action(ReverseBatchEFT)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Reverse';
                Image = ReverseLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Reverse the selected posted EFT batches, undoing all G/L, Vendor Ledger, and Bank Account Ledger entries they created, so they can be reposted.';

                trigger OnAction()
                var
                    SelectedPV: Record "Batch EFT Voucher";
                    ReversedCount: Integer;
                    FailedCount: Integer;
                    FailedList: Text;
                begin
                    CurrPage.SetSelectionFilter(SelectedPV);
                    if SelectedPV.IsEmpty() then
                        Error('Please select at least one posted EFT batch to reverse.');

                    if not Confirm('Are you sure you want to reverse %1 selected posted EFT batch(es)? This will reverse all related G/L, Vendor Ledger, and Bank Account Ledger entries.', false, SelectedPV.Count()) then
                        exit;

                    ReversedCount := 0;
                    FailedCount := 0;
                    FailedList := '';

                    if SelectedPV.FindSet() then
                        repeat
                            if ReverseSingleEFT(SelectedPV) then
                                ReversedCount += 1
                            else begin
                                FailedCount += 1;
                                if FailedList = '' then
                                    FailedList := SelectedPV."No."
                                else
                                    FailedList := FailedList + ', ' + SelectedPV."No.";
                            end;
                        until SelectedPV.Next() = 0;

                    if FailedCount = 0 then
                        Message('%1 posted EFT batch(es) reversed successfully.', ReversedCount)
                    else
                        Message('%1 reversed successfully.\%2 failed: %3', ReversedCount, FailedCount, FailedList);

                    CurrPage.Update(false);
                end;
            }
            action(GenerateBankFile)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Generate Bank File';
                Image = ExportFile;
                Promoted = true;
                PromotedCategory = Process;
                Enabled = Rec.Posted;
                ToolTip = 'Generate the electronic payment file for the bank.';

                trigger OnAction()
                begin
                    PaymentsPost.GenerateBatchEFTFile(Rec);
                    Rec."Bank File Generated" := true;
                    Rec.Modify();
                    CurrPage.Update(false);
                end;
            }
            action(Navigate)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Find Entries';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                Enabled = Rec.Posted;
                ToolTip = 'Find all entries and documents related to this posted batch EFT voucher.';

                trigger OnAction()
                var
                    NavigatePage: Page Navigate;
                begin
                    Rec.TestField(Posted);
                    NavigatePage.SetDoc(Rec."Posting Date", Rec."No.");
                    NavigatePage.Run();
                end;
            }
        }
    }

    var
        PaymentsPost: Codeunit "Payments-Post";

    [TryFunction]
    local procedure ReverseSingleEFT(var PV: Record "Batch EFT Voucher")
    var
        GLEntry: Record "G/L Entry";
        ReversalEntry: Record "Reversal Entry" temporary;
        PVLines: Record "Batch EFT Lines";
        Payments: Record Payments;
        FirstEntryNo: Integer;
    begin
        PV.TestField(Posted, true);

        GLEntry.Reset();
        GLEntry.SetRange("Document No.", PV."No.");
        GLEntry.SetRange("Posting Date", PV."Posting Date");
        if not GLEntry.FindFirst() then
            Error('No General Ledger entries found for Batch EFT Voucher %1.', PV."No.");

        FirstEntryNo := GLEntry."Entry No.";

        ReversalEntry.ReverseTransaction(GLEntry."Transaction No.");

        GLEntry.Get(FirstEntryNo);
        if not GLEntry.Reversed then
            Error('The reversal could not be completed for Batch EFT Voucher %1 because one or more related entries could not be reversed (for example, an entry may already be applied to another entry). No changes were made.', PV."No.");

        PVLines.Reset();
        PVLines.SetRange("Document No", PV."No.");
        if PVLines.FindSet() then
            repeat
                if Payments.Get(PVLines."PV No") then begin
                    Payments.Posted := false;
                    Payments."Posted By" := '';
                    Payments."Posted Date" := 0D;
                    Payments."Time Posted" := 0T;
                    Payments.Modify();
                end;
            until PVLines.Next() = 0;

        PV.Posted := false;
        PV.Modify();

        Commit();
    end;
}
