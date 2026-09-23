table 58214 "Domain Registration Statistics"
{
    Caption = 'Domain Registration Statistics';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Registrar Roid"; Code[50]) { Caption = 'Registrar ROID'; }
        field(2; Year; Integer) { Caption = 'Year'; }
        field(3; "Month No."; Integer) { Caption = 'Month No.'; }
        field(4; "Month Name"; Text[10]) { Caption = 'Month'; }
        field(5; "Registrar Name"; Text[150]) { Caption = 'Registrar Name'; }
        field(6; "Registration Count"; Integer) { Caption = 'Registration Count'; }
        field(7; "Last Updated"; DateTime) { Caption = 'Last Updated'; }
    }

    keys
    {
        key(PK; "Registrar Roid", Year, "Month No.") { Clustered = true; }
        key(Sorting; Year, "Month No.", "Registrar Name") { }
    }
}