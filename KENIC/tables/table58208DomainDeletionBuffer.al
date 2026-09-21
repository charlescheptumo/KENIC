table 58208 "Domain Deletion Buffer"
{
    Caption = 'Domain Deletion Buffer';
    TableType = Temporary;
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Registrar Roid"; Code[50]) { Caption = 'Registrar ROID'; }
        field(2; Year; Integer) { Caption = 'Year'; }
        field(3; "Month No."; Integer) { Caption = 'Month No.'; }
        field(4; "Registrar Name"; Text[150]) { Caption = 'Registrar Name'; }
        field(5; "Month Name"; Text[10]) { Caption = 'Month'; }
        field(6; "Registration Count"; Integer) { Caption = 'Registration Count'; }
        field(7; "Renewal Count"; Integer) { Caption = 'Renewal Count'; }
        field(8; "Deleted Count"; Integer) { Caption = 'Deleted Count'; }
    }

    keys
    {
        key(PK; "Registrar Roid", Year, "Month No.") { Clustered = true; }
        key(Sorting; "Registrar Name", Year, "Month No.") { }
    }
}