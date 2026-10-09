table 58216 "360 Question"
{
    Caption = '360 Question';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; "Evaluatee Category"; Enum "360 Category")
        {
            Caption = 'Evaluatee Category';
        }
        field(3; "Question Type"; Enum "360 Question Type")
        {
            Caption = 'Question Type';
        }
        field(4; Question; Text[500])
        {
            Caption = 'Question';
        }
        field(5; "Sort Order"; Integer)
        {
            Caption = 'Sort Order';
        }
        field(6; Active; Boolean)
        {
            Caption = 'Active';
            InitValue = true;
        }
    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
        key(Sort; "Evaluatee Category", "Question Type", "Sort Order")
        {
        }
    }
}


