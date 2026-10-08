/// <summary>
/// Stores purchase invoice header data (supplier TIN, invoice number, supplier name, branch, receipt/payment type, dates, total amount/tax, remarks) reported to eTIMS.
/// </summary>
table 50211 "eTims-Purchase Header"
{
    Caption = 'eTims-Purchase Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Supplier TIN"; Code[20]) { }
        field(2; "Invoice No"; Integer) { }
        field(3; "Supplier Name"; Text[100]) { }
        field(4; "Branch Id"; Code[10]) { }
        field(5; "Receipt Type"; Code[10]) { }
        field(6; "Payment Type"; Code[10]) { }
        field(7; "Confirm Date"; Text[30]) { }
        field(8; "Sales Date"; Text[20]) { }
        field(9; "Total Amount"; Decimal) { }
        field(10; "Total Tax"; Decimal) { }
        field(11; Remark; Text[100]) { }
    }

    keys
    {
        key(PK; "Supplier TIN", "Invoice No")
        {
            Clustered = true;
        }
    }
}
