
table 50176 "Successor Form Line"
{
    Caption = 'Successor Form Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Successor Form Header"."No.";
            DataClassification = CustomerContent;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; "Development Area/Activity"; Text[250])
        {
            Caption = 'Development Area/Activity';
            DataClassification = CustomerContent;
        }
        field(4; "Timeframe"; Text[50])
        {
            Caption = 'Timeframe';
            DataClassification = CustomerContent;
        }
        field(5; "Progress/Comment"; Text[250])
        {
            Caption = 'Progress/Comment';
            DataClassification = CustomerContent;
        }
        field(6; "Training Required"; Enum "Successor Form Training Type")
        {
            Caption = 'Training Required';
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
