/// <summary>
/// Stores eTIMS branch registration details (branch ID/name/status, headquarters flag, manager contact, province/district/tax locality, TIN, device/SDC IDs, MRC number, CMC key, device serial number) used for branch-level eTIMS submissions.
/// </summary>
table 50215 "eTims-Branch"
{
    Caption = 'eTims-Branch';
    DataClassification = ToBeClassified;
    DrillDownPageId = "eTims-Branch List";
    LookupPageId = "eTims-Branch List";

    fields
    {
        field(1; "Branch Id"; Code[20])
        {
            Caption = 'Branch ID';
        }
        field(2; "Branch Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Branch Status Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Headquater; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Manager Email"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Manager Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Manager Phone"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Manual Entry"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Province Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Tax Locality"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Tin"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(13; "District Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "ETIMS Device ID"; Text[150])
        {
            Caption = 'ETIMS Device ID';
        }

        field(15; "ETIMS SDC ID"; Text[150])
        {
            Caption = 'ETIMS SDC ID';
        }

        field(16; "ETIMS MRC No."; Text[150])
        {
            Caption = 'ETIMS MRC No.';
        }

        field(17; "ETIMS CMC Key"; Text[150])
        {
            Caption = 'ETIMS CMC Key';
        }
        field(18; "ETIMS Branch Open Date"; Date)
        {
            Caption = 'ETIMS Branch Open Date';
        }
        field(19; "Device Serial Number"; Text[150])
        {
            Caption = 'Device Serial Number';
        }
    }
    keys
    {
        key(PK; "Branch Id", "Line No")
        {
            Clustered = true;
        }
    }
}
