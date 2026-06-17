namespace KICD.KICD;
using Microsoft.Purchases.Payables;
pageextension 50900 "Vendor Ledger Entries Ext" extends "Vendor Ledger Entries"

{
    layout
    {
        modify("Vendor Name")
        {
            Visible = true;
        }
    }
}
