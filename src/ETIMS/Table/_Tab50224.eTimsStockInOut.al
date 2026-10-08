/// <summary>
/// Lookup table of eTIMS stock movement (in/out) codes used to classify inventory transactions for KRA eTIMS stock reporting.
/// </summary>
table 50224 "eTims-Stock In Out"
{
    Caption = 'eTims-Stock In Out';
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
        field(3; "Code Description"; Text[200])
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
