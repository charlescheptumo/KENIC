table 50095 "Correspondence Cues"
{
    Caption = 'Correspondence Cues';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[250])
        {
            Caption = 'Primary Key';
        }
        field(2; "User ID Filter"; Code[1000])
        {
            Caption = 'User ID Filter';
            FieldClass = FlowFilter;
        }
        field(3; "Incoming Correspondence"; Integer)
        {
            FieldClass = FlowField;
            // CalcFormula = count("General Correspondence Header" where( = field("User ID Filter")));
            CalcFormula = count("General Correspondence Header");
            Editable = false;
        }
        field(4; "Outgoing Correspondence"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("General Correspondence Header" where("Current Approver" = field("User ID Filter")));
            Editable = false;
        }
        field(5; "Correspondence Awaiting Approval"; Integer)
        {
            FieldClass = FlowField;
            // CalcFormula = count("General Correspond Approval" where("User ID" = field("User ID Filter")));
            CalcFormula = count("General Correspondence Header");
            Editable = false;
        }
        field(6; "Correspondence Sent for Approval"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("General Correspondence Header" where("Created By" = field("User ID Filter")));
            Editable = false;
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
