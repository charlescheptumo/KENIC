table 50116 "SCM Dept Lookup Buffer"
{
    Caption = 'SCM Dept Lookup Buffer';
    DataClassification = ToBeClassified;
    LookupPageID = "SCM Dept Lookup List";

    fields
    {
        field(1; Code; Code[2048])
        {
            Caption = 'Code';
        }
        field(2; "SCM Buffer"; Enum "Supply Chain Management Docs")
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
        fieldgroup(dropdown;Code,"SCM Buffer")
        {

        }
    }
}
