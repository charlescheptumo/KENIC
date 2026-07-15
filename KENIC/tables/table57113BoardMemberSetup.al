table 57113 "Board Member Setup"
{
    Caption = 'Board Member Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            TableRelation = Employee."No.";

            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                if Employee.Get("Employee No.") then begin
                    "Employee Name" := Employee.FullName();
                    "Email" := Employee."Company E-Mail";
                    "Department Code" := Employee."Department Code";
                end else begin
                    "Employee Name" := '';
                    "Email" := '';
                    "Department Code" := '';
                end;
            end;
        }
        field(2; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
            Editable = false;
        }
        field(3; "Email"; Text[100])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;
            Editable = false;
        }
        field(4; "Department Code"; Code[20])
        {
            Caption = 'Department Code';
            
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Editable = false;
        }
        field(5; "Board Role"; Enum "Board Role Type")
        {
            Caption = 'Board Role';
        }
        field(6; "Active"; Boolean)
        {
            Caption = 'Active';
            InitValue = true;
        }
        field(7; "Default Voter"; Boolean)
        {
            Caption = 'Default Voter';
            InitValue = true;
        }
        field(8; "Start Date"; Date)
        {
            Caption = 'Start Date';

            trigger OnValidate()
            begin
                if ("End Date" <> 0D) and ("Start Date" > "End Date") then
                    Error(StartDateAfterEndDateErr);
            end;
        }
        field(9; "End Date"; Date)
        {
            Caption = 'End Date';

            trigger OnValidate()
            begin
                if ("End Date" <> 0D) and ("End Date" < "Start Date") then
                    Error(EndDateBeforeStartDateErr);
            end;
        }
    }

    keys
    {
        key(PK; "Employee No.")
        {
            Clustered = true;
        }
    }

    var
        StartDateAfterEndDateErr: Label 'The Start Date cannot be after the End Date.';
        EndDateBeforeStartDateErr: Label 'The End Date cannot be before the Start Date.';
}