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
        field(2; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            TableRelation = Employee."No.";

            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                if Employee.Get("Employee No.") then begin
                    "Employee Name" := Employee.FullName();
                    "Employee Email" := Employee."E-Mail";
                end else begin
                    "Employee Name" := '';
                    "Employee Email" := '';
                end;
            end;
        }
        field(3; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
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
                UpdateParentStatus();
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
        if ComplianceObligation.Get(Rec."Obligation No.") then begin
            ComplianceObligation.UpdateStatus();
            ComplianceObligation.Modify(true);
        end;
    end;


}