#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 60035 "Board Room Management Alloc"
{

    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; No; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Appointment,Reservation';
            OptionMembers = Appointment,Reservation;
        }
        field(4; "Resource No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type = const(Reservation)) Resource."No." where(Type = const(Machine))
            else
            Resource."No." where(Type = filter(<> Person));

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Resource No");
                if Resource.FindSet then
                    Description := Resource.Name;
                //   Capacity:=Resource."Capacity/Quantity";
            end;
        }
        field(5; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Start Date/Time"; DateTime)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin

                TestField("Resource No");
                ReservationEntries.Reset;
                ReservationEntries.SetRange("Resource No", "Resource No");
                if ReservationEntries.FindLast then begin
                    if ("Start Date/Time" <= ReservationEntries."End Date/Time") and ("Start Date/Time" >= ReservationEntries."Start Date/Time") then begin
                        Error('Error ! Already Booked for the specified time');
                    end else begin
                        //MESSAGE(' acceptable');
                    end;
                end;
            end;
        }
        field(7; "Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Duration; Duration)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "End Date/Time"; DateTime)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                TestField("Resource No");
                ReservationEntries.Reset;
                ReservationEntries.SetRange("Resource No", "Resource No");
                if ReservationEntries.FindLast then begin
                    if ("End Date/Time" <= ReservationEntries."End Date/Time") and ("End Date/Time" >= ReservationEntries."Start Date/Time") then begin
                        Error('Error! Already Booked for the specified time');
                    end else begin
                        //MESSAGE(' acceptable');
                        Duration := "End Date/Time" - "Start Date/Time";
                    end;
                end;
                /*
               IF ("End Date/Time"<ReservationEntries."End Date/Time") AND ("End Date/Time">ReservationEntries."Start Date/Time") THEN BEGIN
                  IF ReservationEntries.COUNT>1 THEN
                  ERROR('Not acceptable');
                END ELSE BEGIN
                  Duration:="End Date/Time"-"Start Date/Time";
               END;
             END;
             */
                /*starttime:=DT2TIME("Start Date/Time");
                endtime:=DT2TIME("End Date/Time");
                Duration:=endtime-starttime;*/

            end;
        }
        field(10; Reason; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Capacity; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "End Time"; Time)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Start Time" >= "End Time" then begin
                    Error('End time must be later than start time');
                end;
                Duration := "End Time" - "Start Time";
            end;
        }
        field(13; Date; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Allocated Employee"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Employee.Get("Allocated Employee") then begin
                    "Allocated Employee Email" := Employee.FullName;
                    "Allocated Employee Email" := Employee."E-Mail";
                end;
            end;
        }
        field(15; "Board Room Tag"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Allocated Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(17; "Allocated Employee Email"; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(18; "Resourse Returned"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
            end;
        }
        field(40; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                /*ValidateShortcutDimCode(2,"Global Dimension 2 Code");
                Employee.RESET;
                Employee.SETRANGE(Employee."Global Dimension 2 Code","Global Dimension 2 Code");
                Employee.SETRANGE(Employee.HOD,TRUE);
                IF Employee.FINDFIRST THEN BEGIN
                  "Assigned Officer No." := Employee."No.";
                  VALIDATE("Assigned Officer No.");
                END;
                */

            end;
        }
    }

    keys
    {
        key(Key1; "Line No", No, Type, "Resource No", "Allocated Employee")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Resource;
        starttime: Time;
        endtime: Time;
        ReservationEntries: Record "Reservation Entries";
        Employee: Record Employee;
        DimMgt: Codeunit DimensionManagement;

    local procedure FnCheckAvailability(ReservationEntries1: Record "Reservation Entries") Available: Boolean
    begin
    end;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.SaveDefaultDim(Database::"Board Room Management Alloc", No, FieldNumber, ShortcutDimCode);
        Modify;
    end;
}

