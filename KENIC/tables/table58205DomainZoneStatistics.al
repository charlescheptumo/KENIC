table 58205 "Domain Zone Statistics"
{
    Caption = 'Domain Zone Statistics';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Year; Integer) { Caption = 'Year'; }
        field(2; "Month No."; Integer) { Caption = 'Month No.'; }
        field(3; "Zone Code"; Code[20]) { Caption = 'Zone Code'; }
        field(4; "Month Name"; Text[10]) { Caption = 'Month'; }
        field(5; "Zone Description"; Text[100]) { Caption = 'Zone Description'; }
        field(6; "Domain Count"; Integer) { Caption = 'Domain Count'; }
        field(7; Percentage; Decimal) { Caption = 'Percentage'; DecimalPlaces = 1 : 1; }
        field(8; "Last Updated"; DateTime) { Caption = 'Last Updated'; }
    }

    keys
    {
        key(PK; Year, "Month No.", "Zone Code") { Clustered = true; }
        key(ZoneSort; "Zone Code", Year, "Month No.") { }
    }
}