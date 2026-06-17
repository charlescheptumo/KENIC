#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 60005 "Employees Vehicles"
{
    DrillDownPageID = "Employees Vehicles List";
    LookupPageID = "Employees Vehicles List";

    fields
    {
        field(1; "Employee no."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Emp.Get("Employee no.") then begin
                    "Employees Name" := Emp.FullName;
                    Emp.CalcFields("Job Title");
                    "Job Title" := Emp."Job Title";
                    "Phone No." := Emp."Phone No.";
                    "E-Mail" := Emp."E-Mail";
                    "Company E-Mail" := Emp."Company E-Mail";
                    "Mobile Phone No." := Emp."Phone No.";
                end;
            end;
        }
        field(2; "Employees Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Job Title"; Text[250])
        {
            Caption = 'Job Title';
            Editable = true;
        }
        field(4; "Phone No."; Text[15])
        {
            Caption = 'Phone No.';
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(5; "Mobile Phone No."; Text[15])
        {
            Caption = 'Mobile Phone No.';
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(6; "E-Mail"; Text[70])
        {
            Caption = 'Email';
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                //MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(7; "Company E-Mail"; Text[60])
        {
            Caption = 'Company Email';
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                //MailManagement.ValidateEmailAddressField("Company E-Mail");
            end;
        }
        field(8; "Registration No."; Code[10])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;

            trigger OnValidate()
            begin
                //"Registration No.":=FA."Serial No.";
            end;
        }
        field(9; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Private Vehicle",Motobike,Truck;
        }
        field(10; Make; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Make".Code;
        }
        field(11; Model; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Model".Code;
        }
        field(12; "Chassis Serial No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Engine Serial No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Vehicle Pass/Card number"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Body Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Saloon,Van,Lorry,Moto Cycle,Pickups,Trailer,Bus,Mini Bus';
            OptionMembers = Saloon,Van,Lorry,"Moto Cycle",Pickups,Trailer,Bus,"Mini Bus";
        }
        field(16; "Vehicles Color"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'White,Black,Gray,Silver,Red,Blue,Brown,Green,Beige,Orange,Gold,Yellow,Purple';
            OptionMembers = White,Black,Gray,Silver,Red,Blue,Brown,Green,Beige,Orange,Gold,Yellow,Purple;
        }
    }

    keys
    {
        key(Key1; "Employee no.", "Registration No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Emp: Record Employee;
}

