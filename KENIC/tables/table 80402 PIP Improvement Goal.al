table 80402 "PIP Improvement Goal"
{
    Caption = 'PIP Improvement Goal';
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
        field(3; Description; Text[500])
        {
            Caption = 'Improvement Goal (Deliverable)';
            DataClassification = ToBeClassified;
        }
        field(4; "Linked Area Line No."; Integer)
        {
            Caption = 'Linked Area of Concern';
            DataClassification = ToBeClassified;
            TableRelation = "PIP Area of Concern"."Line No." where("PIP No." = field("PIP No."));
        }
        field(5; "Linked Area Description"; Text[250])
        {
            Caption = 'Area of Concern';
            FieldClass = FlowField;
            CalcFormula = lookup("PIP Area of Concern"."Area Description" where("PIP No." = field("PIP No."),
                                                                                "Line No." = field("Linked Area Line No.")));
            Editable = false;
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
        Line: Record "PIP Improvement Goal";
    begin
        if "Line No." = 0 then begin
            Line.SetRange("PIP No.", "PIP No.");
            if Line.FindLast() then
                "Line No." := Line."Line No." + 10000
            else
                "Line No." := 10000;
        end;
    end;
}
