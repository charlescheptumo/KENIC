table 50152 ECDLookupBuffer
{
    Caption = 'ECDLookupBuffer';
    DataClassification = ToBeClassified;
    LookupPageId = "ECD Lookup List";
    
    fields
    {
        field(1; "Code"; Code[200])
        {
            Caption = 'Code';
        }
        field(2; "ECD Buffer"; Enum ECD)
        {
            Caption = 'ECD Buffer';
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
        fieldgroup(dropdown; Code, "ECD Buffer")
        {

        }
    }
}
