#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50083 "Incoming Correspondence Source"
{
    Caption = 'Incoming Correspondence Source';

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "No of Correspondences"; Integer)
        {
            CalcFormula = count("Incoming Correspondence Header" where("Correspondence Source" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

