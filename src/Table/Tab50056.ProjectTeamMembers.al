table 50056 "Project Team Members"
{
    Caption = 'Project Team Members';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[100])
        {
            TableRelation = "Project Teams"."Code";
        }
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4; Role; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Member,Team Leader';
            OptionMembers = Member,"Team Lead";
        }
        field(5; "Member No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Emp.Reset;
                Emp.SetRange("No.", "Member No.");
                if Emp.FindSet then begin
                    // Emp.CalcFields("Job Title");
                    Designation := Emp."Job Title";
                    "ID/Passport No" := Emp."ID Number";
                    "Member Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                    "Member Email" := Emp."E-Mail";
                    "Telephone No." := Emp."Mobile Phone No.";
                end;
            end;
        }
        field(6; "Member Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; Designation; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "ID/Passport No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Member Email"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Telephone No."; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(21; "Shortcut Dimension 1 Code"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));
        }
        field(22; "Shortcut Dimension 2 Code"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2));
        }
        field(23; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Code", "Line No")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Member No.", "Member Name", Designation)
        {
        }
    }

    var
        Resources: Record Resource;
        Emp: Record Employee;

        NoOfMembers: Integer;
}
