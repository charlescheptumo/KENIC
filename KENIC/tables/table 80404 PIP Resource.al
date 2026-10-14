table 80404 "PIP Resource"
{
    Caption = 'PIP Resource';
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
        field(3; "Resource Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Training,Coaching,Transport,Budget,Other';
            OptionMembers = Training,Coaching,Transport,Budget,Other;
        }
        field(4; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Estimated Cost"; Decimal)
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
        Line: Record "PIP Resource";
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
