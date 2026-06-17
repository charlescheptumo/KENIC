table 50123 "Human Cap Dept Lookup Buffer"
{
    Caption = 'Human Cap Dept Lookup Buffer';
    DataClassification = ToBeClassified;
    LookupPageID = "Human Cap Dept Lookup List";

    fields
    {
        field(1; Code; Code[2048])
        {
            Caption = 'Code';
        }
        field(2; "Human Capital Buffer"; Enum "Human Capital Docs")
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(dropdown; Code, "Human Capital Buffer")
        {

        }
    }
}
