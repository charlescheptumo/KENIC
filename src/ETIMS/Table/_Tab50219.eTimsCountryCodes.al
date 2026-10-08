/// <summary>
/// Stores eTIMS country code setup data (code, country name, description) used for origin/export country classification in eTIMS reporting.
/// </summary>
table 50219 "eTims-Country Codes"
{
    Caption = 'County Codes';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; "Country Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Description"; Text[150])
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
