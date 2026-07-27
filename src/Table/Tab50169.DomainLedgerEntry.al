table 50169 "Domain Ledger Entry"
{
    Caption = 'Domain Ledger Entry';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }

        field(2; ID; BigInteger)
        {
            Caption = 'ID';
        }

        field(3; ClientRoid; Code[50])
        {
            Caption = 'Client ROID';
        }

        field(4; Description; Text[250])
        {
            Caption = 'Description';
        }

        field(5; Currency; Code[10])
        {
            Caption = 'Currency';
        }

        field(6; Tax; Decimal)
        {
            Caption = 'Tax';
            DecimalPlaces = 2 : 5;
        }

        field(7; TaxLabel; Text[30])
        {
            Caption = 'Tax Label';
        }

        field(8; Total; Decimal)
        {
            Caption = 'Total';
            DecimalPlaces = 2 : 5;
        }

        field(9; Created; DateTime)
        {
            Caption = 'Created';
        }

        field(10; DomainRoid; Code[50])
        {
            Caption = 'Domain ROID';
        }

        field(11; TransType; Text[50])
        {
            Caption = 'Transaction Type';
        }

        field(12; RefundExpiry; DateTime)
        {
            Caption = 'Refund Expiry';
        }

        field(13; RefundAmount; Decimal)
        {
            Caption = 'Refund Amount';
            DecimalPlaces = 2 : 5;
        }

        field(14; Balance; Decimal)
        {
            Caption = 'Balance';
            DecimalPlaces = 2 : 5;
        }

        field(15; DomainName; Text[100])
        {
            Caption = 'Domain Name';
        }

        field(16; CreditTransactionId; BigInteger)
        {
            Caption = 'Credit Transaction ID';
        }

        field(17; TLD; Code[20])
        {
            Caption = 'TLD';
        }

        field(18; ProcessorAccountHistoryId; Integer)
        {
            Caption = 'Processor Account History ID';
        }

        field(19; RefundGrace; DateTime)
        {
            Caption = 'Refund Grace';
        }

        field(20; IsPicked; Boolean)
        {
            Caption = 'Is Picked';
        }

        field(21; PreviousExpiryDate; DateTime)
        {
            Caption = 'Previous Expiry Date';
        }

        field(22; RenewalRefund; Boolean)
        {
            Caption = 'Renewal Refund';
        }

        field(23; DocumentNumber; Integer)
        {
            Caption = 'Document Number';
        }

        field(24; TransfRoid; Code[50])
        {
            Caption = 'Transfer ROID';
        }

        field(25; ExDate; DateTime)
        {
            Caption = 'Expiry Date';
        }

        field(26; RefundForId; BigInteger)
        {
            Caption = 'Refund For ID';
        }

        field(27; VatSign; Text[20])
        {
            Caption = 'VAT Sign';
        }

        field(28; IsPrinted; Boolean)
        {
            Caption = 'Is Printed';
        }

        field(29; PrintTime; DateTime)
        {
            Caption = 'Print Time';
        }

        field(30; IsFilled; Boolean)
        {
            Caption = 'Is Filled';
        }

        field(31; Amount; Decimal)
        {
            Caption = 'Amount';
            DecimalPlaces = 2 : 5;
        }

        field(32; TaxContent; Decimal)
        {
            Caption = 'Tax Content';
            DecimalPlaces = 2 : 5;
        }

        field(33; TaxInclusive; Boolean)
        {
            Caption = 'Tax Inclusive';
        }

        field(34; LedgerLoginUsername; Text[100])
        {
            Caption = 'Ledger Login Username';
        }
    }

    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }

        key(Domain; DomainName)
        {
        }

        key(Document; DocumentNumber)
        {
        }
    }
}
