tableextension 50190 "Company Extension" extends "Company Information"
{
    fields
    {

        field(50105; "Sales Invoice Number"; Integer)
        {
            Caption = 'Invoice Number';
            //DataClassification = SensitivePersonalData;
        }
        field(50106; "Purchase Invoice Number"; Integer)
        {
            Caption = 'Invoice Number';
            //DataClassification = SensitivePersonalData;
        }
        // ===== ETIMS Branch Info =====        
        field(50107; "ETIMS Taxpayer Name"; Text[100])
        {
            Caption = 'ETIMS Taxpayer Name';
        }

        field(50108; "ETIMS Branch Name"; Text[100])
        {
            Caption = 'ETIMS Branch Name';
        }

        field(50109; "ETIMS Branch Open Date"; Date)
        {
            Caption = 'ETIMS Branch Open Date';
        }

        field(50110; "ETIMS Manager Name"; Text[100])
        {
            Caption = 'ETIMS Manager Name';
        }

        field(50111; "ETIMS Manager Phone No."; Text[30])
        {
            Caption = 'ETIMS Manager Phone No.';
        }

        field(50112; "ETIMS Manager Email"; Text[100])
        {
            Caption = 'ETIMS Manager Email';
        }

        field(50113; "ETIMS Device ID"; Code[20])
        {
            Caption = 'ETIMS Device ID';
        }

        field(50114; "ETIMS SDC ID"; Code[50])
        {
            Caption = 'ETIMS SDC ID';
        }

        field(50115; "ETIMS MRC No."; Code[30])
        {
            Caption = 'ETIMS MRC No.';
        }

        field(50116; "ETIMS CMC Key"; Text[150])
        {
            Caption = 'ETIMS CMC Key';
        }
        field(50117; "Company Tin"; Code[20])
        {
            //TableRelation = "Bank Account";
        }
        field(50118; "Branch ID"; Code[20])
        {
            // TableRelation = "Bank Account"."No.";
        }
        field(50119; "Device Number"; Code[20])
        {
            // TableRelation = "Bank Account"."No.";
        }
        field(50120; ClientId; Text[50])
        {
            Caption = 'ClientId';
            //DataClassification = SystemMetadata;
        }
        field(50121; ClientSecret; Text[100])
        {
            Caption = 'ClientSecret';
            //DataClassification = SensitivePersonalData;
            ExtendedDatatype = Masked; // Ensures password is masked
        }
    }
}
