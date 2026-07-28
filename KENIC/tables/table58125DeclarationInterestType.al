table 58125 "Declaration Interest Type"
{
    Caption = 'Declaration Interest Type';
    DataClassification = CustomerContent;
    LookupPageId = "Declaration Interest Types";
    DrillDownPageId = "Declaration Interest Types";

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

        field(3; "Blocked"; Boolean)
        {
            Caption = 'Blocked';
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