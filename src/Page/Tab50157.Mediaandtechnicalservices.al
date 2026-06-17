table 50157 "Media and technical services"
{
    Caption = 'Media and technical services';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[200])
        {
            Caption = 'Code';
        }
        field(2; "Media and technical services Buffer"; Enum "Media and technical services")
        {
            Caption = 'Media and technical services Buffer';
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
        fieldgroup(dropdown; Code, "Media and technical services Buffer")
        {

        }
    }
}
