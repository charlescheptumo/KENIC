table 80406 "PIP Checkpoint"
{
    Caption = 'PIP Checkpoint';
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
        field(3; "Scheduled Date"; Date)
        {
            Caption = 'Date Scheduled';
            DataClassification = ToBeClassified;
        }
        field(4; Activity; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Conducted By"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Completed; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Completed then begin
                    if "Completion Date" = 0D then
                        "Completion Date" := Today;
                end else
                    "Completion Date" := 0D;
            end;
        }
        field(7; "Completion Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Comments; Text[250])
        {
            DataClassification = ToBeClassified;
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
        Line: Record "PIP Checkpoint";
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
