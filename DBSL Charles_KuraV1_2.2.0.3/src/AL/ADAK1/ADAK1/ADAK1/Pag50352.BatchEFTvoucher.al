page 50384 "Batch EFT Voucher"
{
    ApplicationArea = All;
    Caption = 'Batch EFT Voucher';
    PageType = Card;
    SourceTable = "Batch EFT Voucher";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

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
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field(Amount; Rec.Amount)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("EFT Reference No."; Rec."EFT Reference No.")
                {
                    ToolTip = 'Specifies the value of the EFT Reference No. field.';
                }
                field("Value Date"; Rec."Value Date")
                {
                    ToolTip = 'Specifies the value of the Value Date field.';
                    Visible=false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Editable = true;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Editable = true;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field(Posted; Rec.Posted)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Bank File Generated"; Rec."Bank File Generated")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Bank File Generated field.';
                }
            }

            part("Batch EFT Lines"; "Batch EFT Lines")
            {
                ApplicationArea = All;
                Caption = 'Batch EFT Voucher Lines';
                SubPageLink = "Document No" = field("No.");
                Editable = false;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(PostBatchEFT)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = Rec.Posted = false;
                ToolTip = 'Post the Batch EFT Voucher.';

                trigger OnAction()
                begin
                    PaymentsPost.PostBatchEFT(Rec);
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
        }
    }

    var
        PaymentsPost: Codeunit "Payments-Post";
}
