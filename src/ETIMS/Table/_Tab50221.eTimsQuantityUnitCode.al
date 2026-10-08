/// <summary>
/// Stores eTIMS quantity unit setup codes (code, name, description) used to classify quantity units for eTIMS reporting.
/// </summary>
table 50221 "eTims-Quantity Unit Code"
{
    Caption = 'eTims-Quantity Unit';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; "Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Description"; Text[200])
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