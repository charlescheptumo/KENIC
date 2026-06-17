table 50057 "Exit Question Temp"
{
    Caption = 'Exit Question Temp';
    DataClassification = ToBeClassified;

    fields
    {
        // field(1; "Template Type"; Option)
        // {
        //     DataClassification = ToBeClassified;
        //     OptionCaption = 'Application Submission,Phone Pre-Screening Interview,Interview Scoresheet';
        //     OptionMembers = "Application Submission","Phone Pre-Screening Interview","Interview Scoresheet";
        // }
        field(2; "Template ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        // field(3; "Question Category"; Code[30])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = "Candidate Interview Qn Group"."Question Category";
        // }
        field(4; "Question Id"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Description; Text[350])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Question Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open-ended,Closed-ended,Number';
            OptionMembers = "Open-ended","Closed-ended",Number;
        }
        field(7; "Closed-ended Question Sub-Type"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Template ID", "Question Id", "Line No.")
        {
            Clustered = true;
        }
    }
}
