table 50047 "CEO Cues"
{
    Caption = 'CEO Cues';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Number of Pending Appointments"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("CEO Appointment" where("Appointment Status" = const("Pending Acceptance")));
            Editable = false;
        }
        field(3; "Number of Accepted Appointments"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("CEO Appointment" where("Appointment Status" = const(Accepted)));
            Editable = false;
        }
        field(4; "Number of Rescheduled Appointments"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("CEO Appointment" where("Appointment Status" = const(Rescheduled)));
            Editable = false;
        }
        field(5; "Completed Assigned Tasks"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("CEO Assign Tasks" where(Completed = const(true)));
            Editable = false;
        }
        field(6; "Total Assigned Tasks"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("CEO Assign Tasks");
            Editable = false;
        }
        field(7; "Total Appointments"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("CEO Appointment");
            Editable = false;
        }
        field(8; "Uncompleted Assigned Tasks"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("CEO Assign Tasks" where(Completed = const(false)));
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
