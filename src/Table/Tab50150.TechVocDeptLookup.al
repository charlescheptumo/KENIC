table 50150 "Tech Voc Dept Lookup"
{
    Caption = 'Tech Voc Dept Lookup';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[2048])
        {
            Caption = 'Code';
        }
        field(2; "Tech Voc Dept Lookup"; Enum "Tech Voc Dept Lookup")
        {
            Caption = 'Tech Voc Dept Lookup';
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
