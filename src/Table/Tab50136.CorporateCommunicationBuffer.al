table 50136 "Corporate Communication Buffer"
{
    Caption = 'Corporate Communication Buffer';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[2048])
        {
            Caption = 'Code';
        }
         field(2; "Coporate Communication"; Enum "Coporate Communication")
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
