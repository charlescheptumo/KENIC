table 50111 "Project Files Lookup Buffer"
{
    Caption = 'Project Files Lookup Buffer';
    DataClassification = ToBeClassified;
    LookupPageID = "Project Files Lookup List";
    
    fields
    {
        field(1; Code; Code[2048])
        {
            Caption = 'Code';
        }
        field(2; "Project Files Buffer"; Enum "Project Files Docs")
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
        fieldgroup(dropdown; Code, "Project Files Buffer")
        {

        }
    }
}
