/// <summary>
/// Table Driver Incident Types (ID 50092).
/// </summary>
table 50092 "Driver Incident Types"
{
    Caption = 'Driver Incident Types';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Driver Incident Type List";
    LookupPageId = "Driver Incident Type List";

    fields
    {
        field(1; "Code"; Code[100])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[500])
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
