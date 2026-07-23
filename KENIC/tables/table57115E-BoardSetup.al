table 57115 "E-Board Setup"
{
    Caption = 'E-Board Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Circular Resolution Nos."; Code[20])
        {
            Caption = 'Circular Resolution Nos.';
            TableRelation = "No. Series";
        }
        field(3; "E-Signing Nos."; Code[20])
        {
            Caption = 'E-Signing Nos.';
            TableRelation = "No. Series";
        }
        field(4; "Compliance Entry Nos."; Code[20])
        {
            Caption = 'Compliance Entry Nos.';
            TableRelation = "No. Series";
        }
        field(5; "Board Member Nos."; Code[20])
        {
            Caption = 'Board Member Nos.';
            TableRelation = "No. Series";
        }
        field(6; "Default Voting Duration (Days)"; Integer)
        {
            Caption = 'Default Voting Duration (Days)';
            MinValue = 0;
        }
        field(7; "Enable Approval Workflow"; Boolean)
        {
            Caption = 'Enable Approval Workflow';
        }
        field(8; "Allow Department Voting"; Boolean)
        {
            Caption = 'Allow Department Voting';
        }
        field(9; "Allow Individual Voting"; Boolean)
        {
            Caption = 'Allow Individual Voting';
        }


        field(50; "E-Board Portal URL"; Text[250])
        {
            Caption = 'E-Board Portal URL';
            ExtendedDatatype = URL;
        }
        field(51; "Portal Tenant ID"; Text[50])
        {
            Caption = 'Portal Tenant ID';
        }
        field(52; "Default Quorum Percentage"; Decimal)
        {
            Caption = 'Default Quorum %';
            MinValue = 0;
            MaxValue = 100;

        }
        field(60; "Enable Reminders"; Boolean) //For circular resolution
        {
            Caption = 'Enable Circular Reminders';
            InitValue = true;
            ToolTip = 'Specifies whether automated email reminders should be sent to pending voters.';
        }

        field(70; "SharePoint Site Link"; Text[250])
        {
            Caption = 'SharePoint Site Link';
            ExtendedDatatype = URL;
            ToolTip = 'The base SharePoint site URL (e.g., https://company.sharepoint.com/sites/eboard)';
        }
        field(71; "SharePoint Site Main Library"; Text[100])
        {
            Caption = 'SharePoint Main Library';
            ToolTip = 'The main document library name (e.g., "Documents" or "Shared Documents")';
        }
        field(72; "SharePoint Document Library"; Text[100])
        {
            Caption = 'SharePoint Document Library';
            ToolTip = 'The document library folder for circular resolutions';
        }
        field(73; "Circular Resolution DMS Link"; Text[100])
        {
            Caption = 'Circular Resolution DMS Link';
            ToolTip = 'The folder name within the document library for circular resolutions';
        }
        field(74; "ERP URL"; Text[250])
        {
            Caption = 'ERP URL';
            ExtendedDatatype = URL;
        }


        // --- Compliance Calendar Configuration ---
        field(100; "Compliance Category Nos."; Code[20])
        {
            Caption = 'Compliance Category Nos.';
            TableRelation = "No. Series";
            ToolTip = 'Specifies the number series for regulatory categories (e.g., Tax, HR, Environmental).';
        }
        field(101; "Compliance Template Nos."; Code[20])
        {
            Caption = 'Compliance Template Nos.';
            TableRelation = "No. Series";
            ToolTip = 'Specifies the number series for recurring compliance templates.';
        }

        field(102; "Compliance Obligation Nos."; Code[20])
        {
            Caption = 'Compliance Obligation Nos.';
            TableRelation = "No. Series";
            ToolTip = 'Specifies the number series for recurring compliance obligation';
        }
        field(103; "Enable Compliance Reminders"; Boolean)
        {
            Caption = 'Enable Compliance Reminders';
            InitValue = true;
            ToolTip = 'Enables automated email notifications for upcoming and overdue compliance deadlines.';
        }

        field(107; "Compliance DMS Link"; Text[100])
        {
            Caption = 'Compliance DMS Link';
            ToolTip = 'The folder name within SharePoint/DMS designated for storing compliance filing proof.';
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    /// <summary>
    /// Ensures a single setup record exists and retrieves it safely.
    /// </summary>
    procedure GetRecordOnce()
    begin
        if Get() then
            exit;

        Init();
        "Primary Key" := '';
        Insert();
    end;
}