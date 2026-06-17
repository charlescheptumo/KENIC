#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 60008 "Visitors Management"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    CRMSetup.Get;
                    NoSeriesMgt.TestManual(CRMSetup."Vehicles Checkin No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Vehicle Owner Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Guests,Staff Vehicle,Suppliers Vehicle,Company Vehicle';
            OptionMembers = Guests,"Staff Vehicle","Suppliers Vehicle","Company Vehicle";
        }
        field(3; "Registration Number"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Vehicle Owner Type" = const("Staff Vehicle")) "Employees Vehicles"."Registration No."
            else if ("Vehicle Owner Type" = const("Company Vehicle")) "Fleet Vehicles."."Registration No.";

            trigger OnValidate()
            begin
                EmployeesVehicles.Reset;
                EmployeesVehicles.SetRange(EmployeesVehicles."Registration No.", "Registration Number");
                if EmployeesVehicles.FindFirst then begin
                    "Drivers Number" := EmployeesVehicles."Employee no.";
                    "Drivers Name" := EmployeesVehicles."Employees Name";
                    "Vehicle Description" := EmployeesVehicles.Make + ' ' + EmployeesVehicles.Model;
                end;
                FleetVehicles.Reset;
                FleetVehicles.SetRange("Registration No.", "Registration Number");
                if FleetVehicles.FindFirst then begin
                    "Vehicle Description" := FleetVehicles.Description;
                end;
            end;
        }
        field(4; Date; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Drivers Number"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Vehicle Owner Type" = const("Company Vehicle")) "Vehicle Drivers".Driver
            else if ("Vehicle Owner Type" = const("Staff Vehicle")) Employee."No.";

            trigger OnValidate()
            begin
                if Emp.Get("Drivers Number") then begin
                    "Drivers Name" := Emp.FullName;
                    "Drivers Phone Number" := Emp."Mobile Phone No.";
                    if Emp."Mobile Phone No." = '' then
                        "Drivers Phone Number" := Emp."Phone No.";
                end;
                VehicleDrivers.Reset;
                VehicleDrivers.SetRange(Driver, "Drivers Number");
                if VehicleDrivers.FindFirst then begin
                    "Drivers Name" := VehicleDrivers."Driver Name";
                    "Drivers Phone Number" := VehicleDrivers."Phone Number";
                end;
            end;
        }
        field(6; "Drivers Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Arrival Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Exit Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Vehicle Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Visitors Number"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Visitors Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Tag/ Visitors Pass No"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Reason for Visit"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Officer to Visit"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Emp.Get("Officer to Visit") then
                    "Officer to Visit Name" := Emp.FullName;
            end;
        }
        field(16; "Officer to Visit Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(17; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = New,Posted;
        }
        field(18; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Time In"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Date Out"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Time Out"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Checked in By"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Checked in At"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Checked out By"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Checked out At"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Checked in"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Checked out"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Services Sought"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Services Sought";
        }
        field(36; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(37; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
            end;
        }
        field(38; "Body Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Saloon,Van,Lorry,Moto Cycle,Pickups,Trailer,Bus,Mini Bus';
            OptionMembers = Saloon,Van,Lorry,"Moto Cycle",Pickups,Trailer,Bus,"Mini Bus";
        }
        field(39; "Vehicles Color"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'White,Black,Gray,Silver,Red,Blue,Brown,Green,Beige,Orange,Gold,Yellow,Purple';
            OptionMembers = White,Black,Gray,Silver,Red,Blue,Brown,Green,Beige,Orange,Gold,Yellow,Purple;
        }
        field(40; "Drivers Phone Number"; Code[15])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Vehicle Owner Type" = const("Company Vehicle")) "Vehicle Drivers".Driver
            else if ("Vehicle Owner Type" = const("Staff Vehicle")) Employee."No.";

            trigger OnValidate()
            begin
                if Emp.Get("Drivers Number") then
                    "Drivers Name" := Emp.FullName;
                VehicleDrivers.Reset;
                VehicleDrivers.SetRange(Driver, "Drivers Number");
                if VehicleDrivers.FindFirst then
                    "Drivers Name" := VehicleDrivers."Driver Name";
            end;
        }
        field(41; VehicleContents; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            CRMSetup.Get;
            CRMSetup.TestField("Vehicles Checkin No.");
            rec."No." := NoSeriesMgt.GetNextNo(CRMSetup."Vehicles Checkin No.", WorkDate(), true);
        end;
        Date := Today;
        "Arrival Time" := Time;
    end;

    var
        CRMSetup: Record "CRM Setups";
        NoSeriesMgt: Codeunit "No. Series";
        DimMgt: Codeunit DimensionManagement;
        Emp: Record Employee;
        Inctype: Record "Security Incident Types";
        EmployeesVehicles: Record "Employees Vehicles";
        FleetVehicles: Record "Fleet Vehicles.";
        VehicleDrivers: Record "Vehicle Drivers";

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.SaveDefaultDim(Database::"Visitors Management", "No.", FieldNumber, ShortcutDimCode);
        Modify;
    end;
}

