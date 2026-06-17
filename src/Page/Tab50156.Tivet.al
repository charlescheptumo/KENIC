table 50156 Tivet
{
    Caption = 'Tivet';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[200])
        {
            Caption = 'Code';
        }
        field(2; "Tivet Buffer"; Enum tivet)
        {
            Caption = 'Tivet Buffer';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(dropdown; Code, "Tivet Buffer")
        {

        }
    }
}
