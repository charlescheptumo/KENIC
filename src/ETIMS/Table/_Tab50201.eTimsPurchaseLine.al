/// <summary>
/// Stores purchase invoice line data (item, quantity, price, tax, amounts) reported to eTIMS, keyed by supplier TIN, invoice number and item sequence.
/// </summary>
table 50201 "eTims-Purchase Line"
{
    Caption = 'eTims-Purchase Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Supplier TIN"; Code[20]) { }
        field(2; "Invoice No"; Integer) { }
        field(3; "Item Seq"; Integer) { }
        field(4; "Item Code"; Code[30]) { }
        field(5; "Item Name"; Text[100]) { }
        field(6; Qty; Decimal) { }
        field(7; Price; Decimal) { }
        field(8; "Supply Amount"; Decimal) { }
        field(9; "Tax Amount"; Decimal) { }
        field(10; "Total Amount"; Decimal) { }
    }

    keys
    {
        key(PK; "Supplier TIN", "Invoice No", "Item Seq")
        {
            Clustered = true;
        }
    }
}
