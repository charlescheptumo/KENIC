table 50186 "Domain Adjustment"
{
    Caption = 'Domain Adjustment';
    DataClassification = CustomerContent;
    fields
    {
        field(1; AdjustmentId; BigInteger) { Caption = 'Adjustment ID'; }
        field(2; Roid; Code[50]) { Caption = 'ROID'; }
        field(3; LedgerId; BigInteger) { Caption = 'Ledger ID'; }
        field(4; AdjustmentDate; DateTime) { Caption = 'Adjustment Date'; }
        field(5; Amount; Decimal) { Caption = 'Amount'; DecimalPlaces = 2 : 5; }
        field(6; TransactionId; BigInteger) { Caption = 'Transaction ID'; }
        field(7; Narration; Text[2048]) { Caption = 'Narration'; }
        field(8; Details; Blob) { Caption = 'Details'; SubType = Memo; }
        field(9; RawJsonPayload; Blob) { Caption = 'Raw JSON Payload'; SubType = Memo; }
        field(10; LastUpdatedAt; DateTime) { Caption = 'Last Updated At'; }
        field(11; LastUpdatedBy; Code[50]) { Caption = 'Last Updated By'; }
    }
    keys
    {
        key(PK; AdjustmentId) { Clustered = true; }
        key(DateKey; AdjustmentDate, AdjustmentId) { }
        key(RoidKey; Roid, AdjustmentDate) { }
        key(LedgerKey; LedgerId) { }
    }
    fieldgroups
    {
        fieldgroup(DropDown; AdjustmentId, Roid, AdjustmentDate, Amount) { }
    }
}
