/// <summary>
/// Page EmpTrainingAttendedCard (ID 50027).
/// </summary>
page 50027 EmpTrainingAttendedCard
{
    Caption = 'EmpTrainingAttendedCard';
    PageType = ListPart;
    SourceTable = EmpTrainingAttended;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Course; Rec.Course)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course field.', Comment = '%';
                }
                field("Course Name"; Rec."Course Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course Name field.';
                }
                field("Duration Type"; Rec."Duration Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course Duration field.';
                }
                field("With Support"; Rec."With Support")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the With ADAK Support field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Institution field.', Comment = '%';
                }
            }
        }
    }
}
