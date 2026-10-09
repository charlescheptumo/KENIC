
table 80301 "360 Evaluation Header"
{
    Caption = '360 Evaluation';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[30])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SPMSetup.Get();
                    NoSeriesMgt.TestManual(SPMSetup."360 Evaluation Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Evaluator Employee No."; Code[50])
        {
            Caption = 'Evaluator Employee No.';
            TableRelation = Employee."No." where(Status = const(Active));

            trigger OnValidate()
            begin
                if Employee.Get("Evaluator Employee No.") then
                    "Evaluator Name" := Employee.FullName()
                else
                    "Evaluator Name" := '';
                UpdateSelfFlag();
                CheckEvaluatorEligibility();
                CheckDuplicate();
            end;
        }
        field(3; "Evaluatee Employee No."; Code[50])
        {
            Caption = 'Evaluatee Employee No.';
            TableRelation = Employee."No." where(Status = const(Active));

            trigger OnValidate()
            begin
                if Employee.Get("Evaluatee Employee No.") then begin
                    "Evaluatee Name" := Employee.FullName();
                    "Evaluatee Category" := SetupMgt.GetCategory("Evaluatee Employee No.");
                end else
                    "Evaluatee Name" := '';
                UpdateSelfFlag();
                CheckEvaluatorEligibility();
                CheckDuplicate();
            end;
        }
        field(4; "Evaluator Name"; Text[255])
        {
            Caption = 'Evaluator Name';
            Editable = false;
        }
        field(5; "Evaluatee Name"; Text[255])
        {
            Caption = 'Evaluatee Name';
            Editable = false;
        }
        field(6; "Evaluatee Category"; Enum "360 Category")
        {
            Caption = 'Evaluatee Category';
            Editable = false;   // derived from the evaluatee's Job Title (see SPM General Setup)
        }
        field(7; "Self Evaluation"; Boolean)
        {
            Caption = 'Self Evaluation';
            Editable = false;
        }
        field(8; "Year Reporting Code"; Code[50])
        {
            Caption = 'Year Reporting Code';
            TableRelation = "Annual Reporting Codes".Code where("Current Year" = const(true));

            trigger OnValidate()
            begin
                CheckDuplicate();
            end;
        }
        field(9; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(10; Status; Enum "360 Status")
        {
            Caption = 'Status';
            Editable = false;
        }
        field(11; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
        }
        field(12; "Created By"; Code[50])
        {
            Caption = 'Created By';
            Editable = false;
        }
        field(13; "Created On"; Date)
        {
            Caption = 'Created On';
            Editable = false;
        }
        field(14; "Submitted On"; Date)
        {
            Caption = 'Submitted On';
            Editable = false;
        }
        field(15; "Average Score"; Decimal)
        {
            Caption = 'Average Score';
            Editable = false;
            DecimalPlaces = 0 : 2;
            FieldClass = FlowField;
            CalcFormula = average("360 Closed Line".Score where("Evaluation No." = field("No."), Score = filter(> 0)));
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(Evaluatee; "Evaluatee Employee No.", "Year Reporting Code")
        {
        }
    }

    trigger OnInsert()
    begin
        SPMSetup.Get();
        if "No." = '' then begin
            SPMSetup.TestField("360 Evaluation Nos.");
            "No. Series" := SPMSetup."360 Evaluation Nos.";
            "No." := NoSeriesMgt.GetNextNo("No. Series", WorkDate(), true);
        end;

        if "Year Reporting Code" = '' then
            "Year Reporting Code" := SPMSetup."Current Reporting Period";
        "Document Date" := Today;
        "Created By" := CopyStr(UserId, 1, MaxStrLen("Created By"));
        "Created On" := Today;
    end;

    trigger OnDelete()
    var
        ClosedLine: Record "360 Closed Line";
        OpenLine: Record "360 Open Line";
    begin
        TestField(Status, Status::Open);
        ClosedLine.SetRange("Evaluation No.", "No.");
        ClosedLine.DeleteAll();
        OpenLine.SetRange("Evaluation No.", "No.");
        OpenLine.DeleteAll();
    end;

    procedure TestStatusOpen()
    begin
        TestField(Status, Status::Open);
    end;

    /// Loads the active questions for the evaluatee category: closed ones into
    /// "360 Closed Line", open ones into "360 Open Line". Replaces existing lines.
    procedure SuggestQuestions()
    var
        Question: Record "360 Question";
        ClosedLine: Record "360 Closed Line";
        OpenLine: Record "360 Open Line";
        LineNo: Integer;
    begin
        TestStatusOpen();
        TestField("Evaluatee Employee No.");

        ClosedLine.SetRange("Evaluation No.", "No.");
        ClosedLine.DeleteAll();
        OpenLine.SetRange("Evaluation No.", "No.");
        OpenLine.DeleteAll();

        Question.SetCurrentKey("Evaluatee Category", "Question Type", "Sort Order");
        Question.SetRange(Active, true);
        Question.SetRange("Evaluatee Category", "Evaluatee Category");

        // Closed (Likert) questions
        Question.SetRange("Question Type", Question."Question Type"::Closed);
        if Question.FindSet() then begin
            LineNo := 0;
            repeat
                LineNo += 10000;
                ClosedLine.Init();
                ClosedLine."Evaluation No." := "No.";
                ClosedLine."Line No." := LineNo;
                ClosedLine."Question Code" := Question."Code";
                ClosedLine.Question := Question.Question;
                ClosedLine.Insert();
            until Question.Next() = 0;
        end;

        // Open-ended questions
        Question.SetRange("Question Type", Question."Question Type"::Open);
        if Question.FindSet() then begin
            LineNo := 0;
            repeat
                LineNo += 10000;
                OpenLine.Init();
                OpenLine."Evaluation No." := "No.";
                OpenLine."Line No." := LineNo;
                OpenLine."Question Code" := Question."Code";
                OpenLine.Question := Question.Question;
                OpenLine.Insert();
            until Question.Next() = 0;
        end;
    end;

    procedure Submit()
    var
        ClosedLine: Record "360 Closed Line";
    begin
        TestStatusOpen();
        TestField("Evaluator Employee No.");
        TestField("Evaluatee Employee No.");
        TestField("Year Reporting Code");
        CheckEvaluatorEligibility();
        CheckDuplicate();

        ClosedLine.SetRange("Evaluation No.", "No.");
        if ClosedLine.IsEmpty() then
            Error('There are no questions on this evaluation. Use Suggest Questions first.');
        ClosedLine.SetRange(Rating, ClosedLine.Rating::" ");
        if not ClosedLine.IsEmpty() then
            Error('Please rate all closed questions before submitting.');

        Status := Status::Submitted;
        "Submitted On" := Today;
        Modify();
    end;

    local procedure UpdateSelfFlag()
    begin
        "Self Evaluation" := ("Evaluatee Employee No." <> '') and ("Evaluator Employee No." = "Evaluatee Employee No.");
    end;

    // Feedback groups (guidelines):
    //  CEO        - feedback provided by all staff
    //  Manager    - feedback provided by all staff except the CEO
    //  Colleague  - feedback provided by all staff except the CEO and managers
    // Self evaluation is always allowed.
    local procedure CheckEvaluatorEligibility()
    var
        EvaluatorCategory: Enum "360 Category";
    begin
        if ("Evaluator Employee No." = '') or ("Evaluatee Employee No." = '') then
            exit;
        if "Self Evaluation" then
            exit;

        EvaluatorCategory := SetupMgt.GetCategory("Evaluator Employee No.");
        case "Evaluatee Category" of
            "Evaluatee Category"::Manager:
                if EvaluatorCategory = EvaluatorCategory::CEO then
                    Error('The CEO is not part of the feedback group for managers.');
            "Evaluatee Category"::Colleague:
                if EvaluatorCategory <> EvaluatorCategory::Colleague then
                    Error('Only colleagues and subordinates give feedback on colleagues. The CEO and managers are excluded.');
        end;
    end;

    local procedure CheckDuplicate()
    var
        Other: Record "360 Evaluation Header";
    begin
        if ("Evaluator Employee No." = '') or ("Evaluatee Employee No." = '') or ("Year Reporting Code" = '') then
            exit;
        Other.SetRange("Evaluator Employee No.", "Evaluator Employee No.");
        Other.SetRange("Evaluatee Employee No.", "Evaluatee Employee No.");
        Other.SetRange("Year Reporting Code", "Year Reporting Code");
        Other.SetFilter("No.", '<>%1', "No.");
        if not Other.IsEmpty() then
            Error('You have already created a 360 evaluation for this employee for %1.', "Year Reporting Code");
    end;

    var
        Employee: Record Employee;
        SPMSetup: Record "SPM General Setup";
        NoSeriesMgt: Codeunit "No. Series";
        SetupMgt: Codeunit "360 Setup Mgt.";
}
