table 50101 "Education Dept Lookup Buffer"
{
    Caption = 'Education Dept Lookup Buffer';
    DataClassification = ToBeClassified;
    LookupPageID = "Education Dept Lookup List";

    fields
    {
        field(1; Code; Code[2048])
        {
            Caption = 'Code';
        }
        field(2; "Education Buffer"; Enum "Education and Research Docs")
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
        fieldgroup(dropdown; Code, "Education Buffer")
        {

        }
    }
}
