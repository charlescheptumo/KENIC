
Page 69230 "Leave Planner Lines"
{
    PageType = ListPart;
    SourceTable = "HR Leave Planner Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Leave Type field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Days Applied field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Return Date field.';
                }
                field("Applicant Comments"; Rec."Applicant Comments")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Applicant Comments field.';
                }
                field("Request Leave Allowance"; Rec."Request Leave Allowance")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Request Leave Allowance field.';
                }
                field(Reliever; Rec.Reliever)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Reliever field.';
                }
                field("Reliever Name"; Rec."Reliever Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Reliever Name field.';
                }
                field("Approved days"; Rec."Approved days")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Approved days field.';
                }
                field("Date of Exam"; Rec."Date of Exam")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Date of Exam field.';
                }
                field("Details of Examination"; Rec."Details of Examination")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Details of Examination field.';
                }
                field("Leave Period"; Rec."Leave Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Period field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("Planning Lines")
            {
                action("Leave Plan")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave &Planning Lines';
                    Image = Planning;
                    Scope = Repeater;
                    ToolTip = 'Executes the Leave &Planning Lines action.';
                    trigger OnAction()
                    var
                        LeavePlanningLine: Record "Leave Plan Detailed Lines";
                        LeavePlanningLines: Page "Leave Plan Detailed Lines";
                    begin
                        Rec.TestField("Employee No");
                        Rec.TestField("Application Code");
                        LeavePlanningLine.FilterGroup(2);
                        LeavePlanningLine.SetRange("Document No.", Rec."Application Code");
                        LeavePlanningLine.SetRange("Employee No.", Rec."Employee No");
                        LeavePlanningLine.FilterGroup(0);
                        LeavePlanningLines.SetTableView(LeavePlanningLine);
                        LeavePlanningLines.Editable := true;
                        LeavePlanningLines.Run();
                    end;
                }
            }
        }
    }
}



