table 50190 "CoCCA Write Request"
{
    Caption = 'CoCCA Write Request';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Entry No."; Integer) { Caption = 'Entry No.'; AutoIncrement = true; }
        field(2; "Operation"; Enum "CoCCA Write Operation") { Caption = 'Operation'; }
        field(3; "Status"; Enum "CoCCA Write State") { Caption = 'Status'; }
        field(4; "Roid"; Text[50]) { Caption = 'Registrar ROID'; }
        field(5; "Target Ledger ID"; BigInteger) { Caption = 'Target Ledger ID'; }
        field(6; "Posting DateTime"; DateTime) { Caption = 'Adjustment / Receipt Date'; }
        field(7; "Amount"; Decimal) { Caption = 'Amount'; DecimalPlaces = 2 : 5; }
        field(8; "Transaction ID"; Integer) { Caption = 'Adjustment Transaction ID'; }
        field(9; "Narration"; Text[2048]) { Caption = 'Narration'; }
        field(10; "Details"; Text[2048]) { Caption = 'Details'; }
        field(11; "Requested By"; Text[100]) { Caption = 'Requested By'; }
        field(12; "BC Reference"; Text[100]) { Caption = 'BC Reference'; }
        field(13; "Payment Channel"; Enum "CoCCA Payment Channel") { Caption = 'Payment Channel'; }
        field(14; "Cheque DateTime"; DateTime) { Caption = 'Cheque DateTime'; }
        field(15; "Cheque Number"; Text[100]) { Caption = 'Cheque Number / Unique Reference'; }
        field(16; "Mpesa API ID"; Integer) { Caption = 'M-Pesa API ID'; }
        field(17; "In Words"; Text[250]) { Caption = 'In Words'; }
        field(18; "VAT Withheld"; Boolean) { Caption = 'VAT Withheld'; }
        field(19; "VAT Certificate No."; Text[100]) { Caption = 'VAT Certificate No.'; }
        field(20; "Voided"; Boolean) { Caption = 'Voided'; }
        field(21; "Void DateTime"; DateTime) { Caption = 'Void DateTime'; }
        field(22; "SMS Transaction ID"; Text[100]) { Caption = 'SMS Transaction ID'; }
        field(23; "Mpesa Transaction ID"; Text[100]) { Caption = 'M-Pesa Transaction ID'; }
        field(24; "HTTP Status"; Integer) { Caption = 'HTTP Status'; }
        field(25; "Remote Record ID"; BigInteger) { Caption = 'Remote Adjustment / Receipt ID'; }
        field(26; "Remote Ledger ID"; BigInteger) { Caption = 'Returned Adjustment Ledger ID'; }
        field(27; "Credit Note ID"; BigInteger) { Caption = 'Credit Note ID'; }
        field(28; "Last Message"; Text[2048]) { Caption = 'Last Message'; }
        field(29; "Request Payload"; Blob) { Caption = 'Request Payload'; SubType = Memo; }
        field(30; "Response Payload"; Blob) { Caption = 'Response Payload'; SubType = Memo; }
        field(31; "Status Response"; Blob) { Caption = 'Latest Reversal Status Response'; SubType = Memo; }
        field(32; "Attempted At"; DateTime) { Caption = 'Attempted At'; }
        field(33; "Status Checked At"; DateTime) { Caption = 'Status Checked At'; }
        field(34; "Status HTTP Code"; Integer) { Caption = 'Status HTTP Code'; }
        field(35; "Status Message"; Text[2048]) { Caption = 'Status Message'; }
    }
    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
        key(StatusKey; Status, "Entry No.") { }
        key(LedgerKey; Operation, "Target Ledger ID") { }
    }
    trigger OnModify()
    begin
        // UI edits use triggers; integration routines deliberately use Modify(false).
        if xRec.Status <> xRec.Status::Draft then
            Error('An attempted request is read-only.');
    end;

    trigger OnDelete()
    begin
        if Status <> Status::Draft then
            Error('An attempted CoCCA request cannot be deleted.');
    end;
}
