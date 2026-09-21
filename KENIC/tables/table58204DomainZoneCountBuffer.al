table 58204 "Domain Zone Count Buffer"
{
    Caption = 'Domain Zone Count Buffer';
    TableType = Temporary;
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Zone Code"; Code[20]) { Caption = 'Zone Code'; }
        field(2; "Month No."; Integer) { Caption = 'Month No.'; } // 1 to 12
        field(3; "Line No."; Integer) { Caption = 'Line No.'; }
        field(4; "Zone Description"; Text[100]) { Caption = 'Zone Description'; }
        field(5; "Month Name"; Text[20]) { Caption = 'Month Name'; } // e.g., "Jan", "Feb"
        field(10; Count; Integer) { Caption = 'Count'; }
        field(11; "Percentage"; Decimal) { Caption = 'Percentage'; DecimalPlaces = 1 : 2; }
    }

    keys
    {
        key(PK; "Zone Code", "Month No.") { Clustered = true; }
        key(Sorting; "Line No.", "Month No.") { }
    }
}