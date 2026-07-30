table 50172 "I&M Transaction"
{
    Caption = 'I&M Transaction';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }

        field(2; IMTransactionId; Integer) { }
        field(3; OrgId; Integer) { }
        field(4; ApiClientId; Code[30]) { }
        field(5; PaymentType; Code[30]) { }
        field(6; TransactionReference; Code[50]) { }
        field(7; TransactionDate; DateTime) { }
        field(8; Amount; Decimal)
        {
            DecimalPlaces = 2 : 5;
        }
        field(9; Currency; Code[10]) { }
        field(10; ShortCode; Code[30]) { }
        field(11; CustomerRef; Code[50]) { }
        field(12; ExternalRefNumber; Code[50]) { }
        field(13; SenderBankCode; Code[30]) { }
        field(14; SenderAccountNumber; Code[50]) { }
        field(15; SenderAccountName; Text[100]) { }
        field(16; PayerName; Text[100]) { }
        field(17; PayerMobileNumber; Code[30]) { }
        field(18; SenderAddress; Text[250]) { }
        field(19; ChequeNumber; Code[50]) { }
        field(20; Narration; Text[250]) { }
        field(21; CustomerConfirmed; Boolean) { }
        field(22; Status; Code[30]) { }
        field(23; ErpRefId; Code[50]) { }
        field(24; RawJsonPayload; Blob)
        {
            Subtype = Memo;
        }
        field(25; CreatedDate; DateTime) { }
    }

    keys
    {
        key(PK; IMTransactionId)
        {
            Clustered = true;
        }

        key(TransactionReference; TransactionReference)
        {
        }

        key(TransactionDate; TransactionDate)
        {
        }
    }
}
