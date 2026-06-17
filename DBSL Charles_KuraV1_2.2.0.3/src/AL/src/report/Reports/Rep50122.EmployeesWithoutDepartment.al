namespace KICD.KICD;

using Microsoft.HumanResources.Employee;

report 50122 "Employees Without Department"
{
    ApplicationArea = All;
    Caption = 'Employees Without Department';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/Employee Report.rdlc';

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = where("Department Code" = const(''));

            column("No"; RowNo) { }
            column("FirstName"; "First Name") { }
            column("LastName"; "Last Name") { }
            column("JobTitle"; "Job Title") { }
            column("DepartmentCode"; "Department Code") { }
            column("DepartmentName"; "Department Name") { }

            trigger OnAfterGetRecord()
            begin
                RowNo += 1; // Increment counter for each employee
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Group)
                {
                    field("Show Department Name"; ShowDepartmentName)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
                action(Preview)
                {
                    ApplicationArea = All;
                    Caption = 'Preview Report';
                    Image = View;
                    trigger OnAction()
                    begin
                        PreviewResult := CurrReport.Preview();
                    end;
                }
            }
        }
    }

    var
        ShowDepartmentName: Boolean;
        PreviewResult: Boolean;
        RowNo: Integer;
}
