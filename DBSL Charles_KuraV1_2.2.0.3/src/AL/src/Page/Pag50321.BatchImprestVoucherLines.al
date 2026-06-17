namespace KICD.KICD;

page 50321 "Batch Imprest Voucher Lines"
{
    ApplicationArea = All;
    Caption = 'Batch Imprest Voucher Lines';
    PageType = ListPart;
    SourceTable = "Batch Imprest Voucher Lines";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                
                field("Account Type"; Rec."Account Type")
                {
                    ToolTip = 'Specifies the value of the Account Type field.', Comment = '%';
                }
                field("Account No."; Rec."Account No.")
                {
                    ToolTip = 'Specifies the value of the Account No. field.', Comment = '%';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ToolTip = 'Specifies the value of the Account Name field.', Comment = '%';
                }
                field("Employee Bank Account Code"; Rec."Employee Bank Account Code")
                {
                    ToolTip = 'Specifies the value of the Employee Bank Account Code field.', Comment = '%';
                }
                field("Employee Ban Account Name"; Rec."Employee Ban Account Name")
                {
                    ToolTip = 'Specifies the value of the Employee Ban Account Name field.', Comment = '%';
                }
                field("Employee Bank Account Number"; Rec."Employee Bank Account Number")
                {
                    ToolTip = 'Specifies the value of the Employee Bank Account Number field.', Comment = '%';
                }
                field(Payee; Rec.Payee)
                {
                    ToolTip = 'Specifies the value of the Payee field.', Comment = '%';
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ToolTip = 'Specifies the value of the Imprest Amount field.', Comment = '%';
                }
                field("Imprest Req. No."; Rec."Imprest Req. No.")
                {
                    ToolTip = 'Specifies the value of the Imprest Req. No. field.', Comment = '%';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ToolTip = 'Specifies the value of the Paying Bank Account field.', Comment = '%';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ToolTip = 'Specifies the value of the Bank Name field.', Comment = '%';
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        Imprest.Reset();
        Imprest.SetRange("No.", Rec."No.");
        if Imprest.FindFirst() then begin
            Rec."Paying Bank Account" := Imprest."Paying Bank Account";
            Rec.Validate("Paying Bank Account");
            Rec.Modify();
        end;
    end;

    var
        Imprest: Record payments;
        BatchImprestVoucherLines: Record "Batch Imprest Voucher Lines";
}
