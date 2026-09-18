table 58207 "Domain Acct Mgr Buffer"
{
    Caption = 'Domain Account Manager Buffer';
    TableType = Temporary;
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Salesperson Code"; Code[20]) { Caption = 'Salesperson Code'; }
        field(2; "Section Code"; Code[20]) { Caption = 'Section Code'; }
        field(3; Year; Integer) { Caption = 'Year'; }
        field(4; "Month No."; Integer) { Caption = 'Month No.'; }
        field(5; "Line No."; Integer) { Caption = 'Line No.'; }
        field(6; "Section Description"; Text[50]) { Caption = 'Section Description'; }
        field(7; "Month Name"; Text[10]) { Caption = 'Month'; }
        field(8; "Target Qty"; Decimal) { Caption = 'Target Qty'; }
        field(9; "Actual Qty"; Decimal) { Caption = 'Actual Qty'; }
        field(10; "% Achieved"; Decimal) { Caption = '% Achieved'; DecimalPlaces = 2 : 2; }
        field(11; "Line Type"; Integer) { Caption = 'Line Type'; }
        field(12; Qty; Decimal) { Caption = 'Qty'; }
        field(13; "Qty Format"; Text[20]) { Caption = 'Qty Format'; }
    }

    keys
    {
       // key(PK; "Salesperson Code", "Section Code", Year, "Month No.") { Clustered = true; }
       key(PK; "Salesperson Code", "Section Code", Year, "Month No.", "Line Type") { Clustered = true; }
        key(Sorting; "Line No.", Year, "Month No.") { }
    }
}