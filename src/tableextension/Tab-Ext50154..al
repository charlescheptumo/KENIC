namespace KICD.KICD;

using Microsoft.Finance.ReceivablesPayables;

tableextension 50154 "" extends "Detailed CV Ledg. Entry Buffer"
{
    fields
    {
        field(50000; "Vendor Name"; Text[200])
        {
            Caption = 'Vendor Name';
            DataClassification = ToBeClassified;
        }
    }
}
