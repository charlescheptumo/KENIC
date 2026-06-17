table 50124 "Personnel Dept Lookup Buffer"
{
    Caption = 'Personnel Dept Lookup Buffer';
    DataClassification = ToBeClassified;
    LookupPageID = "Personnel Dept Lookup List";

    fields
    {
        field(1; Code; Code[2048])
        {
            Caption = 'Code';
        }
        field(2; "Personnel Buffer"; Enum "Personnel Files Docs")
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
        fieldgroup(dropdown; Code, "Personnel Buffer")
        {

        }
    }
}
