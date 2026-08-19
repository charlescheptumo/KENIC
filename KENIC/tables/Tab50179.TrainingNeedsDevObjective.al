
table 50179 "Training Needs Dev Objective"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Training Header No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Training Needs Header".Code;
        }
        field(2; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Competency"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Development Goal Year"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = '2024,2025,2026';
            OptionMembers = "2024","2025","2026";
        }
        field(5; "Purpose"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Improved Performance,New Assignment,Meet Future Staffing Needs,Career Interests,Develop Unavailable Skills,Mission';
            OptionMembers = "Improved Performance","New Assignment","Meet Future Staffing Needs","Career Interests","Develop Unavailable Skills","Mission";
        }
        field(6; "Priority"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Essential,Needed,Helpful';
            OptionMembers = Essential,Needed,Helpful;
        }
        field(7; "Developmental Activity"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'On the Job Training,Coaching and Mentoring,Short Course Training,Job Shadowing,University/College,Conference,Self Development,Added Responsibilities,Rotation Assignment';
            OptionMembers = "On the Job Training","Coaching and Mentoring","Short Course Training","Job Shadowing","University/College",Conference,"Self Development","Added Responsibilities","Rotation Assignment";
        }
        field(8; "Evidence of Accomplishment"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Training Header No", "Line No")
        {
            Clustered = true;
        }
    }
}