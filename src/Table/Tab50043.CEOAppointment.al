table 50043 "CEO Appointment"
{
    Caption = 'CEO Appointment';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No"; Code[100])
        {
            Caption = 'No';
        }
        field(2; Description; Text[2048])
        {
        }
        field(3; "Appointment Date"; Date)
        {

        }
        field(4; "Appointment Status"; Enum "CEO Booking Status")
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Requested by Employee No"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Emp.reset();
                Emp.SetRange("No.", Rec."Requested by Employee No");
                if Emp.Find('-') then begin
                    "Requested by Employee Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                    "Requested by Employee UserID" := Emp."User ID";
                    "Requested By Employee Email" := Emp."Company E-Mail";
                end;
            end;
        }
        field(6; "Requested by Employee Name"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "CEO No"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where(CEO = const(true));

            trigger OnValidate()
            begin
                Emp.Reset();
                Emp.SetRange("No.", "CEO No");
                if Emp.Find('-') then begin
                    "CEO Email" := Emp."E-Mail";
                end
            end;
        }
        field(8; "CEO Email"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Rescheduled Date"; Date)
        {

        }
        field(10; "Requested By Employee Email"; Code[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "CEO Remarks"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Appointment Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Requested Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Rescheduled Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Requested by Employee UserID"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Appointment End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Appointment End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Meeting Subject"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "No Series"; Code[500])
        {

        }
        field(21; "Is Online?"; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if "Is Online?" = true then
                    Rec."Meeting Venue" := 'Microsoft Teams'
                else
                    Rec."Meeting Venue" := '';
            end;

        }
        field(22; "Meeting Venue"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Rescheduled End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Rescheduled Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if No = '' then begin
            HRSet.Get();
            HRSet.Testfield("CEO Booking Nos");
     rec."No" := NoSeriesMgt.GetNextNo(HRSET."CEO Booking Nos", WorkDate(), true);
        end;
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        //HRSet: Record "Crm General Setup.";
        HRSet: Record "Human Resources Setup";
        Emp: Record Employee;
}
