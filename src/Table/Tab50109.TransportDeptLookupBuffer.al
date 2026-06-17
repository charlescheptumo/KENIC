table 50126 "Transport Dept Lookup Buffer"
{
    Caption = 'Transport Dept Lookup Buffer';
    DataClassification = ToBeClassified;
    LookupPageID = "Transport Dept Lookup List";

    fields
    {
        field(1; Code; Code[2048])
        {
            Caption = 'Code';
        }
        field(2; "Transport Buffer"; Enum "Transport Docs")
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
        fieldgroup(dropdown; Code, "Transport Buffer")
        {

        }
    }
}
