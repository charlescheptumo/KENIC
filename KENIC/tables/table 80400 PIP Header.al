table 80400 "PIP Header"
{
    Caption = 'Performance Improvement Plan';
    DataClassification = ToBeClassified;
    DrillDownPageID = "PIP List";
    LookupPageID = "PIP List";

    fields
    {
        field(1; No; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    SPMSetup.Get();
                    NoSeriesMgt.TestManual(SPMSetup."PIP Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Employee No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where(Status = const(Active));

            trigger OnValidate()
            begin
                if "Employee No." <> xRec."Employee No." then
                    "Personal Scorecard ID" := '';

                if Employee.Get("Employee No.") then begin
                    "Employee Name" := Employee.FullName;
                    "Directorate Code" := Employee."Directorate Code";
                    "Department Code" := Employee."Department Code";
                end else begin
                    "Employee Name" := '';
                    "Directorate Code" := '';
                    "Department Code" := '';
                end;

                Description := StrSubstNo('Performance Improvement Plan_%1', "Employee No.");
            end;
        }
        field(3; "Employee Name"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(5; "Department Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
        field(6; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Personal Scorecard ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Perfomance Contract Header".No where("Responsible Employee No." = field("Employee No."),
                                                                   "Approval Status" = const(Released));

            trigger OnValidate()
            begin
                if "Personal Scorecard ID" = '' then
                    exit;
                if Scorecard.Get("Personal Scorecard ID") then
                    Validate("Year Reporting Code", Scorecard."Annual Reporting Code");
            end;
        }
        field(9; "Year Reporting Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes".Code;
        }
        field(10; "Reporting Quarter Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Quarterly Reporting Periods".Code where("Year Code" = field("Year Reporting Code"));
        }
        field(11; "Performance Rating"; Text[100])
        {
            Caption = 'Performance Rating (as described in appraisal)';
            DataClassification = ToBeClassified;
        }
        field(12; "Supervisor No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where(Status = const(Active));

            trigger OnValidate()
            begin
                if Supervisor.Get("Supervisor No.") then
                    "Supervisor Name" := Supervisor.FullName
                else
                    "Supervisor Name" := '';
            end;
        }
        field(13; "Supervisor Name"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "PIP Duration (Days)"; Integer)
        {
            DataClassification = ToBeClassified;
            InitValue = 90;
            MinValue = 0;

            trigger OnValidate()
            begin
                CalcEndDate();
            end;
        }
        field(15; "Start Date"; Date)
        {
            Caption = 'Effective Date';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                CalcEndDate();
            end;
        }
        field(16; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Released,Pending Approval,Rejected';
            OptionMembers = Open,Released,"Pending Approval",Rejected;
        }
        field(18; "PIP Outcome"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Not Started,In Progress,Successfully Completed,Extended,Unsuccessful';
            OptionMembers = "Not Started","In Progress","Successfully Completed",Extended,Unsuccessful;
        }
        field(19; "Employee Acknowledged"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Employee Acknowledged" then
                    "Employee Acknowledged On" := Today
                else
                    "Employee Acknowledged On" := 0D;
            end;
        }
        field(20; "Employee Acknowledged On"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; "Supervisor Signed"; Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Supervisor Signed" then
                    "Supervisor Signed On" := Today
                else
                    "Supervisor Signed On" := 0D;
            end;
        }
        field(22; "Supervisor Signed On"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23; Remarks; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "No. Series"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Created On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
        key(Key2; "Employee No.", "Year Reporting Code", "Reporting Quarter Code")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; No, Description, "Employee No.", "Employee Name")
        {
        }
    }

    trigger OnInsert()
    begin
        if No = '' then begin
            SPMSetup.Get();
            SPMSetup.TestField("PIP Nos");
            No := NoSeriesMgt.GetNextNo(SPMSetup."PIP Nos", WorkDate(), true);
        end;

        "Document Date" := Today;
        "Created By" := UserId;
        "Created On" := Today;
        "Created Time" := Time;
    end;

    trigger OnDelete()
    var
        ConcernLine: Record "PIP Area of Concern";
        GoalLine: Record "PIP Improvement Goal";
        ActivityLine: Record "PIP Activity";
        ResourceLine: Record "PIP Resource";
        ExpectationLine: Record "PIP Expectation";
        CheckpointLine: Record "PIP Checkpoint";
    begin
        TestField("Approval Status", "Approval Status"::Open);

        ConcernLine.SetRange("PIP No.", No);
        ConcernLine.DeleteAll();
        GoalLine.SetRange("PIP No.", No);
        GoalLine.DeleteAll();
        ActivityLine.SetRange("PIP No.", No);
        ActivityLine.DeleteAll();
        ResourceLine.SetRange("PIP No.", No);
        ResourceLine.DeleteAll();
        ExpectationLine.SetRange("PIP No.", No);
        ExpectationLine.DeleteAll();
        CheckpointLine.SetRange("PIP No.", No);
        CheckpointLine.DeleteAll();
    end;

    local procedure CalcEndDate()
    begin
        if ("Start Date" <> 0D) and ("PIP Duration (Days)" > 0) then
            "End Date" := "Start Date" + "PIP Duration (Days)";
    end;

    procedure SuggestCheckpoints()
    var
        CheckpointLine: Record "PIP Checkpoint";
    begin
        TestField("Start Date");

        CheckpointLine.SetRange("PIP No.", No);
        if not CheckpointLine.IsEmpty then
            Error('Progress checkpoints already exist for PIP %1. Delete them first to regenerate.', No);

        InsertCheckpoint(10000, 30, '30-day meeting with manager to update on performance', 'Supervisor');
        InsertCheckpoint(20000, 60, '60-day meeting with manager to update on performance', 'Supervisor');
        InsertCheckpoint(30000, 90, '90-day update on performance and next steps', 'Supervisor, HR or CEO');
    end;

    local procedure InsertCheckpoint(LineNo: Integer; DaysFromStart: Integer; ActivityText: Text[250]; ConductedBy: Text[100])
    var
        CheckpointLine: Record "PIP Checkpoint";
    begin
        CheckpointLine.Init();
        CheckpointLine."PIP No." := No;
        CheckpointLine."Line No." := LineNo;
        CheckpointLine."Scheduled Date" := "Start Date" + DaysFromStart;
        CheckpointLine.Activity := ActivityText;
        CheckpointLine."Conducted By" := ConductedBy;
        CheckpointLine.Insert(true);
    end;

    procedure ValidateBeforeSubmit()
    var
        ConcernLine: Record "PIP Area of Concern";
        GoalLine: Record "PIP Improvement Goal";
        ActivityLine: Record "PIP Activity";
        ExpectationLine: Record "PIP Expectation";
        CheckpointLine: Record "PIP Checkpoint";
    begin
        TestField("Employee No.");
        TestField("Supervisor No.");
        TestField("Year Reporting Code");
        TestField("Reporting Quarter Code");
        TestField("Start Date");
        TestField("End Date");

        ConcernLine.SetRange("PIP No.", No);
        if ConcernLine.IsEmpty then
            Error('Add at least one Area of Concern.');
        GoalLine.SetRange("PIP No.", No);
        if GoalLine.IsEmpty then
            Error('Add at least one Improvement Goal (Step 1).');
        ActivityLine.SetRange("PIP No.", No);
        if ActivityLine.IsEmpty then
            Error('Add at least one Activity (Step 2).');
        ExpectationLine.SetRange("PIP No.", No);
        if ExpectationLine.IsEmpty then
            Error('Add at least one Expectation (Step 4).');
        CheckpointLine.SetRange("PIP No.", No);
        if CheckpointLine.IsEmpty then
            Error('Generate or add Progress Checkpoints (Step 5).');
    end;

    var
        Employee: Record Employee;
        Supervisor: Record Employee;
        Scorecard: Record "Perfomance Contract Header";
        SPMSetup: Record "SPM General Setup";
        NoSeriesMgt: Codeunit "No. Series";
}
