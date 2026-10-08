/// <summary>
/// Stores import declaration item data (customs declaration, HS code, origin/export country, package/quantity, weight, supplier/agent, invoice amount, exchange rate) reported to eTIMS.
/// </summary>
table 50207 "eTims-Import Item"
{
    Caption = 'ETIMS Import Item';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Task Code"; Code[20]) { }
        field(2; "Declaration Date"; Text[20]) { }
        field(3; "Item Seq"; Integer) { }
        field(4; "Declaration No"; Text[50]) { }
        field(5; "HS Code"; Code[20]) { }
        field(6; "Item Name"; Text[150]) { }
        field(7; "Import Status"; Code[10]) { }
        field(8; "Origin Country"; Code[10]) { }
        field(9; "Export Country"; Code[10]) { }
        field(10; Package; Decimal) { }
        field(11; "Package Unit"; Code[10]) { }
        field(12; Quantity; Decimal) { }
        field(13; "Qty Unit"; Code[10]) { }
        field(14; "Total Weight"; Decimal) { }
        field(15; "Net Weight"; Decimal) { }
        field(16; Supplier; Text[150]) { }
        field(17; Agent; Text[150]) { }
        field(18; "Invoice Amount"; Decimal) { }
        field(19; "Currency"; Code[10]) { }
        field(20; "Exchange Rate"; Decimal) { }
    }

    keys
    {
        key(PK; "Task Code", "Item Seq")
        {
            Clustered = true;
        }
    }
}
