table 58205 "Domain Zone Statistics"
{
    Caption = 'Domain Zone Statistics';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer) { AutoIncrement = true; }
        field(2; Year; Integer) { Caption = 'Year'; }
        field(3; "Month No."; Integer) { Caption = 'Month No.'; }
        field(4; "Month Name"; Text[3]) { Caption = 'Month'; }
        field(5; "Zone Code"; Code[20]) { Caption = 'Zone Code'; }
        field(6; "Zone Description"; Text[100]) { Caption = 'Zone Description'; }
        field(7; "Domain Count"; Integer) { Caption = 'Domain Count'; }
        field(8; Percentage; Decimal) { Caption = 'Percentage'; DecimalPlaces = 1 : 1; }
        field(9; "Last Updated"; DateTime) { Caption = 'Last Updated'; }
    }

    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
        key(YearMonthZone; Year, "Month No.", "Zone Code") { }
    }
}