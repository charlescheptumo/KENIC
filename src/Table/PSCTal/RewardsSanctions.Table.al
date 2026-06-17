#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80143 "Rewards Sanctions"
{

    fields
    {
        field(1; "Line No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Recommendation; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,Reward,Intervention,Sanction;
        }
        field(3; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Code"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
