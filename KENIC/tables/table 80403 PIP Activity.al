table 80403 "PIP Activity"
{
    Caption = 'PIP Activity';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "PIP No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "PIP Header".No;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Goal Line No."; Integer)
        {
            Caption = 'Improvement Goal';
            DataClassification = ToBeClassified;
            TableRelation = "PIP Improvement Goal"."Line No." where("PIP No." = field("PIP No."));
        }
        field(4; "Goal Description"; Text[500])
        {
            Caption = 'Goal Description';
            FieldClass = FlowField;
            CalcFormula = lookup("PIP Improvement Goal".Description where("PIP No." = field("PIP No."),
                                                                          "Line No." = field("Goal Line No.")));
            Editable = false;
        }
        field(5; Requirement; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "How to Accomplish"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                CheckDates();
            end;
        }
        field(8; "End Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                CheckDates();
            end;
        }
    }

    keys
    {
        key(Key1; "PIP No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        Line: Record "PIP Activity";
    begin
        if "Line No." = 0 then begin
            Line.SetRange("PIP No.", "PIP No.");
            if Line.FindLast() then
                "Line No." := Line."Line No." + 10000
            else
                "Line No." := 10000;
        end;
    end;

    local procedure CheckDates()
    begin
        if ("Start Date" <> 0D) and ("End Date" <> 0D) then
            if "End Date" < "Start Date" then
                Error('End Date cannot be earlier than Start Date.');
    end;
}
