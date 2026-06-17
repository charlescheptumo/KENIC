table 50154 Research
{
    Caption = 'Research';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[200])
        {
            Caption = 'Code';
        }
        field(2; "Research Documents"; Enum "Research Docs")
        {
            Caption = 'Research Documents';
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
        fieldgroup(dropdown; Code, "Research Documents")
        {

        }
    }
}
