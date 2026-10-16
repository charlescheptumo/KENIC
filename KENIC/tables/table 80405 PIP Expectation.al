table 80405 "PIP Expectation"
{
    Caption = 'PIP Expectation';
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
        field(3; "Requirement/Task"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Timeline Date"; Date)
        {
            Caption = 'Timeline (Date and Month)';
            DataClassification = ToBeClassified;
        }
        field(5; "Reporting Frequency"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Weekly,Monthly';
            OptionMembers = Weekly,Monthly;
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
        Line: Record "PIP Expectation";
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
