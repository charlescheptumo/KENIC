#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 60021 "Services Sought"
{
    // DrillDownPageID = UnknownPage60035;
    // LookupPageID = UnknownPage60035;

    fields
    {
        field(1; "Service Name"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Service Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Service Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

