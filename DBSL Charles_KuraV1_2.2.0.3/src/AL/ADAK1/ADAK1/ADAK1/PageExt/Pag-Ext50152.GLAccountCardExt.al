pageextension 50152 "G/L Account Card Ext" extends "G/L Account Card"
{
    actions
    {
        modify("Detail Trial Balance")
        {
            Caption = 'General Ledger Listing';
            ToolTip = 'View detail general ledger account balances and activities for all the selected accounts, one transaction per line.';
           // RunObject = Report "General Ledger Listing";
        }
        modify("G/L Register") 
        { Caption = 'G/L Registers-Transaction Journals';
         ToolTip = 'View summary general ledger account balances and activities for all the selected accounts, one line per account.'; 
         // RunObject = Report "General Ledger Register"; // RunObject = Report "General Ledger Listing"; }
    }
    }
}