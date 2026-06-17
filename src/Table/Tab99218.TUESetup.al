table 99218 "TUE Setup"
{
    Caption = 'TUE Setup';


    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Default Athlete Posting Group"; Code[50])
        {
            Caption = 'Default Athlete Posting Group';
            TableRelation = "Customer Posting Group";
        }
        field(3; "Athlete Nos"; Code[20])
        {
            Caption = 'Athlete Nos';
            TableRelation = "No. Series";
        }
        field(4; "Physician Nos"; Code[20])
        {
            Caption = 'Physician Nos';
            TableRelation = "No. Series";
        }
        field(5; MedicalPractitonerPostingGroup; Code[50])
        {
            Caption = 'Default Physician Posting Group';
            TableRelation = "Vendor Posting Group";
        }
        field(6; "DefaultAthlete Gen.Bus. PGroup"; Code[20])
        {
            TableRelation = "Gen. Business Posting Group";
            Caption = 'Default Athlete Gen Bus.  Posting Group';
        }
        field(7; DefaultPractitionerGenBusPGrp; Code[20])
        {
            TableRelation = "Gen. Business Posting Group";
            Caption = 'Default Medical Practitioner Gen Bus. Posting Group';
        }
        field(8; "TUE Application Nos"; Code[20])
        {
            Caption = 'Therapeutic Use Exemption Application Nos';
            TableRelation = "No. Series";
        }
        field(9; "Athlete VAT Posting group"; Code[30])
        {
            Caption = 'Default Athelete VAT posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(10; "MedicalP VAT Posting Group"; Code[30])
        {
            Caption = 'Default Physician VAT posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(11; "WHO ICD API Url"; Text[200])
        {

        }
        field(12; "WHO ICD API Client ID"; Text[200])
        {
            ExtendedDatatype = Masked;
        }
        field(13; "WHO ICD API Client Secret"; Text[200])
        {
            ExtendedDatatype = Masked;
        }
        field(14; "Committee Member Nos"; Code[50])
        {
            TableRelation = "No. Series";
        }

    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
