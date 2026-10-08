/// <summary>
/// Lookup table of invoice status codes (with description) used to track invoice state, with drill-down/lookup provided by the "Invoice Status" page.
/// </summary>
table 60016 "Invoice Status Code"
{
    Caption = 'Invoice Status Code';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Invoice Status";
    LookupPageId = "Invoice Status";

    fields
    {
        field(1; "Code"; Code[30])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[200])
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
