table 50155 COFS
{
    Caption = 'COFS';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[200])
        {
            Caption = 'Code';
        }
        field(2; "COFS Buffer"; Enum COFS)
        {
            Caption = 'COFS Buffer';
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
        fieldgroup(dropdown; Code, "COFS Buffer")
        {

        }
    }
}
