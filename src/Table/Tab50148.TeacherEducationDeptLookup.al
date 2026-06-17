table 50148 "Teacher Education Dept Lookup"
{
    Caption = 'Teacher Education Dept Lookup ';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[2048])
        {
            Caption = 'Code';
        }
        field(2; "Teacher Education Dept ";Enum "Teacher Education Docs")
        {
            Caption = 'Teacher Education Dept ';
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
