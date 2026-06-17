namespace KICD.KICD;

using Microsoft.Sales.Document;

tableextension 50155 "Sales Header Ext" extends "Sales Header"
{
    fields
    {
        field(50000; "LPO/LSO"; Text[50])
        {
            Caption = '';
            DataClassification = ToBeClassified;
        }
    }
}
