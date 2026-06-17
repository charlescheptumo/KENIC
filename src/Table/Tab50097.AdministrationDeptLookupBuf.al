table 50114 "Administration Dept Lookup Buf"
{
    Caption = 'Administration Dept Lookup Buf';
    DataClassification = ToBeClassified;
    LookupPageID = "Administration Dept Lookup Lis";

    fields
    {
        field(1; Code; Code[200])
        {
            Caption = 'Code';
        }
        field(2; "Admin Buffer"; Enum "Administration Docs")
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
}
