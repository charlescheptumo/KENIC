table 58120 "Compliance Legislation"
{
    DataClassification = ToBeClassified;
    Caption = 'Compliance Legislation';
    LookupPageId = "Compliance Legislation List";
    DrillDownPageId = "Compliance Legislation List";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(2; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "Authority"; Text[100])
        {
            Caption = 'Authority';
            DataClassification = CustomerContent;
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