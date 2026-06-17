table 80142 "Additional Assignment"
{
    Caption = 'Additional Assignment';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No"; Code[30])
        {
            Caption = 'Line No';
        }
        field(2; "Additional Assignment"; Text[250])
        {
            Caption = 'Additional Assignment';
        }
        field(3; "Code"; Code[30])
        {
            Caption = 'Code';
        }
        field(4; "Line Number"; Integer)
        {
            Caption = 'Line Number';
        }
    }
    keys
    {
        key(PK; "Line No")
        {
            Clustered = true;
        }
    }
}
