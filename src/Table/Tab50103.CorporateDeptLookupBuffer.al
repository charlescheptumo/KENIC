table 50121 "Corporate Dept Lookup Buffer"
{
    Caption = 'Corporate Dept Lookup Buffer';
    DataClassification = ToBeClassified;
    LookupPageID = "Corporate Dept Lookup List";

    fields
    {
        field(1; Code; Code[2048])
        {
            Caption = 'Code';
        }
        field(2; "Corporate Buffer"; Enum "Corporate Communication Docs")
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
        fieldgroup(dropdown; Code, "Corporate Buffer")
        {

        }
    }
}
