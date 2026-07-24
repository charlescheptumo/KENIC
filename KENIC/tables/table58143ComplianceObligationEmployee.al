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
    }

    keys
    {
        key(PK; "Obligation No.", "Employee No.")
        {
            Clustered = true;
        }
    }
}