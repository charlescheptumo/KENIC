namespace KENIC.KENIC;

using Microsoft.Sales.History;
tableextension 50158 "Sales Invoice Header Ext" extends "Sales Invoice Header"
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

