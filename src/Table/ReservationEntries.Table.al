#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50029 "Reservation Entries"
{

    fields
    {
        field(1; "Entry No"; Integer)
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
        field(4; "Resource No"; Code[40])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //Resource.RESET;
                //Resource.SETRANGE("No.","Resource No");
                //IF Resource.FINDSET THEN
                // Description:=Resource.Name;
            end;
        }
        field(5; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Start Date/Time"; DateTime)
        {
            DataClassification = ToBeClassified;
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
        }
        field(10; Reason; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Capacity; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Requestor ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Requestor Employee No"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Requestor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(16; Date; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Resource;
}

