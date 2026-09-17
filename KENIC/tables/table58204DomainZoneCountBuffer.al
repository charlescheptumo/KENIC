table 58204 "Domain Zone Count Buffer"
{
    Caption = 'Domain Zone Count Buffer';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Zone Code"; Code[20]) { Caption = 'Zone Code'; }
        field(2; "Line No."; Integer) { Caption = 'Line No.'; }
        field(3; "Zone Description"; Text[100]) { Caption = 'Zone Description'; }

        field(10; Jan; Integer) { Caption = 'Jan'; }
        field(11; Feb; Integer) { Caption = 'Feb'; }
        field(12; Mar; Integer) { Caption = 'Mar'; }
        field(13; Apr; Integer) { Caption = 'Apr'; }
        field(14; May; Integer) { Caption = 'May'; }
        field(15; Jun; Integer) { Caption = 'Jun'; }
        field(16; Jul; Integer) { Caption = 'Jul'; }
        field(17; Aug; Integer) { Caption = 'Aug'; }
        field(18; Sep; Integer) { Caption = 'Sep'; }
        field(19; Oct; Integer) { Caption = 'Oct'; }
        field(20; Nov; Integer) { Caption = 'Nov'; }
        field(21; Dec; Integer) { Caption = 'Dec'; }

        field(30; "Jan %"; Decimal) { Caption = 'Jan %'; DecimalPlaces = 1 : 1; }
        field(31; "Feb %"; Decimal) { Caption = 'Feb %'; DecimalPlaces = 1 : 1; }
        field(32; "Mar %"; Decimal) { Caption = 'Mar %'; DecimalPlaces = 1 : 1; }
        field(33; "Apr %"; Decimal) { Caption = 'Apr %'; DecimalPlaces = 1 : 1; }
        field(34; "May %"; Decimal) { Caption = 'May %'; DecimalPlaces = 1 : 1; }
        field(35; "Jun %"; Decimal) { Caption = 'Jun %'; DecimalPlaces = 1 : 1; }
        field(36; "Jul %"; Decimal) { Caption = 'Jul %'; DecimalPlaces = 1 : 1; }
        field(37; "Aug %"; Decimal) { Caption = 'Aug %'; DecimalPlaces = 1 : 1; }
        field(38; "Sep %"; Decimal) { Caption = 'Sep %'; DecimalPlaces = 1 : 1; }
        field(39; "Oct %"; Decimal) { Caption = 'Oct %'; DecimalPlaces = 1 : 1; }
        field(40; "Nov %"; Decimal) { Caption = 'Nov %'; DecimalPlaces = 1 : 1; }
        field(41; "Dec %"; Decimal) { Caption = 'Dec %'; DecimalPlaces = 1 : 1; }

        field(50; Total; Integer) { Caption = 'Total'; }
        field(51; "Total %"; Decimal) { Caption = 'Total %'; DecimalPlaces = 1 : 1; }
    }

    keys
    {
        key(PK; "Zone Code") { Clustered = true; }
        key(Sorting; "Line No.") { }
    }
}