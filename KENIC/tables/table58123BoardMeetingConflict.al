table 58123 "Board Meeting Conflict"
{
    Caption = 'Board Meeting Conflict';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Meeting No."; Code[20])
        {
            Caption = 'Meeting No.';
            DataClassification = CustomerContent;
            TableRelation = "Board Meetings".No;
        }

        field(2; "Agenda No."; Code[20])
        {
            Caption = 'Agenda No.';
            DataClassification = CustomerContent;

            TableRelation = "Board Meeting Agenda"."Agenda No." where("Meeting No." = field("Meeting No."));
        }

        field(3; "Board Member No."; Code[20])
        {
            Caption = 'Board Member No.';
            DataClassification = CustomerContent;
            TableRelation = "Board Members"."Personal No";
        }

        field(4; "Declaration No."; Code[20])
        {
            Caption = 'Declaration No.';
            DataClassification = CustomerContent;

            TableRelation = "Board Declaration Header"."No." where("Board Member No." = field("Board Member No."), "Declaration Status" = const(Approved));

            trigger OnValidate()
            var
                DeclHeader: Record "Board Declaration Header";
            begin
                if DeclHeader.Get("Declaration No.") then begin
                    Rec."Board Member No." := DeclHeader."Board Member No.";
                end;
            end;
        }

        field(5; "Conflict Type"; Enum "Meeting Conflict Type")
        {
            Caption = 'Conflict Type';
            DataClassification = CustomerContent;
        }

        field(6; "Comments"; Text[250])
        {
            Caption = 'Meeting Specific Notes / Recusal Details';
            DataClassification = CustomerContent;
        }

        field(7; "Board Member Name"; Text[250])
        {
            Caption = 'Board Member Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Board Members"."First Name" where("Personal No" = field("Board Member No.")));
            Editable = false;
        }

        field(8; "Declaration Date"; Date)
        {
            Caption = 'Declaration Date';
            FieldClass = FlowField;
            CalcFormula = lookup("Board Declaration Header"."Declaration Date" where("No." = field("Declaration No.")));
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Meeting No.", "Agenda No.", "Board Member No.", "Declaration No.")
        {
            Clustered = true;
        }
    }
}