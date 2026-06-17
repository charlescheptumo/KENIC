table 50144 "Planning & Research Dept"
{
    Caption = 'Planning & Reserach Dept ';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[2048])
        {
            Caption = 'Code';
        }
        field(2; "Planning & Research"; Enum "Planning & Research Docs")
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
