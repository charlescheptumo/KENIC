page 50381 "Batch EFT Vouchers"
{
    ApplicationArea = All;
    Caption = 'Batch EFT Vouchers';
    CardPageID = "Batch EFT Voucher";
    PageType = List;
    SourceTable = "Batch EFT Voucher";
    SourceTableView = where(Posted=const(false));
    UsageCategory = Lists;
    Editable = false;
    DeleteAllowed=false;

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
}
