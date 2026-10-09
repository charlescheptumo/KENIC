
table 80303 "360 Open Line"
{
    Caption = '360 Open Line';
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
        field(4; Question; Text[500])
        {
            Caption = 'Question';
        }
        field(5; Response; Text[2048])
        {
            Caption = 'Response';

            trigger OnValidate()
            var
                Header: Record "360 Evaluation Header";
            begin
                Header.Get("Evaluation No.");
                Header.TestStatusOpen();
            end;
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
