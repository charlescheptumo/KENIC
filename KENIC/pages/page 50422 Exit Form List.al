/// <summary>
/// Page Exit Form List (ID 50422).
/// </summary>
page 50422 "Exit Form List"
{
    Caption = 'Exit Forms';
    PageType = List;
    SourceTable = "Exit Form Header";
    CardPageId = "Exit Form Card";
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the form.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the staff number.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the first name.';
                }
                field(Surname; Rec.Surname)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the surname.';
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the category of staff.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the department.';
                }
                field("Date Of Termination"; Rec."Date Of Termination")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the last working day.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date of the form.';
                }
            }
        }
    }
}
