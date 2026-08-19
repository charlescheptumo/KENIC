
table 50178 "Training Needs Dev Goal"
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
        field(3; "Development Year"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Year 1,Year 2,Year 3';
            OptionMembers = "Year 1","Year 2","Year 3";
        }
        field(4; "Goal"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Training Header No", "Development Year", "Line No")
        {
            Clustered = true;
        }
    }
}
