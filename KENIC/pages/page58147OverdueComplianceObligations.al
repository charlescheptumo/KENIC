page 58147 "Overdue Obligations"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Compliance Obligation";
    Caption = 'Overdue Obligations';
    CardPageId = "Compliance Obligation Card";
    SourceTableView =
                        where(
                            Status = filter(Overdue),
                            Posted = filter(true)
                        );

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the obligation number.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the obligation title.';
                }
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the category code.';
                }
                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the recurring frequency.';
                    Visible = false;
                }
                field("Primary Employee No."; Rec."Primary Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the primary assigned employee number.';
                    Visible = false;
                }
                field("Primary Employee Name"; Rec."Primary Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the primary assigned employee.';
                    Visible = false;
                }
                field("Assigned Employees Count"; Rec."Assigned Employees Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of additional assigned employees. Click the number to view the assigned employees list.';

                    trigger OnDrillDown()
                    var
                        ObligationEmployee: Record "Compliance Obligation Employee";
                        ObligationEmployeesPage: Page "ComplianceObligationEmployees";
                    begin
                        ObligationEmployee.SetRange("Obligation No.", Rec."No.");
                        ObligationEmployeesPage.SetTableView(ObligationEmployee);
                        ObligationEmployeesPage.Run();
                    end;
                }
                field("Next Due Date"; Rec."Next Due Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the next due date.';
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the priority level.';
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the obligation is active.';
                }
            }
        }
    }
}