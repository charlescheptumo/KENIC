table 50139 "Educational Media Dept Lookup"
{
    Caption = 'Educational Media Dept Lookup Buffer';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[2048])
        {
            Caption = 'Code';
        }
        field(2;"Educational Media Buffer"; Enum "Education Media Docs")
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
