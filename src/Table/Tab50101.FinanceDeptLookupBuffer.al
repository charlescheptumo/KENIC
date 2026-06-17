table 50118 "Finance Dept Lookup Buffer"
{
    Caption = 'Finance Dept Lookup Buffer';
    DataClassification = ToBeClassified;
    LookupPageID = "Finance Dept Lookup List";

    fields
    {
        field(1; Code; Code[2048])
        {
            Caption = 'Code';
        }
        field(2; "Finance Buffer"; Enum "Finance and Accounts Docs")
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(dropdown; Code, "Finance Buffer")
        {

        }
    }
}
