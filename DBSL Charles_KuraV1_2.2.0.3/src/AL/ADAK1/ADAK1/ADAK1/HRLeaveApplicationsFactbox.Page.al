
Page 69209 "HR Leave Applications Factbox"
{
    PageType = CardPart;
    SourceTable = Employee;
    Editable = false;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            label(Control1102755011)
            {
                ApplicationArea = Basic;
                CaptionClass = Text1;
                Style = StrongAccent;
                StyleExpr = true;
            }
            field("No."; Rec."No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the No. field.';
            }
            field("First Name"; Rec."First Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the First Name field.';
            }
            field("Middle Name"; Rec."Middle Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Middle Name field.';
            }
            field("Last Name"; Rec."Last Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Last Name field.';
            }
            field("Job Title"; Rec."Job Title")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Job Title field.';
            }
            field(Status; Rec.Status)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Status field.';
            }
            field("E-Mail"; Rec."E-Mail")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Email field.';
            }
            label(Control1102755005)
            {
                ApplicationArea = Basic;
                Style = StrongAccent;
                StyleExpr = true;
            }
            label(Control1102755012)
            {
                ApplicationArea = Basic;
                CaptionClass = Text2;
                Style = StrongAccent;
                StyleExpr = true;
            }
            field("Total Leave Taken"; Rec."Total Leave Taken")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Total Leave Taken field.';
            }
            field("Total (Leave Days)"; Rec."Total (Leave Days)")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Total (Leave Days) field.';
            }
            field("Reimbursed Leave Days"; Rec."Reimbursed Leave Days")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Reimbursed Leave Days field.';
            }
            field("Allocated Leave Days"; Rec."Allocated Leave Days")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Allocated Leave Days field.';
            }
            field("Annual Leave Account"; Rec."Annual Leave Account")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Annual Leave Account field.';
            }
            field("Compassionate Leave Acc."; Rec."Compassionate Leave Acc.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Compassionate Leave Acc. field.';
            }
            field("Maternity Leave Acc."; Rec."Maternity Leave Acc.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Maternity Leave Acc. field.';
            }
            field("Paternity Leave Acc."; Rec."Paternity Leave Acc.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Paternity Leave Acc. field.';
            }
            field("Sick Leave Acc."; Rec."Sick Leave Acc.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Sick Leave Acc. field.';
            }
            field("Terminal Leave Acc.";Rec."Terminal Leave Acc.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Terminal Leave Acc. field.';
            }
            field("Study Leave Acc"; Rec."Study Leave Acc")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Study Leave Acc field.';
            }
            field("Leave Outstanding Bal"; Rec."Leave Outstanding Bal")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Leave Outstanding Bal field.';
            }
        }
    }

    actions
    {
    }

    var
        Text1: label 'Employee Details';
        Text2: label 'Employeee Leave Details';
    // Text3: ;
}



