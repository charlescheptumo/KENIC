table 50125 "Standards Dept Lookup Buffer"
{
    Caption = 'Standards Dept Lookup Buffer';
    DataClassification = ToBeClassified;
    LookupPageID = "Standards Dept Lookup List";

    fields
    {
        field(1; Code; Code[2048])
        {
            Caption = 'Code';
        }
        field(2; "Standards Buffer"; Enum "Standards and Compliance Docs")
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
        fieldgroup(dropdown; Code, "Standards Buffer")
        {

        }
    }
}
