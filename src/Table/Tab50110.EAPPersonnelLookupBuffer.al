table 50127 "EAP Personnel Lookup Buffer"
{
    Caption = 'EAP Personnel Lookup Buffer';
    DataClassification = ToBeClassified;
    LookupPageID = "EAP Personnel Lookup List";

    fields
    {
        field(1; Code; Code[2048])
        {
            Caption = 'Code';
        }
        field(2; "EAP Personnel Buffer"; Enum "EAP Personnel Docs")
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
        fieldgroup(dropdown; Code, "EAP Personnel Buffer")
        {

        }
    }
}
