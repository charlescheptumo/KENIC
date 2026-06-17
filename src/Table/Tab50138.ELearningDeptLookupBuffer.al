table 50138 "E-Learning Dept Lookup Buffer"
{
    Caption = 'E-Learning Dept Lookup Buffer';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[2048])
        {
            Caption = 'Code';
        }
        field(2; "E_learning Buffer"; Enum "E-learning Docs")
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
