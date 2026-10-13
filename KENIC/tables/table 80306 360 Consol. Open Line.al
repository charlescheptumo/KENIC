table 80306 "360 Consol. Open Line"
{
    Caption = '360 Consolidated Open Line';
    DrillDownPageId = "360 Consol. Open Lines"; 
    LookupPageId = "360 Consol. Open Lines";
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
        field(6; "Response Text"; Text[2048])
        {
            Caption = 'Response';
        }
        field(7; "Self Response"; Boolean)
        {
            Caption = 'Self Response';
        }
    }

    keys
    {
        key(PK; "Evaluatee Employee No.", "Year Reporting Code", "Line No.")
        {
            Clustered = true;
        }
        key(Question; "Evaluatee Employee No.", "Year Reporting Code", "Question Entry No.", "Line No.")
        {
        }
    }
}