namespace KICD.KICD;

using Microsoft.HumanResources.Employee;

codeunit 50037 "Update Employee Sort Keys"
{
    trigger OnRun()
    var
        Employee: Record Employee;
        AssignmentMatrix: Record "Assignment Matrix-X";
        EmployeeCount: Integer;
        AssignmentCount: Integer;
    begin
        EmployeeCount := 0;
        AssignmentCount := 0;
        
        if Employee.FindSet(true) then
            repeat
                Employee."Employee No Sort Key" := Employee.GenerateSortKey();
                Employee.Modify();
                EmployeeCount += 1;
            until Employee.Next() = 0;
        
        if AssignmentMatrix.FindSet(true) then
            repeat
                if Employee.Get(AssignmentMatrix."Employee No") then begin
                    AssignmentMatrix."Employee No Sort Key" := Employee."Employee No Sort Key";
                    AssignmentMatrix.Modify();
                    AssignmentCount += 1;
                end;
            until AssignmentMatrix.Next() = 0;
        
        Message('Updated %1 employee records and %2 assignment matrix records', EmployeeCount, AssignmentCount);
    end;
}