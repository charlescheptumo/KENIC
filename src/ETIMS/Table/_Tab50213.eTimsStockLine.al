/// <summary>
/// Stores stock movement (SAR) line data (item, package/quantity, price, discount, taxable amount, tax type/amount, total amount) per eTims-Stock Header record reported to eTIMS.
/// </summary>
table 50213 "eTims-Stock Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer TIN"; Text[20]) { }
        field(2; "Customer Branch ID"; Text[10]) { }
        field(3; "SAR No"; Integer) { }
        field(4; "Item Seq"; Integer) { }

        field(5; "Item Code"; Text[50]) { }
        field(6; "Item Class Code"; Text[50]) { }
        field(7; "Item Name"; Text[100]) { }
        field(8; "Barcode"; Text[50]) { }

        field(9; "Package Unit"; Text[10]) { }
        field(10; "Package"; Decimal) { }

        field(11; "Qty Unit"; Text[10]) { }
        field(12; "Quantity"; Decimal) { }

        field(13; "Price"; Decimal) { }
        field(14; "Supply Amount"; Decimal) { }
        field(15; "Discount Amount"; Decimal) { }
        field(16; "Taxable Amount"; Decimal) { }

        field(17; "Tax Type"; Text[10]) { }
        field(18; "Tax Amount"; Decimal) { }
        field(19; "Total Amount"; Decimal) { }
    }

    keys
    {
        key(PK; "Customer TIN", "Customer Branch ID", "SAR No", "Item Seq")
        {
            Clustered = true;
        }
    }
}
