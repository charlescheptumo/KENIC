namespace KICD.KICD;

page 50320 "Batch Imprest Voucher Card"
{
    ApplicationArea = All;
    Caption = 'Batch Imprest Voucher Card';
    PageType = Card;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = filter("Batch Imprest Voucher"));
    InsertAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = IsEditable;
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ToolTip = 'Specifies the value of the Paying Bank Account field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ToolTip = 'Specifies the value of the Payment Narration field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ToolTip = 'Specifies the value of the Cheque No field.';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ToolTip = 'Specifies the value of the Cheque Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Reasons to Reopen"; Rec."Reasons to Reopen")
                {
                    ToolTip = 'Specifies the value of the Reasons to Reopen field.';
                }
                field("Total Imprest Amount"; Rec."Total Imprest Amount")
                {
                    ToolTip = 'Specifies the value of the Total Imprest Amount field.';
                    Visible = false;
                }
                field("Batch Total Amount"; Rec."Batch Total Amount")
                {
                    ToolTip = 'Specifies the value of the Batch Total Amount field.', Comment = '%';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ToolTip = 'Specifies the value of the Funding Source field.';
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Funding Source';
                    ToolTip = 'Specifies the value of the Funding Source field.';
                }
                field("Job Name"; Rec."Job Name")
                {
                    ToolTip = 'Specifies the value of the Job Name field.';
                }
                field(Currency; Rec.Currency)
                {
                    ToolTip = 'Specifies the value of the Currency field.';
                }
                field(Posted; Rec.Posted)
                {
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ToolTip = 'Specifies the value of the Posted Date field.';
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    ToolTip = 'Specifies the value of the Time Posted field.';
                }
            }
            part("Batch Imprest Voucher Lines"; "Batch Imprest Voucher Lines")
            {
                ApplicationArea = All;
                Caption = 'Batch Imprest Voucher Lines';
                SubPageLink = "No." = field("No.");
                Editable = false;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Post")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    Rec.TestField(Rec.Posted, false);
                    Rec.TestField(Rec."Payment Narration");
                    PaymentsPost.BatchPostImprest(Rec);
                    if Rec.Get(Rec."No.") then begin
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Posted Date" := Today;
                        Rec."Time Posted" := Time;
                        Rec.Modify();
                    end;
                end;
            }
            group("Payment Voucher")
            {
                Caption = 'Batch Imprest Voucher';
                Image = "Order";
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."Payment Type"::"Batch Imprest Voucher";
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Payment Type" := Rec."Payment Type"::"Batch Imprest Voucher";
    end;

    trigger OnAfterGetRecord()
    var
        TotalImprestAmount: Decimal;
    begin
        TotalImprestAmount := 0;
        BatchImprestVoucherLines.Reset();
        BatchImprestVoucherLines.SetRange("No.", Rec."No.");
        if BatchImprestVoucherLines.FindSet() then begin
            repeat
                Rec."Total Imprest Amount" += BatchImprestVoucherLines."Imprest Amount";
            until BatchImprestVoucherLines.Next() = 0;
        end;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance();
    end;

    local procedure SetControlAppearance()
    begin
        IsEditable := not Rec.Posted;
        if not IsEditable then
            CurrPage.Editable := false;
    end;

    var
        PaymentsPost: Codeunit "Payments-Post";
        BatchImprestVoucherLines: Record "Batch Imprest Voucher Lines";
        IsEditable: Boolean;

}
