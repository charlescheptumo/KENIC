table 50053 "Complaints Cues"
{
    Caption = 'Complaints Cues';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[200])
        {
            Caption = 'Primary Key';
        }
        field(2; "Open Tickets"; Integer)
        {
            CalcFormula = count("Front Office Management" where(Status = const(Open)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(3; "Resolved Tickets"; Integer)
        {
            CalcFormula = count("Front Office Management" where(Status = const(Resolved)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(4; "Assigned Tickets"; Integer)
        {
            CalcFormula = count("Front Office Management" where(Status = const(Assigned)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(5; "Closed Tickets"; Integer)
        {
            CalcFormula = count("Front Office Management" where(Status = const(Closed)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(6; "Escalated Tickets"; Integer)
        {
            CalcFormula = count("Front Office Management" where(Status = const(Escalated)));
            FieldClass = FlowField;
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
