table 50137 "Consultancy Dept Lookup Buffer"
{
    Caption = 'Consultancy Dept Lookup Buffer';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[2048])
        {
            Caption = 'Code';
        }
         field(2; "Consultancy"; Enum "Consultancy Docs")
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
