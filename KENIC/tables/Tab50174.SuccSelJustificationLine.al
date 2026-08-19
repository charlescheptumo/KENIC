
table 50174 "Succ. Sel. Justification Line"
{
    Caption = 'Successor Selection Justification Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Succ. Sel. Justification Hdr"."No.";
            DataClassification = CustomerContent;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; "Criteria"; Enum "Succ. Sel. Justif. Criteria")
        {
            Caption = 'Criteria';
            DataClassification = CustomerContent;
        }
        field(4; "Rating"; Integer)
        {
            Caption = 'Rating (1-5)';
            MinValue = 1;
            MaxValue = 5;
            DataClassification = CustomerContent;
        }
        field(5; "Comments"; Text[250])
        {
            Caption = 'Comments';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
