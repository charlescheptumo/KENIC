table 99223 "Prohibited Methods"
{
    Caption = 'Prohibited Methods';

    LookupPageId = "Prohibited Methods";
    DrillDownPageId = "Prohibited Methods";
    fields
    {
        field(1; Method; Code[70])
        {
            Caption = 'Method';
        }
        field(2; Description; Text[200])
        {
            Caption = 'Description';
        }
        field(3; Category; Code[150])
        {
            TableRelation = "Prohibited Methods Categories".Category;
        }
        field(4; "Sub Category"; Code[150])
        {
            TableRelation = "Prohibited Methods"."Sub Category" where(Category = field(Category));
        }
    }
    keys
    {
        key(PK; Method)
        {
            Clustered = true;
        }
    }
}
