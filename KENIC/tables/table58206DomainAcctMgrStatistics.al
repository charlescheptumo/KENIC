table 58206 "Domain Acct Mgr Statistics"
{
    Caption = 'Domain Account Manager Statistics';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Salesperson Code"; Code[20]) { Caption = 'Salesperson Code'; }
        field(2; Year; Integer) { Caption = 'Year'; }
        field(3; "Month No."; Integer) { Caption = 'Month No.'; }
        field(4; "Month Name"; Text[10]) { Caption = 'Month'; }
        field(5; "Section Code"; Code[20]) { Caption = 'Section Code'; }
        field(6; "Section Description"; Text[50]) { Caption = 'Section Description'; }
        field(7; "Target Qty"; Decimal) { Caption = 'Target Qty'; }
        field(8; "Actual Qty"; Decimal) { Caption = 'Actual Qty'; }
        field(9; "% Achieved"; Decimal) { Caption = '% Achieved'; DecimalPlaces = 2 : 2; }
        field(10; "Last Updated"; DateTime) { Caption = 'Last Updated'; }
    }

    keys
    {
        key(PK; "Salesperson Code", Year, "Month No.", "Section Code") { Clustered = true; }
        key(Sorting; Year, "Month No.", "Section Code", "Salesperson Code") { }
    }
}