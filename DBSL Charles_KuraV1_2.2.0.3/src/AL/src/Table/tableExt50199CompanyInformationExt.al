tableextension 50199 "CompanyInformationExt" extends "Company Information"
{
    fields
    {
        field(50100; "Active Staff Count"; Integer)
        {
            Caption = 'Active Staff Count';
            FieldClass = FlowField;
            CalcFormula = count(Employee where(Status = const("Active")));
            Editable = false;
        }

        field(50101; "Established Positions"; Integer)
        {
            Caption = 'Established Positions';
            FieldClass = FlowField;
            CalcFormula = count("Company Positions" where(Blocked = const(false)));
            Editable = false;
        }

        field(50102; "Total Job Grades"; Integer)
        {
            Caption = 'Total Job Grades';
            FieldClass = FlowField;
            CalcFormula = count("Salary Scales");
            Editable = false;
        }

        field(50103; "Approved Duty Stations"; Integer)
        {
            Caption = 'Approved Duty Stations';
            FieldClass = FlowField;
            CalcFormula = count("Duty Station" where(Blocked = const(false)));
            Editable = false;
        }

        field(50104; "Date Established"; Date)
        {
            Caption = 'Date Established';
            DataClassification = CustomerContent;
        }
    }
}