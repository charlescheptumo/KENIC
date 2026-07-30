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

            trigger OnValidate()
            begin
                if ("Next Due Date" <> 0D) and ("Start Date" > "Next Due Date") then
                    Error('Start Date cannot be later than the Next Due Date.');
            end;
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
            Caption = 'Board Member(s)';
            FieldClass = FlowField;
            CalcFormula = count("Compliance Obligation Employee" where("Obligation No." = field("No.")));
            Editable = false;
        }

        field(21; Posted; Boolean)
        {
            Caption = 'Posted';
            Editable = false;
        }

        field(22; "Assigned By Employee No."; Code[20])
        {
            Caption = 'Posted By Employee No.';
            TableRelation = Employee."No.";
            Editable = false;
        }

        field(23; "Assigned By Employee Name"; Text[100])
        {
            Caption = 'Posted By';
            Editable = false;
        }

        field(24; "Assigned By Email"; Text[80])
        {
            Caption = 'Posted By E-mail';
            Editable = false;
        }
        field(25; "Manager Notification Sent"; Boolean)
        {
            Caption = 'Due Date Notification Sent';
            Editable = false;
        }
       
        field(50; "Legislation Code"; Code[20])
        {
            Caption = 'Governing Legislation Code';
            TableRelation = "Compliance Legislation";
            DataClassification = CustomerContent;
        }

      
        field(51; "Legislation Name"; Text[100])
        {
            Caption = 'Governing Legislation';
            FieldClass = FlowField;
            CalcFormula = lookup("Compliance Legislation".Description where(Code = field("Legislation Code")));
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
            Rec."No." := NoSeries.GetNextNo(EBoardSetup."Compliance Obligation Nos.", Today(), true);
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

    procedure UpdateStatus()
    var
        ObligationEmp: Record "Compliance Obligation Employee";
        TotalAssigned: Integer;
        CompletedCount: Integer;
    begin

        if not Rec.Posted then begin
            Rec.Status := Rec.Status::Open;
            exit;
        end;


        ObligationEmp.SetRange("Obligation No.", Rec."No.");
        TotalAssigned := ObligationEmp.Count();

        if TotalAssigned > 0 then begin
            ObligationEmp.SetRange(Status, ObligationEmp.Status::Completed);
            CompletedCount := ObligationEmp.Count();
        end;


        if (TotalAssigned > 0) and (CompletedCount = TotalAssigned) then
            Rec.Status := Rec.Status::Completed
        else if (Rec."Next Due Date" <> 0D) and (Today() > Rec."Next Due Date") then
            Rec.Status := Rec.Status::Overdue
        else
            Rec.Status := Rec.Status::"In Progress";
    end;

    local procedure UpdateEmployeeStatuses()
    var
        ObligationEmp: Record "Compliance Obligation Employee";
    begin
        ObligationEmp.SetRange("Obligation No.", "No.");

        if ObligationEmp.FindSet() then
            repeat
                if ObligationEmp.Status = ObligationEmp.Status::Open then begin
                    ObligationEmp.Status := ObligationEmp.Status::"In Progress";
                    ObligationEmp.Modify(true);
                end;
            until ObligationEmp.Next() = 0;
    end;

    procedure PostObligation()
    var
        ObligationEmp: Record "Compliance Obligation Employee";
        ComplianceCalendar: Codeunit "Compliance Calendar";
        UserSetup: Record "User Setup";
        Employee: Record Employee;
        ConfirmQst: Label 'Are you sure you want to post Compliance Obligation %1?\n\nThis will generate compliance calendar entries and notify assigned employee(s).', Comment = '%1 = Obligation No.';
        NoEmployeeErr: Label 'You must assign at least one employee before posting.';
    begin
        if Rec.Posted then
            Error('Compliance Obligation %1 has already been posted.', Rec."No.");

        Rec.TestField("Category Code");
        Rec.TestField(Title);
        Rec.TestField("Start Date");
        Rec.TestField("Next Due Date");

        ObligationEmp.SetRange("Obligation No.", Rec."No.");
        if ObligationEmp.IsEmpty() then
            Error(NoEmployeeErr);

        if not Confirm(StrSubstNo(ConfirmQst, Rec."No."), false) then
            exit;


        if UserSetup.Get(UserId()) then
            if Employee.Get(UserSetup."Employee No.") then begin
                Rec."Assigned By Employee No." := Employee."No.";
                Rec."Assigned By Employee Name" := Employee.FullName();
                Rec."Assigned By Email" := Employee."E-Mail";
            end;


        ComplianceCalendar.GenerateCalendarEntries(Rec);

        Rec."Manager Notification Sent" := false;
        Rec.Posted := true;
        UpdateEmployeeStatuses();
        Rec.UpdateStatus();
        Rec.Modify(true);

        ComplianceCalendar.SendTaskAssignmentNotifications(Rec);

    end;
}