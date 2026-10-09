table 80302 "360 Closed Line"
{
    Caption = '360 Closed Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Evaluation No."; Code[30])
        {
            Caption = 'Evaluation No.';
            TableRelation = "360 Evaluation Header"."No.";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Question Code"; Code[20])
        {
            Caption = 'Question Code';
            TableRelation = "360 Question"."Code";
        }
        field(4; Question; Text[500])
        {
            Caption = 'Question';
        }
        field(5; Rating; Enum "360 Rating")
        {
            Caption = 'Rating';

            trigger OnValidate()
            var
                Header: Record "360 Evaluation Header";
            begin
                Header.Get("Evaluation No.");
                Header.TestStatusOpen();
                Score := Rating.AsInteger();
            end;
        }
        field(6; Score; Decimal)
        {
            Caption = 'Score';
            Editable = false;
            DecimalPlaces = 0 : 2;
        }
    }

    keys
    {
        key(PK; "Evaluation No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
