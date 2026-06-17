table 50048 "OutLook Integration to BC"
{
    Caption = 'OutLook Integration to BC';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[100])
        {
        }
        field(2; "Microsoft Graph Outlook Events URL"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Microsoft Graph Token"; Text[2048])
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
}
