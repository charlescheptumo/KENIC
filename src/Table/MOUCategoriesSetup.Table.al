#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50033 "MOU  Categories Setup"
{

    fields
    {
        field(2; Description; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Category Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Category Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        CrmGeneralSetup: Record "Crm General Setup.";
        NoSeriesMgt: Codeunit "No. Series";
        UserSetup: Record "User Setup";
        Customers: Record Customer;
}

