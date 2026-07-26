page 58143 "ComplianceObligationEmployees"
{
    PageType = ListPart;
    SourceTable = "Compliance Obligation Employee";
    Caption = 'Responsible Officer(s)';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee number.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the full name of the employee.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the current progress status for this employee.';
                    Editable = false;
                }
                field(Completed; Rec.Completed)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies whether this employee has completed their obligation task.';
                }
                field("Completed DateTime"; Rec."Completed DateTime")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the timestamp when the obligation was marked as completed.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies any remarks or notes recorded for this employee.';
                    Editable = false;
                }
            }
        }
    }
}