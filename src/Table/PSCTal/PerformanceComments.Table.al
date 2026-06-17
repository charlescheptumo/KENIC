#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80141 "Performance Comments"
{

    fields
    {
        field(1; No; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Supervisor  Comments"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Appraisee Comments"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; No, "Code", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
