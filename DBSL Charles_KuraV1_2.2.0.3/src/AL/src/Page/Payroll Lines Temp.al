
page 69148 "Payroll Lines Temp"
{
    PageType = ListPart;
    SourceTable = "Payroll LinesT";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No"; Rec."Line No")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Personal No."; Rec."Personal No.")
                {
                    ToolTip = 'Specifies the value of the Personal No. field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field("Basic Salary"; Rec."Basic Salary")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Basic Salary field.';
                }
                field("Basic Arrears"; Rec."Basic Arrears")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Basic Arrears field.';
                }
                field("Gross Pay"; Rec."Gross Pay")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Gross Pay field.';
                }
                field("Total Deduction"; Rec."Total Deduction")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Deduction field.';
                }
                field(Netpay; Rec.Netpay)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Netpay field.';
                }
                field("Payroll Header"; Rec."Payroll Header")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Payroll Header field.';
                }
                field("Payroll Group"; Rec."Payroll Group")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the Payroll Group field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
            }
        }
    }

    actions
    {
    }
}



