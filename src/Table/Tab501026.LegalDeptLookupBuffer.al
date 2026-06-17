table 50110 "Legal Dept Lookup Buffer"
{
    Caption = 'Legal Dept Lookup Buffer';
    DataClassification = ToBeClassified;
    LookupPageID = "Legal Dept Lookup List";

    fields
    {
        field(1; Code; Code[2048])
        {
            Caption = 'Code';
        }
        field(2; "Legal Buffer"; Enum "Legal Docs")
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
        fieldgroup(dropdown; Code, "Legal Buffer")
        {

        }
    }
}
