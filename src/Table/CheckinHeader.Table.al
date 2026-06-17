#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 60006 "Checkin Header"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                case "Document Type" of
                    "document type"::Staff:
                        begin
                            if "No." <> xRec."No." then begin
                                CRMSetup.Get;
                                NoSeriesMgt.TestManual(CRMSetup."Staff Checkin No.");
                                "No. Series" := '';
                            end;
                        end;
                    else begin
                        if "No." <> xRec."No." then begin
                            CRMSetup.Get;
                            NoSeriesMgt.TestManual(CRMSetup."Security Incidence No.");
                            "No. Series" := '';
                        end;
                    end;
                end
            end;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Staff,Small Works,Service Providers,Vistors';
            OptionMembers = Staff,"Small Works","Service Providers",Vistors;
        }
        field(3; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Number; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Document Type" = const(Staff)) Employee."No.";

            trigger OnValidate()
            begin
                if Emp.Get(Number) then begin
                    Name := Emp.FullName;
                    Date := Today;
                    "Time In" := Time;
                end;
            end;
        }
        field(5; Name; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; Date; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Time In"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Date Out"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Time Out"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(10; Comments; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Checked in By"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Checked in At"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Checked out By"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Checked out At"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Checked in"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Checked out"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Has a Car"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Registration Number"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employees Vehicles"."Registration No." where("Employee no." = field(Number));

            trigger OnValidate()
            begin
                EmployeesVehicles.Reset;
                EmployeesVehicles.SetRange(EmployeesVehicles."Registration No.", "Registration Number");
                if EmployeesVehicles.FindFirst then begin
                    "Vehicle Description" := EmployeesVehicles.Make + ' ' + EmployeesVehicles.Model;
                    "Vehicles Color" := EmployeesVehicles."Vehicles Color";
                    "Body Type" := EmployeesVehicles."Body Type";
                end;
            end;
        }
        field(19; "Vehicle Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Body Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Saloon,Van,Lorry,Moto Cycle,Pickups,Trailer,Bus,Mini Bus';
            OptionMembers = Saloon,Van,Lorry,"Moto Cycle",Pickups,Trailer,Bus,"Mini Bus";
        }
        field(21; "Vehicles Color"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'White,Black,Gray,Silver,Red,Blue,Brown,Green,Beige,Orange,Gold,Yellow,Purple';
            OptionMembers = White,Black,Gray,Silver,Red,Blue,Brown,Green,Beige,Orange,Gold,Yellow,Purple;
        }
        field(22; "Vehicle Gate Pass"; Code[20])
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
        case "Document Type" of
            "document type"::Staff:
                begin
                    if "No." = '' then begin
                        CRMSetup.Get;
                        CRMSetup.TestField("Staff Checkin No.");
                  rec."No." := NoSeriesMgt.GetNextNo(CRMSetup."Staff Checkin No.", WorkDate(), true);
                    end;
                end;
            else begin
                if "No." = '' then begin
                    CRMSetup.Get;
                    CRMSetup.TestField("Security Incidence No.");
                      rec."No." := NoSeriesMgt.GetNextNo(CRMSetup."Staff Checkin No.", WorkDate(), true);
                end;
            end;
        end;
    end;

    var
        CRMSetup: Record "CRM Setups";
        NoSeriesMgt: Codeunit "No. Series";
        DimMgt: Codeunit DimensionManagement;
        Emp: Record Employee;
        Inctype: Record "Security Incident Types";
        EmployeesVehicles: Record "Employees Vehicles";
}

