table 50168 "Vendor Name Mismatch Buffer"
{
    TableType = Temporary;
    Caption = 'Vendor Name Mismatch Buffer';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
        }
        field(3; "VLE Vendor Name"; Text[100])
        {
            Caption = 'VLE Vendor Name';
        }
        field(4; "Vendor Table Name"; Text[100])
        {
            Caption = 'Vendor Table Name (Current)';
        }
        field(5; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(6; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}