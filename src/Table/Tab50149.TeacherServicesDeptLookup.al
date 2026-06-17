table 50149 "Teacher Services Dept Lookup"
{
    Caption = 'Teacher Services Dept Lookup';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[2048])
        {
            Caption = 'Code';
        }
        field(2; "Teacher Services Dept"; Enum "Teacher Services Docs")
        {
            Caption = 'Teacher Services Dept ';
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
