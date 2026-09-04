table 50180 "Transaction Posting Log"
{
    Caption = 'Transaction Posting Log';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Source Table"; Text[50])
        {
            Caption = 'Source Table';
        }
        field(3; "Source Record ID"; BigInteger)
        {
            Caption = 'Source Record ID';
        }
        field(4; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(5; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(6; Amount; Decimal)
        {
            Caption = 'Amount';
            DecimalPlaces = 2 : 5;
        }
        field(7; "User ID"; Code[50])
        {
            Caption = 'User ID';
        }
        field(8; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(9; "Error Description"; Text[500])
        {
            Caption = 'Error Description';
        }
        field(10; "Log DateTime"; DateTime)
        {
            Caption = 'Log Date/Time';
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(Source; "Source Table", "Source Record ID")
        {
        }
    }
}