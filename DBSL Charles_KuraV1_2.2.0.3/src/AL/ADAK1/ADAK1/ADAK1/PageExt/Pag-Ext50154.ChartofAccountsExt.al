pageextension 50154 "Chart of Accounts Ext" extends "Chart of Accounts"
{
    actions
    {
        modify("Detail Trial Balance")
        {
            Caption = 'General Ledger Listing';
            ToolTip = 'View detail general ledger account balances and activities for all the selected accounts, one transaction per line.';
            // RunObject = Report "General Ledger Listing";
        }
        modify("Action1900210206")
        {
            Caption = 'G/L Registers-Transaction Journals';
            ToolTip = 'View summary general ledger account balances and activities for all the selected accounts, one line per account.';
            // RunObject = Report "General Ledger Register";
        }
    }
}