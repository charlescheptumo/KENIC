table 58143 "Compliance Obligation Employee"
{
    Caption = 'Compliance Obligation Employee';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Obligation No."; Code[20])
        {
            Caption = 'Obligation No.';
            TableRelation = "Compliance Obligation"."No.";
        }
        field(2; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            TableRelation = Employee."No.";

            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                if Employee.Get("Employee No.") then
                    "Employee Name" := Employee.FullName()
                else
                    "Employee Name" := '';
            end;
        }
        field(3; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
            Editable = false;
        }
        field(4; Status; Enum "Employee Obligation Status")
        {
            Caption = 'Status';
        }
        field(5; Completed; Boolean)
        {
            Caption = 'Completed';
        }
        field(6; "Completed DateTime"; DateTime)
        {
            Caption = 'Completed Date/Time';
            Editable = false;
        }
        field(7; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }
    }

    keys
    {
        key(PK; "Obligation No.", "Employee No.")
        {
            Clustered = true;
        }
    }
}