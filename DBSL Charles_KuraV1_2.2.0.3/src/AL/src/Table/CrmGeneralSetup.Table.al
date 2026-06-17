#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69503 "Crm General Setup."
{
    LookupPageID = "CRM Setup List";
    DrillDownPageID = "CRM Setup List";

    fields
    {
        field(1; "Primary key"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(2; "Lead Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(3; "General Enquiries Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(4; "Cases nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(5; "Crm logs Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(6; "Training Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(7; "Customer App Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(8; "Customer Feedback Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(9; "Declarations Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(10; "Head of Legal Email"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Notify; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Plaintiff Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(13; "Defendants Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(14; "Interested Parties Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(15; "Advocate Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(16; "Legal Application Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(17; "Legal Pleading Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(18; "Company Judges Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(19; "Court Houses Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(20; "Legal Closing Voucher Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(21; "Maximum Value of Gift"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Default Prequalification Categ"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Category".Code where(Blocked = const(false));
        }
        field(24; "Gifts Receiving Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(25; "Gifts Given Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(26; "Legal Advice Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(27; "Corruption Prevention Vchr Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(28; "Lease Agreement"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(29; "MOU Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(30; "Conflict of Interest Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(31; "Complaint Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(32; "Legal Enforcement Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(33; "Gifts Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(34; "Legal Department  Email"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Event Planner Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(36; "Visitor Pass Nos"; Code[100])
        {
            TableRelation = "No. Series";
        }
        field(37; "CEO Booking Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(38; "Meeting Nos."; code[20])
        {
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(39; "CEO Task Assignment Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(40; "CEO Task Assignment Line Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Primary key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

