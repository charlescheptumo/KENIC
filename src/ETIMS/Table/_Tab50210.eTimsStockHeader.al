/// <summary>
/// Stores stock movement (SAR/Stock Adjustment Report) header data (customer TIN/branch ID, SAR number, occurrence date, item count, taxable/tax/total amounts) reported to eTIMS for stock in/out tracking.
/// </summary>
table 50210 "eTims-Stock Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer TIN"; Text[20]) { }
        field(2; "Customer Branch ID"; Text[10]) { }
        field(3; "SAR No"; Integer) { }

        field(4; "Occurrence Date"; Text[20]) { }

        field(5; "Total Item Count"; Integer) { }
        field(6; "Total Taxable Amount"; Decimal) { }
        field(7; "Total Tax Amount"; Decimal) { }
        field(8; "Total Amount"; Decimal) { }

        field(9; "Remark"; Text[100]) { }
    }

    keys
    {
        key(PK; "Customer TIN", "Customer Branch ID", "SAR No")
        {
            Clustered = true;
        }
    }
}
