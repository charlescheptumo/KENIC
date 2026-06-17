#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 56056 "ICT Helpdesk Global Parameters"
{
    DrillDownPageID = "ICT Helpdesk Setups";
    LookupPageID = "ICT Helpdesk Setups";

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "User Feedback Duration"; DateFormula)
        {
            DataClassification = ToBeClassified;
            Description = '//Gives the user a time for a feedback before the issue is closed completely.';
        }
        field(3; "Assigned Issue Duration"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "ICT Email"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Project Meeting Register Nos"; code[350])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "ICT Inventory Nos"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";

        }
        field(7; "ICT Project Nos"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(8; "ICT Maintenance Schedule Nos."; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";

        }
        field(9; "ICT Issuance Voucher Nos."; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";

        }
        field(10; "ICT Comp Nos."; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(11; "ICT Vehicle Nos."; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(12; "ICT Furniture Nos."; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

