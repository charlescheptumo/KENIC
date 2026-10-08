/// <summary>
/// Lookup table of eTIMS payment method codes (code, name, description) used to classify sales transactions for KRA eTIMS reporting.
/// </summary>
table 50223 "eTims-Payment Methods"
{
    Caption = 'eTims-Payment Methods';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; "Code Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Code Description"; Text[150])
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
