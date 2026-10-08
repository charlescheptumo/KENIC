/// <summary>
/// Stores eTIMS taxation type setup codes (code, name, rate) used to classify VAT/tax rates for eTIMS reporting.
/// </summary>
table 50216 "eTims-Taxation Type"
{
    Caption = 'eTims-Taxation Type';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; "Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Rate"; Decimal)
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
