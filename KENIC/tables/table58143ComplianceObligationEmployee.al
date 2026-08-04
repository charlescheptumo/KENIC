table 58143 "Compliance Obligation Employee"
{
    Caption = 'Compliance Obligation Employee';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Obligation No."; Code[20])
        {
            Caption = 'Obligation No.';
            TableRelation = "Compliance Obligation"."No.";
        }
        field(2; "Employee No."; Code[50])
        {
            Caption = 'Member No.';
            TableRelation = "Employee"."No.";

            trigger OnValidate()
            var
                Employee: Record "Employee";
            begin
                Employee.Reset();
                Employee.SetRange("No.", "Employee No.");
                if Employee.FindFirst() then begin
                    "Employee Name" := Employee.FullName();
                    // "Employee Email" := BoardMember."E-Mail";
                    "Employee Email" := Employee."Company E-Mail";
                end else begin
                    "Employee Name" := '';
                    "Employee Email" := '';
                end;
            end;
        }
        field(3; "Employee Name"; Text[100])
        {
            Caption = 'Member Name';
            Editable = false;
        }
        field(4; "Employee Email"; Text[80])
        {
            Caption = 'E-mail';
            Editable = false;
        }
        field(5; Status; Enum "Employee Obligation Status")
        {
            Caption = 'Status';

            trigger OnValidate()
            begin
                if Status = Status::Completed then begin
                    Completed := true;
                    "Completed DateTime" := CurrentDateTime;
                end else begin
                    Completed := false;
                    "Completed DateTime" := 0DT;
                end;
                UpdateCalendarEntryStatus();
                //UpdateParentStatus();
            end;
        }
        field(6; Completed; Boolean)
        {
            Caption = 'Completed';
            Editable = false;
        }
        field(7; "Completed DateTime"; DateTime)
        {
            Caption = 'Completed Date/Time';
            Editable = false;
        }
        field(8; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }
    }

    keys
    {
        key(PK; "Obligation No.", "Employee No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        CheckObligationNotPosted();
    end;

    trigger OnModify()
    begin
        UpdateParentStatus();
    end;

    trigger OnDelete()
    begin
        CheckObligationNotPosted();
    end;

    local procedure CheckObligationNotPosted()
    var
        ComplianceObligation: Record "Compliance Obligation";
    begin
        if ComplianceObligation.Get(Rec."Obligation No.") then
            if ComplianceObligation.Posted then
                Error('You cannot add or delete assigned employees on a posted Compliance Obligation.');
    end;

    local procedure UpdateParentStatus()
    var
        ComplianceObligation: Record "Compliance Obligation";
    begin
        if ComplianceObligation.Get(Rec."Obligation No.") then
            if ComplianceObligation.Posted then begin
                ComplianceObligation.UpdateStatus();
                ComplianceObligation.Modify(false);
            end;
    end;

    local procedure UpdateCalendarEntryStatus()
    var
        CalendarEntry: Record "Compliance Calendar Entry";
    begin
        CalendarEntry.SetRange("Obligation No.", "Obligation No.");
        CalendarEntry.SetRange("Assigned Employee No.", "Employee No.");

        if CalendarEntry.FindFirst() then begin
            case Status of
                Status::Open:
                    begin
                        CalendarEntry.Status := CalendarEntry.Status::Open;
                        CalendarEntry."Completion Date" := 0D;
                    end;

                Status::"In Progress":
                    begin
                        CalendarEntry.Status := CalendarEntry.Status::"In Progress";
                        CalendarEntry."Completion Date" := 0D;
                    end;

                Status::Completed:
                    begin
                        CalendarEntry.Status := CalendarEntry.Status::Completed;
                        CalendarEntry."Completion Date" := DT2Date("Completed DateTime");
                    end;

                Status::Overdue:
                    begin
                        CalendarEntry.Status := CalendarEntry.Status::Overdue;
                        CalendarEntry."Completion Date" := 0D;
                    end;
            end;

            CalendarEntry.Modify(true);
        end;
    end;


}