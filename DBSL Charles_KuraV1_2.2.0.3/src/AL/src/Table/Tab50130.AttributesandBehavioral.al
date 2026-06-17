table 50130 "Attributes and Behavioral"
{
    Caption = 'Attributes and Behavioral';
    DataClassification = ToBeClassified;

    
    fields
    {
        field(1; "Attributes Template ID"; Code[30])
        {

            TableRelation = "Core Values & Attributes";
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(4; "Description"; Text[250])
        {

        }
        field(5; "Explanatory Notes"; Text[300])
        {
        }
    }
    keys
    {
        key(PK; "Attributes Template ID","Line No.")
        {
            Clustered = true;
        }
    }
}
