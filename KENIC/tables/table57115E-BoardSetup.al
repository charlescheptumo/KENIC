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
        field(60; "Reminder Frequency (Days)"; Integer) 
        { 
            Caption = 'Reminder Frequency (Days)'; 
            MinValue = 0;
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