table 50146 "Research Knowledge Dept Lookup"
{
    Caption = 'Research Knowledge Dept Lookup';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[2048])
        {
            Caption = 'Code';
        }
        field(2; "Research Knowledge Dept"; Enum "Research Knowledge Docs")
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
