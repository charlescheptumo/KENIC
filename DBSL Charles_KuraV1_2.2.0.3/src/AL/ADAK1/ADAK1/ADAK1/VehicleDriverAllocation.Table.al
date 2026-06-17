
/// <summary>
/// Table Vehicle Driver Allocation (ID 59020).
/// </summary>
Table 59020 "Vehicle Driver Allocation"
{

    fields
    {
        field(1; "Requisition Number"; Code[30])
        {
            TableRelation = "Transport Requisition"."Transport Requisition No";
        }
        field(2; "Driver Code"; Code[30])
        {
            TableRelation = Employee."No." where("Driver?" = const(true));
            trigger OnValidate()
            var
                Emp: Record Employee;
                TransportReq: Record "Transport Requisition";
            begin
                if Emp.Get("Driver Code") then begin
                    "Driver Name" := Emp.FullName();
                 if TransportReq.Get("Requisition Number") then
                 Rec."Number of Hours" :=  TransportReq."Number of Hours Requested";
                 Rec."Trip End Date" := TransportReq."Trip End Date";
                 Rec."Date of Trip" := TransportReq."Date of Trip";
                end;
            end;
        }
        field(3; "Driver Name"; Text[100])
        {

        }
        field(4; "Number of Days"; Decimal)
        {

        }
        field(7; "Reassigned?"; Boolean)
        {

        }
        field(8; "New Trip"; Code[100])
        {

        }
        field(9; "Date of Trip"; Date)
        {

        }
        field(10; "Status"; enum "Purchase Document Status")
        {

        }
        field(11; "Trip End Date"; Date)
        {

        }
        field(12; "Date Reassigned"; Date)
        {

        }
        field(13; "Requisition Status"; Enum "Employee Status")
        {

        }
        field(14; "Registration Number"; Code[20])
        {
            TableRelation = "Fleet Vehicles."."Registration No.";
            trigger OnValidate()
            var
                FleetVehicle: Record "Fleet Vehicles.";
            begin
                FleetVehicle.Reset();
                FleetVehicle.SetRange("Registration No.", Rec."Registration Number");
                if FleetVehicle.FindFirst() then begin
                    Rec."Vehicle Description" := FleetVehicle.Description;
                end;
            end;
        }
        field(15; "Vehicle Description"; Text[100])
        {

        }
        field(16; "Number of Hours"; Decimal)
        {

        }

    }


}