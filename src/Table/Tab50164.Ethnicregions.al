table 50164 "Ethnic Region"
{
    Caption = 'Ethnic Region';
    DataClassification = ToBeClassified;
    LookupPageId = "Ethnic Regions";
    DrillDownPageId = "Ethnic Regions";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; "Name"; Text[100])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(3; "Description"; Text[250])
        {
            Caption = 'Description';
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