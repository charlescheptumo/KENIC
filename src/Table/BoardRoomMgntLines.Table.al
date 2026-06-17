#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50031 "Board Room Management Lines"
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
            TableRelation = if (Type = const(Appointment)) Resource."No." where(Type = const(Person),
                                                                               "Global Dimension 2 Code" = field("Department Code"))
            else if (Type = const(Reservation)) Resource."No." where(Type = filter(<> Person));

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Resource No");
                if Resource.FindSet then begin
                    Description := Resource.Name;
                    Capacity := Resource."Resource Capacity";
                    "Department Code" := Resource."Global Dimension 2 Code";
                end;
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
        field(14; "Allocated Resource No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type = const(Appointment)) Resource."No." where(Type = const(Person))
            else if (Type = const(Reservation)) Resource."No." where(Type = filter(<> Person));

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Allocated Resource No");
                if Resource.FindSet then
                    "Allocated Resource Name" := Resource.Name;
            end;
        }
        field(15; "Allocated Resource Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Department Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "HOD Email"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Line No", No, Type, "Resource No")
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

    local procedure FnCheckAvailability(ReservationEntries1: Record "Reservation Entries") Available: Boolean
    begin
    end;
}

