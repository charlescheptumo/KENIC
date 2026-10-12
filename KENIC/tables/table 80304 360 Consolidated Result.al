// =====================================================================
// 360 CONSOLIDATION - NEW OBJECTS (same pattern as "Consolidate Annual Workplan")
// Evaluation (one per evaluator)  --Consolidate button-->  Consolidated Result (one per evaluatee per year)
// Adjust the object IDs to your free range.
// =====================================================================

table 80304 "360 Consolidated Result"
{
    Caption = '360 Consolidated Result';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Evaluatee Employee No."; Code[50])
        {
            Caption = 'Evaluatee Employee No.';
            TableRelation = Employee."No.";
        }
        field(2; "Year Reporting Code"; Code[50])
        {
            Caption = 'Year Reporting Code';
            TableRelation = "Annual Reporting Codes".Code;
        }
        field(3; "Evaluatee Name"; Text[255])
        {
            Caption = 'Evaluatee Name';
        }
        field(4; "Evaluatee Category"; Enum "360 Category")
        {
            Caption = 'Evaluatee Category';
        }
        field(5; "No. of Responses"; Integer)
        {
            Caption = 'No. of Responses';
            Editable = false;
        }
        field(6; "Self Responses"; Integer)
        {
            Caption = 'Self Responses';
            Editable = false;
        }
        field(7; "Overall Average"; Decimal)
        {
            Caption = 'Overall Average (Others)';
            Editable = false;
            DecimalPlaces = 0 : 2;
            FieldClass = FlowField;
            CalcFormula = average("360 Consol. Closed Line"."Average Score" where("Evaluatee Employee No." = field("Evaluatee Employee No."),
                                                                                  "Year Reporting Code" = field("Year Reporting Code"),
                                                                                  "Response Count" = filter(> 0)));
        }
        field(8; "Self Average"; Decimal)
        {
            Caption = 'Self Average';
            Editable = false;
            DecimalPlaces = 0 : 2;
            FieldClass = FlowField;
            CalcFormula = average("360 Consol. Closed Line"."Self Score" where("Evaluatee Employee No." = field("Evaluatee Employee No."),
                                                                               "Year Reporting Code" = field("Year Reporting Code"),
                                                                               "Self Score" = filter(> 0)));
        }
        field(9; "Last Consolidated On"; Date)
        {
            Caption = 'Last Consolidated On';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Evaluatee Employee No.", "Year Reporting Code")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    var
        ConsClosed: Record "360 Consol. Closed Line";
        ConsOpen: Record "360 Consol. Open Line";
    begin
        ConsClosed.SetRange("Evaluatee Employee No.", "Evaluatee Employee No.");
        ConsClosed.SetRange("Year Reporting Code", "Year Reporting Code");
        ConsClosed.DeleteAll();
        ConsOpen.SetRange("Evaluatee Employee No.", "Evaluatee Employee No.");
        ConsOpen.SetRange("Year Reporting Code", "Year Reporting Code");
        ConsOpen.DeleteAll();
    end;
}

table 80305 "360 Consol. Closed Line"
{
    Caption = '360 Consolidated Closed Line';
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



