table 58213 "Domain DUM Buffer"
{
    Caption = 'Domain Under Management Buffer';
    TableType = Temporary;
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Registrar Roid"; Code[50]) { Caption = 'Registrar ROID'; }
        field(2; "Line No."; Integer) { Caption = 'Line No.'; }
        field(3; "Registrar Name"; Text[150]) { Caption = 'Registrar Name'; }
        field(4; "DUM Count"; Integer) { Caption = 'DUM Count'; }
    }

    keys
    {
        key(PK; "Registrar Roid") { Clustered = true; }
        key(Sorting; "Line No.") { }
    }
}