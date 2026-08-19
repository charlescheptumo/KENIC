table 50171 "Domain Receipt"
{
    Caption = 'Domain Receipt';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }

        field(2; ReceiptId; Integer) { }
        field(3; Roid; Code[50]) { }
        field(4; LedgerId; BigInteger) { }
        field(5; ReceiptDate; DateTime) { }
        field(6; Amount; Decimal)
        {
            DecimalPlaces = 2 : 5;
        }
        field(7; BankCode; Code[30]) { }
        field(8; ChequeDate; DateTime) { }
        field(9; ChequeNumber; Code[50]) { }
        field(10; DrawerName; Text[100]) { }
        field(11; Cash; Boolean) { }
        field(12; Details; Text[250]) { }
        field(13; InWords; Text[250]) { }
        field(14; VatWithheld; Boolean) { }
        field(15; VatCertNo; Code[50]) { }
        field(16; Voided; Boolean) { }
        field(17; VoidDate; DateTime) { }
        field(18; SmsTransId; Code[50]) { }
        field(19; MpesaTrxId; Code[50]) { }
        field(20; Mpesa; Boolean) { }
        field(21; IPay; Boolean) { }
        field(22; MpesaApiId; Integer) { }
        field(23; NcbaKes; Boolean) { }
        field(24; ImKes; Boolean) { }
        field(25; ImUsd; Boolean) { }
        field(26; Posted; Boolean) { }
        field(27; "Posted By"; Code[50]) { }
        field(28; "Posted Date"; Date) { }
        field(29; "Posted Time"; Time) { }
    }

    keys
    {
        key(PK; ReceiptId)
        {
            Clustered = true;
        }

        key(Ledger; LedgerId)
        {
        }

        key(Date; ReceiptDate)
        {
        }
    }
}
