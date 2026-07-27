table 58124 "Board Meeting Agenda"
{
    Caption = 'Board Meeting Agenda';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Meeting No."; Code[20])
        {
            Caption = 'Meeting No.';
            DataClassification = CustomerContent;
            TableRelation = "Board Meetings"."No";
        }

        field(2; "Agenda No."; Code[20])
        {
            Caption = 'Agenda No.';
            DataClassification = CustomerContent;
        }

        field(3; "Topic / Title"; Text[250])
        {
            Caption = 'Topic / Title';
            DataClassification = CustomerContent;
        }

        field(4; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }

        field(5; "Conflict Exists"; Boolean)
        {
            Caption = 'Conflict Exists';
            //StyleExpr = ConflictStyle;
            FieldClass = FlowField;
            CalcFormula = exist(
        "Board Meeting Conflict"
        where(
            "Meeting No." = field("Meeting No."),
            "Agenda No." = field("Agenda No.")
        ));
            Editable = false;

        }
    }

    keys
    {
        key(PK; "Meeting No.", "Agenda No.")
        {
            Clustered = true;
        }
    }
}