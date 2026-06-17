#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50046 "ICT Helpdesk Sub Category"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Category Head"; Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";
        }
        field(5; "Expected Duration"; Duration)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Email; Text[40])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Applies to Internal"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Category Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Helpdesk Category".Code;
        }
    }

    keys
    {
        key(Key1; "Code", "Category Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
