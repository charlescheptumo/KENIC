table 80401 "PIP Area of Concern"
{
    Caption = 'PIP Area of Concern';
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
        field(3; "Area Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Tasks,Competencies';
            OptionMembers = Tasks,Competencies;

            trigger OnValidate()
            begin
                if "Area Type" = "Area Type"::Tasks then
                    "Competency Type" := "Competency Type"::" ";
            end;
        }
        field(4; "Competency Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Behavioral,Core,Leadership';
            OptionMembers = " ",Behavioral,Core,Leadership;

            trigger OnValidate()
            begin
                if "Competency Type" <> "Competency Type"::" " then
                    TestField("Area Type", "Area Type"::Competencies);
            end;
        }
        field(5; "Area Description"; Text[250])
        {
            Caption = 'Task / Competency';
            DataClassification = ToBeClassified;
        }
        field(6; Observations; Text[1000])
        {
            Caption = 'Observations, Previous Discussions or Counseling';
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
        Line: Record "PIP Area of Concern";
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
