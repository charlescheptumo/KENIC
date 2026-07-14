#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69687 "Job Grades"
{
    ApplicationArea = Basic;
    CardPageID = "Salary Scales";
    Editable = false;
    PageType = List;
    SourceTable = "Salary Scales";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Scale; Rec.Scale)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Grade ID';
                    ToolTip = 'Specifies the value of the Scale field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Overall Appointment Authority"; Rec."Overall Appointment Authority")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the overall appointment authority.';
                }
                field("Default Seniority Level"; Rec."Default Seniority Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the default seniority level.';
                }
                field("No. of Valid Positions"; Rec."No. of Valid Positions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of valid positions. Click to view the positions list.';

                    trigger OnDrillDown()
                    var
                        CompanyPositions: Record "Company Positions";
                        CompanyPositionsList: Page "Positions"; 
                    begin
                        CompanyPositions.Reset();
                        CompanyPositions.SetRange("Job Grade ID", Rec.Scale);
                        if CompanyPositions.FindSet() then begin
                            CompanyPositionsList.SetTableView(CompanyPositions);
                            CompanyPositionsList.Run();
                        end;
                    end;
                }
                field("No. of Active Employees"; Rec."No. of Active Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of active employees. Click to view the employee list.';

                    trigger OnDrillDown()
                    var
                        Employee: Record Employee;
                        EmployeeList: Page "Employee List"; 
                    begin
                        Employee.Reset();
                        Employee.SetRange("Salary Scale", Rec.Scale);
                        Employee.SetRange(Status, Employee.Status::Active);
                        if Employee.FindSet() then begin
                            EmployeeList.SetTableView(Employee);
                            EmployeeList.Run();
                        end;
                    end;
                }
            
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the effective date.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies if the scale is blocked.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000010; Outlook)
            {
            }
            systempart(Control1000000011; Notes)
            {
            }
            systempart(Control1000000012; MyNotes)
            {
            }
            systempart(Control1000000013; Links)
            {
            }
        }
    }

    actions
    {
    }
}