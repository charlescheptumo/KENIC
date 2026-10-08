/// <summary>
/// Lookup table of sales type codes (with description) used to classify sales transactions, with drill-down/lookup provided by the "Sales Type" page.
/// </summary>
table 60015 "Sales Type Code"
{
    Caption = 'Sales Type Code';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Sales Type";
    LookupPageId = "Sales Type";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
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
