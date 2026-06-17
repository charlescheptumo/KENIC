table 50165 "Meal Type"
{
    Caption = 'Meal Type';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No."; Code[30])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Cost; Decimal)
        {
            Caption = 'Cost';
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
