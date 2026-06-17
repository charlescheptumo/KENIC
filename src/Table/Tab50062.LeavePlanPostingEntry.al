table 50062 "Leave Plan Posting Entry"
{
    Caption = 'Leave Plan Posting Entry';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(2; "Leave Plan No."; Code[20])
        {
            Caption = 'Leave Plan No.';
            TableRelation = "Leave Plan Header";
        }
        field(3; "Leave Plan Line No."; Integer)
        {
            Caption = 'Leave Plan Line No.';
        }
        field(4; "Leave Plan Date"; Date)
        {
            Caption = 'Leave Plan Date';
        }
        field(5; Quantity; Decimal)
        {
            Caption = 'Quantity';
            Editable = false;
        }
        field(6; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(7; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(10; Description; Text[100])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Leave Plan No.", "Leave Plan Line No.", "Leave Plan Date")
        {
            SumIndexFields = Quantity;
        }
    }

    fieldgroups
    {
    }
}
