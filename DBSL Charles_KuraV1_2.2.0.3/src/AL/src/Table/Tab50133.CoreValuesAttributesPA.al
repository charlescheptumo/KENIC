table 50133 "Core Values & Attributes PA"
{
    Caption = 'Core Values & Attributes PA';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Core attributes&Attributes";
    LookupPageId = "Core attributes&Attributes";
    
    fields
    {
        field(1; "Performance Evaluation ID"; Code[100])
        {

            TableRelation = "Perfomance Evaluation".No;
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3;"Core values Template ID";Code[100])
        {

        }
        field(4;Description; Text[250])
        {     
        }
        field(5;"Explanatory Note"; Text[500])
        {     
        }
        field(6;"Score Attained"; integer)
        {     
        }
        field(7;Comments; Text[500])
        {     
        }
        

    }
    keys
    {
        key(PK; "Performance Evaluation ID","Line No","Core values Template ID")
        {
            Clustered = true;
        }
    }
}
