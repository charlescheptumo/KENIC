table 57118 "Compliance Obligation"
{
    Caption = 'Compliance Obligation';
    DataClassification = CustomerContent;
    LookupPageId = "Compliance Obligations";
    DrillDownPageId = "Compliance Obligations";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            var
                EBoardSetup: Record "E-Board Setup";
                NoSeries: Codeunit "No. Series";
            begin
                if Rec."No." <> xRec."No." then begin
                    EBoardSetup.GetRecordOnce();
                    EBoardSetup.TestField("Compliance Obligation Nos.");
                    NoSeries.TestManual(EBoardSetup."Compliance Obligation Nos.");
                end;
            end;
        }

        field(2; Title; Text[150])
        {
            Caption = 'Title';

            trigger OnValidate()
            begin
                Title := DelChr(Title, '<>');
            end;
        }

        field(3; "Category Code"; Code[20])
        {
            Caption = 'Category Code';
            TableRelation = "Compliance Category".Code where(Active = const(true));
        }

        field(4; Frequency; Enum "Compliance Frequency")
        {
            Caption = 'Frequency';
        }

        field(5; Status; Enum "Compliance Entry Status")
        {
            Caption = 'Status';
        }

        field(6; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }

        field(7; "Next Due Date"; Date)
        {
            Caption = 'Next Due Date';

            trigger OnValidate()
            begin
                if ("Start Date" <> 0D) and ("Next Due Date" < "Start Date") then
                    Error('Next Due Date cannot be earlier than the Start Date.');
            end;
        }

        field(8; "Reminder Days"; Integer)
        {
            Caption = 'Reminder Days';
            InitValue = 7;
            MinValue = 0;
            ToolTip = 'Specifies how many days before the due date reminder notifications are sent.';
        }

        field(9; Priority; Enum "Compliance Priority")
        {
            Caption = 'Priority';
        }

        field(10; "Evidence Required"; Boolean)
        {
            Caption = 'Evidence Required';
            ToolTip = 'Specifies whether supporting evidence must be attached when completing this obligation.';
        }

        field(11; Active; Boolean)
        {
            Caption = 'Active';
            InitValue = true;
        }

        field(12; Description; Text[2048])
        {
            Caption = 'Description';
        }

        field(13; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }

        field(14; "Created By"; Code[50])
        {
            Caption = 'Created By';
            Editable = false;
            TableRelation = "User Setup"."User ID";
        }

        field(15; "Created DateTime"; DateTime)
        {
            Caption = 'Created DateTime';
            Editable = false;
        }

        field(16; "Last Modified By"; Code[50])
        {
            Caption = 'Last Modified By';
            Editable = false;
            TableRelation = "User Setup"."User ID";
        }

        field(17; "Last Modified DateTime"; DateTime)
        {
            Caption = 'Last Modified DateTime';
            Editable = false;
        }

        field(18; "Primary Employee No."; Code[20])
        {
            Caption = 'Primary Assigned Employee';
            TableRelation = Employee."No.";
            ToolTip = 'Specifies the main employee responsible for this compliance obligation.';


            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                if Employee.Get("Primary Employee No.") then
                    "Primary Employee Name" := Employee.FullName()
                else
                    "Primary Employee Name" := '';
            end;


        }

        field(19; "Primary Employee Name"; Text[100])
        {
            Caption = 'Primary Employee Name';
            Editable = false;
        }

        field(20; "Assigned Employees Count"; Integer)
        {
            Caption = 'Assigned Employees';
            FieldClass = FlowField;
            CalcFormula = count("Compliance Obligation Employee" where("Obligation No." = field("No.")));
            Editable = false;
        }

        field(21; Posted; Boolean)
        {
            Caption = 'Posted';
            Editable = false;
        }

      
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }

        key(Category; "Category Code", Active)
        {
        }

        key(EmployeeDueDate; "Primary Employee No.", "Next Due Date")
        {
        }
    }

    trigger OnInsert()
    var
        EBoardSetup: Record "E-Board Setup";
        NoSeries: Codeunit "No. Series";
    begin
        if Rec."No." = '' then begin
            EBoardSetup.GetRecordOnce();
            EBoardSetup.TestField("Compliance Obligation Nos.");
            Rec."No." := NoSeries.GetNextNo(EBoardSetup."Compliance Obligation Nos.", WorkDate(), true);
        end;

        Rec.Status := Rec.Status::Open;
        Rec."Created By" := UserId();
        Rec."Created DateTime" := CurrentDateTime();
    end;

    trigger OnModify()
    begin
        Rec."Last Modified By" := UserId();
        Rec."Last Modified DateTime" := CurrentDateTime();
    end;

    trigger OnDelete()
    var
        ComplianceEntry: Record "Compliance Calendar Entry";
        ObligationEmployee: Record "Compliance Obligation Employee";
    begin
        if Rec.Posted then
            Error('Compliance Obligation %1 cannot be deleted because it has already been posted.', Rec."No.");

        ComplianceEntry.SetRange("Obligation No.", Rec."No.");
        if not ComplianceEntry.IsEmpty() then
            Error('Compliance Obligation %1 cannot be deleted because compliance calendar entries already exist for it.', Rec."No.");

        ObligationEmployee.SetRange("Obligation No.", Rec."No.");
        if not ObligationEmployee.IsEmpty() then
            ObligationEmployee.DeleteAll();
    end;

    /// <summary>
    /// Validates mandatory fields, asks for user confirmation, generates calendar entries, and marks the record as Posted.
    /// </summary>
    procedure PostObligation()
    var
        ObligationEmp: Record "Compliance Obligation Employee";
        ComplianceCalendar: Codeunit "Compliance Calendar";
        ConfirmQst: Label 'Are you sure you want to post Compliance Obligation %1?\n\nThis will generate compliance calendar entries and notify the assigned employee(s) via email and portal.', Comment = '%1 = Obligation No.';
        NoEmployeeErr: Label 'You must assign at least one employee (either a Primary Employee or via Assigned Employees) before posting.';
    begin
        // 1. Prevent Re-posting
        if Rec.Posted then
            Error('Compliance Obligation %1 has already been posted.', Rec."No.");

        // 2. Validate Mandatory Category
        Rec.TestField("Category Code");
        Rec.TestField(Title);

        // 3. Validate Employee Assignment (Primary OR Sub-table)
        ObligationEmp.Reset();
        ObligationEmp.SetRange("Obligation No.", Rec."No.");
        if (Rec."Primary Employee No." = '') and ObligationEmp.IsEmpty() then
            Error(NoEmployeeErr);

        // 4. Confirmation Dialog
        if not Confirm(StrSubstNo(ConfirmQst, Rec."No."), false) then
            exit;

        // 5. Generate Calendar Entries
        ComplianceCalendar.GenerateCalendarEntries(Rec);

        // 6. Update Status & Mark as Posted
        Rec.Posted := true;
        Rec.Status := Rec.Status::"In Progress";
        Rec.Modify(true);
    end;
}