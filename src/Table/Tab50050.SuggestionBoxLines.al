table 50050 "Suggestion Box Lines"
{
    Caption = 'Suggestion Box Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No"; Code[100])
        {
            TableRelation = "Suggestion Box".No;
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Proposal"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No", "Line No")
        {
            Clustered = true;
        }
    }


}
