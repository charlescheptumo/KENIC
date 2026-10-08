/// <summary>
/// Stores KRA eTIMS branch registration details (TIN, taxpayer name, branch name/open date, manager contact info, device/SDC IDs, MRC number, CMC key) per branch.
/// </summary>
table 50200 "eTims-Branch Info"
{
    Caption = 'ETIMS Branch Info';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            // DataClassification = SystemMetadata;
            AutoIncrement = true;
        }

        field(10; "TIN"; Code[20])
        {
            Caption = 'TIN';
            // DataClassification = CustomerContent;
        }

        field(20; "Taxpayer Name"; Text[100])
        {
            Caption = 'Taxpayer Name';
            // DataClassification = CustomerContent;
        }

        field(30; "Branch Name"; Text[100])
        {
            Caption = 'Branch Name';
            // DataClassification = CustomerContent;
        }

        field(40; "Branch Open Date"; Date)
        {
            Caption = 'Branch Open Date';
            // DataClassification = CustomerContent;
        }

        field(50; "Manager Name"; Text[100])
        {
            Caption = 'Manager Name';
            // DataClassification = CustomerContent;
        }

        field(60; "Manager Phone No."; Text[30])
        {
            Caption = 'Manager Phone No.';
            // DataClassification = CustomerContent;
        }

        field(70; "Manager Email"; Text[100])
        {
            Caption = 'Manager Email';
            // DataClassification = CustomerContent;
        }

        field(80; "Device ID"; Code[20])
        {
            Caption = 'Device ID';
            // DataClassification = CustomerContent;
        }

        field(90; "SDC ID"; Code[50])
        {
            Caption = 'SDC ID';
            // DataClassification = CustomerContent;
        }

        field(100; "MRC No."; Code[30])
        {
            Caption = 'MRC No.';
            // DataClassification = CustomerContent;
        }

        field(110; "CMC Key"; Text[150])
        {
            Caption = 'CMC Key';
            // DataClassification = SensitivePersonalData;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }

        key(TINBranch; "TIN", "Branch Name")
        {
        }
    }
}

