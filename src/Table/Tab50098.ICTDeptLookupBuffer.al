table 50115"ICT Dept Lookup Buffer"
{
    Caption = 'ICT Dept Lookup Buffer';
    DataClassification = ToBeClassified;
    LookupPageID = "ICT Dept Lookup List";

    fields
    {
        field(1; Code; Code[200])
        {
            Caption = 'Code';
        }
        field(2; "ICT Buffer"; Enum "ICT Docs")
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
        fieldgroup(dropdown;Code,"ICT Buffer")
        {

        }
    }
    
}
