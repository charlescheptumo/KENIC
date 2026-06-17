table 50120 "Audit Dept Lookup Buffer"
{
    Caption = 'Audit Dept Lookup Buffer';
    DataClassification = ToBeClassified;
    LookupPageID = "Audit Dept Lookup List";

    fields
    {
        field(1; Code; Code[2048])
        {
            Caption = 'Code';
        }
        field(2; "Audit Buffer"; Enum "Audit Docs")
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
        fieldgroup(dropdown; Code, "Audit Buffer")
        {

        }
    }
}
