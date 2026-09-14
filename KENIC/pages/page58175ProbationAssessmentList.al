#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
#pragma implicitwith disable

page 58175 "Probation Assessment List"
{
    PageType = List;
    SourceTable = "Probationary Assessment Header";
    CardPageId = "Probation Assessment Card";
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Assessment No."; Rec."Assessment No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the unique document number for the probationary assessment.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the probationary assessment document was created.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee number being assessed.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the full name of the employee.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the department code of the employee.';
                }
                field("Job Title/Position"; Rec."Job Title/Position")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the job title or position of the employee.';
                }
                field("Probation Start Date"; Rec."Probation Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the start date of the probation period.';
                }
                field("Probation End Date"; Rec."Probation End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the end date of the probation period.';
                }
                field("Supervisor No."; Rec."Supervisor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the supervisor assigned to conduct the assessment.';
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the assigned supervisor.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the current processing status of the probationary assessment.';
                }
                field("Employee Signed"; Rec."Employee Signed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the employee has signed off on the assessment.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the user who generated this record.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date and time the record was created.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control66; Outlook)
            {
            }
            systempart(Control67; Notes)
            {
            }
            systempart(Control68; MyNotes)
            {
            }
            systempart(Control69; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Card")
            {
                ApplicationArea = Basic;
                Caption = 'Card';
                Image = EditLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = page "Probation Assessment Card";
                RunPageLink = "Assessment No." = field("Assessment No.");
                ShortCutKey = 'Shift+F7';
                ToolTip = 'Opens the card page for the selected probationary assessment.';
            }
        }
    }
}

#pragma implicitwith restore