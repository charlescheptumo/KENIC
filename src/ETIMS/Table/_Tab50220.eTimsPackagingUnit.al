/// <summary>
/// Stores eTIMS packaging unit setup codes (code, name, description) used to classify packaging units for eTIMS reporting.
/// </summary>
table 50220 "eTims-Packaging Unit"
{
    Caption = 'eTims-Packaging Unit';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; "Code Name"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Description"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Code", "Code Name")
        {
            Clustered = true;
        }
    }
}
