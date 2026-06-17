#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69746 "Handover Temp Lines"
{

    fields
    {
        field(1; "Temp Id"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Asset,Item,File,Other';
            OptionMembers = Asset,Item,File,Other;
        }
        field(3; No; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Line No"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Description; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Temp Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

