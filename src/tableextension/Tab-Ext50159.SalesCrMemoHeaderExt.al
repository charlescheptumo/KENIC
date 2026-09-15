namespace KENIC.KENIC;

using Microsoft.Sales.History;

tableextension 50159 "Sales Cr.Memo Header Ext" extends "Sales Cr.Memo Header"
{
    fields
    {
        field(50100; "Domain Ledger Synced"; Boolean)
        {
            Caption = 'Domain Ledger Synced';
            DataClassification = ToBeClassified;
        }
    }
}
