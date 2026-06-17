codeunit 50023 Budget
{
    procedure CreateProjectFromBudget(BudgetName: Code[30])
    var
        Job: Record Job;
        JobPlanningLine: Record "Job Planning Line";
        JobTask: Record "Job Task";
        GLAccount: Record "G/L Account";
        EntryNo: Integer;
        TXT001: label 'Project created succesfully';
        TXT002: label 'Project updated succefully';
        GLBudgetEntry: Record "G/L Budget Entry";
        TotalAmount: Decimal;
        JobPlanningLine1: Record "Job Planning Line";
        GLBudgetName: Record "G/L Budget Name";
        JobTask1: Record "Job Task";
    begin
        GLBudgetName.Reset;
        GLBudgetName.SetRange(Name, BudgetName);
        if GLBudgetName.FindFirst then begin
            GLAccount.Reset;
            GLAccount.SetRange("Account Type", GLAccount."account type"::Posting);
            if GLAccount.FindSet then begin
                repeat
                    TotalAmount := 0.0;
                    GLBudgetEntry.Reset;
                    GLBudgetEntry.SetRange("Budget Name", GLBudgetName.Name);
                    GLBudgetEntry.SetRange("G/L Account No.", GLAccount."No.");
                    if GLBudgetEntry.FindSet then begin
                        repeat
                            TotalAmount := TotalAmount + GLBudgetEntry.Amount;
                        until GLBudgetEntry.Next = 0;
                    end;
                    //insert task lines
                    JobTask1.Reset;
                    JobTask1.SetRange("Job No.", GLBudgetName.Name);
                    JobTask1.SetRange("Job Task No.", GLAccount."No.");
                    if not JobTask1.FindFirst then begin
                        JobTask.Init;
                        JobTask."Job No." := GLBudgetName.Name;
                        JobTask."Job Task No." := GLAccount."No.";
                        JobTask.Description := GLAccount.Name;
                        JobTask."Job Task Type" := JobTask."job task type"::Posting;
                        JobTask.Insert(true);
                    end;
                    //insert planning lines
                    JobPlanningLine1.Reset;
                    if JobPlanningLine1.FindLast then begin
                        EntryNo := JobPlanningLine1."Line No.";
                    end;
                    JobPlanningLine.Init;
                    JobPlanningLine."Line No." := EntryNo + 1;
                    JobPlanningLine."Job No." := GLBudgetName.Name;
                    JobPlanningLine."Job Task No." := GLAccount."No.";
                    JobPlanningLine."Planning Date" := GLBudgetName."Start Date";
                    JobPlanningLine."Line Type" := JobPlanningLine."line type"::Budget;
                    JobPlanningLine.Type := JobPlanningLine.Type::"G/L Account";
                    JobPlanningLine."No." := GLAccount."No.";
                    JobPlanningLine.Description := Format('BUDGET FY' + GLBudgetName.Name, 50);
                    JobPlanningLine.Quantity := 1;
                    JobPlanningLine."Unit Cost" := TotalAmount;
                    JobPlanningLine.Insert(true);
                until GLAccount.Next = 0;
            end;
        end
    end;

}
