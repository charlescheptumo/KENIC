/// <summary>
/// Table Staff Exit Clearance Header  (ID 50076).
/// </summary>
table 50076 "Staff Exit Clearance Header"
{
    Caption = 'Staff Exit Clearance Header ';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            Editable = false;
        }
        field(2; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            TableRelation = Employee;
            Editable = false;

            trigger OnValidate()
            var
                Employee: Record Employee;
                StaffClearanceSetup: Record "Staff Clearance Setup";
                StaffClearance: Record "Staff Clearance";
                FA: Record "Fixed Asset";
            begin
                Employee.Reset();
                Employee.SetRange("No.", Rec."Employee No.");
                if Employee.FindFirst then begin
                    Rec."Employee Name" := Employee.FullName();
                    Rec."Job Title" := Employee."Job Title";
                    Rec.Address := Employee.Address;
                    Rec."Address 2" := Employee."Address 2";
                    Rec."Phone No." := Employee."Phone No.";
                    Rec."E-Mail" := Employee."E-Mail";
                    Rec.Gender := Employee.Gender;
                    Rec."ID Number" := Employee."ID Number";
                    Rec."Social Security No." := Employee."Social Security No.";
                    Rec."N.H.I.F No" := Employee."N.H.I.F No";
                    Rec."Leave Balance" := Employee."Leave Balance";
                    Rec."Leave Outstanding Bal" := Employee."Leave Outstanding Bal";
                    Rec.Balance := Employee.Balance;
                    Rec."Salary Scale" := Employee."Salary Scale";
                    Rec."P.I.N" := Employee."P.I.N";
                    Rec.Position := Employee."Job ID";
                end;
            end;
        }
        field(3; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
            Editable = false;
        }
        field(4; "Approval Status"; Enum "App Status")
        {
            Caption = 'Approval Status';
            //Editable = false;
        }
        field(5; "E-Mail"; Text[80])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; Position; Code[20])
        {
            Caption = 'Position';
            Editable = false;
        }
        field(7; "Job Title"; Text[100])
        {
            Caption = 'Job Title';
            Editable = false;
        }
        field(8; Gender; Enum "Employee Gender")
        {
            Caption = 'Gender';
            Editable = false;
        }
        field(9; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
            Editable = false;
        }
        field(10; "ID Number"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "P.I.N"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "N.H.I.F No"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Social Security No."; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Salary Scale"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Leave Balance"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; Balance; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Leave Outstanding Bal"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18; Address; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19; "Address 2"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Document No.")
        {
            Clustered = true;
        }
    }

    procedure CheckIfDocStatusApproved(): Boolean
    begin
        if Rec."Approval Status" = Rec."Approval Status"::Approved then begin
            exit(true);
        end;
    end;
}
