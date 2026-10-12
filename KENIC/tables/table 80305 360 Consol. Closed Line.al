
table 80305 "360 Consol. Closed Line"
{
    Caption = '360 Consolidated Closed Line';
    DrillDownPageId = "360 Consol. Closed Lines";
    LookupPageId = "360 Consol. Closed Lines";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Evaluatee Employee No."; Code[50])
        {
            Caption = 'Evaluatee Employee No.';
        }
        field(2; "Year Reporting Code"; Code[50])
        {
            Caption = 'Year Reporting Code';
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "Question Entry No."; Integer)
        {
            Caption = 'Question Entry No.';
        }
        field(5; "Question Text"; Text[500])
        {
            Caption = 'Question';
        }
        field(6; "Total Score"; Decimal)
        {
            Caption = 'Total Score';
        }
        field(7; "Response Count"; Integer)
        {
            Caption = 'Responses';
        }
        field(8; "Average Score"; Decimal)
        {
            Caption = 'Average Score (Others)';
            DecimalPlaces = 0 : 2;
        }
        field(9; "Self Score"; Decimal)
        {
            Caption = 'Self Score';
            DecimalPlaces = 0 : 2;
        }
    }

    keys
    {
        key(PK; "Evaluatee Employee No.", "Year Reporting Code", "Line No.")
        {
            Clustered = true;
        }
        key(Question; "Evaluatee Employee No.", "Year Reporting Code", "Question Entry No.")
        {
        }
    }
}



