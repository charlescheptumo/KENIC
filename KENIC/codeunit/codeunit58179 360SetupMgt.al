codeunit 58179 "360 Setup Mgt."
{
   
    procedure LoadDefaultQuestions()
    begin
        // ---------- CEO (feedback by all staff) ----------
        AddQuestion('CEO-C01', Enum::"360 Category"::CEO, Enum::"360 Question Type"::Closed, 10, 'The CEO keeps employees informed about important company updates and changes.');
        AddQuestion('CEO-C02', Enum::"360 Category"::CEO, Enum::"360 Question Type"::Closed, 20, 'The CEO encourages open and transparent communication within the organization.');
        AddQuestion('CEO-C03', Enum::"360 Category"::CEO, Enum::"360 Question Type"::Closed, 30, 'The CEO makes informed and effective decisions.');
        AddQuestion('CEO-C04', Enum::"360 Category"::CEO, Enum::"360 Question Type"::Closed, 40, 'The CEO fosters a culture of innovation and creativity.');
        AddQuestion('CEO-C05', Enum::"360 Category"::CEO, Enum::"360 Question Type"::Closed, 50, 'The CEO promotes a positive work environment and culture.');
        AddQuestion('CEO-O01', Enum::"360 Category"::CEO, Enum::"360 Question Type"::Open, 10, 'Can you provide an example of how the CEO''s communication has positively impacted the organization?');
        AddQuestion('CEO-O02', Enum::"360 Category"::CEO, Enum::"360 Question Type"::Open, 20, 'Describe a time when the CEO''s leadership made a significant difference to a project or the company as a whole.');

        // ---------- Managers / Senior leadership (feedback by all staff except CEO) ----------
        AddQuestion('MGR-C01', Enum::"360 Category"::Manager, Enum::"360 Question Type"::Closed, 10, 'The employee communicates effectively with the team and other departments.');
        AddQuestion('MGR-C02', Enum::"360 Category"::Manager, Enum::"360 Question Type"::Closed, 20, 'The employee demonstrates strong leadership and initiative.');
        AddQuestion('MGR-C03', Enum::"360 Category"::Manager, Enum::"360 Question Type"::Closed, 30, 'The employee effectively solves problems and makes informed decisions.');
        AddQuestion('MGR-C04', Enum::"360 Category"::Manager, Enum::"360 Question Type"::Closed, 40, 'The employee is reliable in meeting deadlines and fulfilling responsibilities.');
        AddQuestion('MGR-C05', Enum::"360 Category"::Manager, Enum::"360 Question Type"::Closed, 50, 'The employee contributes significantly to team goals and organizational success.');
        AddQuestion('MGR-O01', Enum::"360 Category"::Manager, Enum::"360 Question Type"::Open, 10, 'Can you share an instance where the employee effectively solved a problem or made a significant decision? What was the outcome?');
        AddQuestion('MGR-O02', Enum::"360 Category"::Manager, Enum::"360 Question Type"::Open, 20, 'How does the employee ensure they meet deadlines and fulfill responsibilities? Can you provide an example?');

        // ---------- Colleagues / Subordinates (feedback by all staff except CEO and managers) ----------
        AddQuestion('COL-C01', Enum::"360 Category"::Colleague, Enum::"360 Question Type"::Closed, 10, 'The employee collaborates well with team members.');
        AddQuestion('COL-C02', Enum::"360 Category"::Colleague, Enum::"360 Question Type"::Closed, 20, 'The employee assists in problem-solving and supports the team.');
        AddQuestion('COL-C03', Enum::"360 Category"::Colleague, Enum::"360 Question Type"::Closed, 30, 'The employee demonstrates strong job knowledge and expertise.');
        AddQuestion('COL-C04', Enum::"360 Category"::Colleague, Enum::"360 Question Type"::Closed, 40, 'The employee handles feedback and constructive criticism effectively.');
        AddQuestion('COL-C05', Enum::"360 Category"::Colleague, Enum::"360 Question Type"::Closed, 50, 'The employee is supportive in helping you achieve your goals.');
        AddQuestion('COL-C06', Enum::"360 Category"::Colleague, Enum::"360 Question Type"::Closed, 60, 'The employee demonstrates strong leadership skills.');
        AddQuestion('COL-O01', Enum::"360 Category"::Colleague, Enum::"360 Question Type"::Open, 10, 'Can you describe a time when the employee collaborated well with team members on a project or task?');
        AddQuestion('COL-O02', Enum::"360 Category"::Colleague, Enum::"360 Question Type"::Open, 20, 'How has the employee assisted in problem-solving and supported the team? Can you provide a specific example?');
    end;

   
    procedure GetCategory(EmployeeNo: Code[50]): Enum "360 Category"
    var
        SPMSetup: Record "SPM General Setup";
    begin
        if EmployeeNo = '' then
            exit(Enum::"360 Category"::Colleague);
        SPMSetup.Get();
        if MatchesJobTitle(EmployeeNo, SPMSetup."360 CEO Job Title Filter") then
            exit(Enum::"360 Category"::CEO);
        if MatchesJobTitle(EmployeeNo, SPMSetup."360 Mgr Job Title Filter") then
            exit(Enum::"360 Category"::Manager);
        exit(Enum::"360 Category"::Colleague);
    end;

    procedure FindCEO(): Code[20]
    var
        SPMSetup: Record "SPM General Setup";
        Employee: Record Employee;
    begin
        SPMSetup.Get();
        SPMSetup.TestField("360 CEO Job Title Filter");
        Employee.SetRange(Status, Employee.Status::Active);
        Employee.SetFilter("Job Title", SPMSetup."360 CEO Job Title Filter");
        if not Employee.FindFirst() then
            Error('No active employee has a job title matching %1. Check the 360 CEO Job Title Filter in SPM General Setup.', SPMSetup."360 CEO Job Title Filter");
        exit(Employee."No.");
    end;

    local procedure MatchesJobTitle(EmployeeNo: Code[50]; TitleFilter: Text): Boolean
    var
        Employee: Record Employee;
    begin
        if TitleFilter = '' then
            exit(false);
        Employee.SetRange("No.", EmployeeNo);
        Employee.SetFilter("Job Title", TitleFilter);
        exit(not Employee.IsEmpty());
    end;

    local procedure AddQuestion(QuestionCode: Code[20]; Category: Enum "360 Category"; QuestionType: Enum "360 Question Type"; SortOrder: Integer; QuestionText: Text[500])
    var
        Question: Record "360 Question";
    begin
        if Question.Get(QuestionCode) then
            exit;
        Question.Init();
        Question."Code" := QuestionCode;
        Question."Evaluatee Category" := Category;
        Question."Question Type" := QuestionType;
        Question."Sort Order" := SortOrder;
        Question.Question := QuestionText;
        Question.Active := true;
        Question.Insert(true);
    end;
}
