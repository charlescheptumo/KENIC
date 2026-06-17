#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 60010 "Visitors Vehicle Occupants"
{

    fields
    {
        field(1; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Passenger Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Guests,Staff,Suppliers';
            OptionMembers = Guests,Staff,Suppliers;
        }
        field(4; Date; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Visitors Number"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Passenger Type" = const(Staff)) Employee."No." where("Employee Posting Group" = filter(<> 'PCASH'));

            trigger OnValidate()
            begin
                if Emp.Get("Visitors Number") then
                    "Visitors Name" := Emp.FullName;
                if VisitorsManagement.Get("Document No") then begin
                    "Arrival Time" := VisitorsManagement."Arrival Time";
                    "Services Sought" := VisitorsManagement."Services Sought";
                end;
            end;
        }
        field(6; "Visitors Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Tag/ Visitors Pass No"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Arrival Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Exit Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Reason for Visit"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Official,Personal';
            OptionMembers = Official,Personal;
        }
        field(11; "Officer to Visit"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Emp.Get("Officer to Visit") then
                    "Officer to Visit Name" := Emp.FullName;
            end;
        }
        field(12; "Officer to Visit Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Visitor Walkin"; Boolean)
        {
            DataClassification = ToBeClassified;
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
    }

    keys
    {
        key(Key1; "Document No", "Entry No", Date)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Visitor Walkin" = true then begin
            CRMSetup.Get;
            CRMSetup.TestField("Staff Checkin No.");
            "Document No" := NoSeriesManagement.GetNextNo(CRMSetup."Staff Checkin No.", Today, true);
        end;
    end;

    var
        Emp: Record Employee;
        CRMSetup: Record "CRM Setups";
        NoSeriesManagement: Codeunit "No. Series";
        NoSeriesMgt: Codeunit "No. Series";
        DimMgt: Codeunit DimensionManagement;
        Inctype: Record "Security Incident Types";
        EmployeesVehicles: Record "Employees Vehicles";
        FleetVehicles: Record "Fleet Vehicles.";
        VehicleDrivers: Record "Vehicle Drivers";
        VisitorsManagement: Record "Visitors Management";

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.SaveDefaultDim(Database::"Visitors Vehicle Occupants", "Document No", FieldNumber, ShortcutDimCode);
        Modify;
    end;
}

