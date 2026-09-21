table 58212 "Domain DUM Statistics"
{
    Caption = 'Domain Under Management Statistics';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Registrar Roid"; Code[50]) { Caption = 'Registrar ROID'; }
        field(2; "As Of Date"; Date) { Caption = 'As Of Date'; }
        field(3; "Registrar Name"; Text[150]) { Caption = 'Registrar Name'; }
        field(4; "DUM Count"; Integer) { Caption = 'DUM Count'; }
        field(5; "Last Updated"; DateTime) { Caption = 'Last Updated'; }
    }

    keys
    {
        key(PK; "Registrar Roid", "As Of Date") { Clustered = true; }
        key(Sorting; "As Of Date", "Registrar Name") { }
    }
}