/// <summary>
/// Stores eTIMS product type setup codes (code, name, description) used to classify products for eTIMS reporting.
/// </summary>
table 50218 "eTims-Product Type"
{
    Caption = 'eTims-Product Type';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[2])
        {
            Caption = 'Code';
            //AutoIncrement = true;
        }
        field(2; "Code Name"; Text[50])
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
