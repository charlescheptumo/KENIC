/// <summary>
/// Page Exit Form Card (ID 50420).
/// Sections: staff details, Terminal Clearance Form, Terminated Employee/Intern/Casual Form,
/// Intern Assessment Form and Clearance Certificate.
/// </summary>
page 50420 "Exit Form Card"
{
    Caption = 'Exit Form';
    PageType = Card;
    SourceTable = "Exit Form Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("General")
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the form.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date of the form.';
                }
            }
            group("Staff Details")
            {
                Caption = 'Staff Details';

                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the staff number. Picking a staff member fills in the details below.';
                    ShowMandatory = true;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the first name.';
                }
                field("Surname"; Rec."Surname")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the surname.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ID number.';
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the category of staff, for example permanent, contract, intern or casual.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the department.';
                }
                field("Position"; Rec."Position")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the position.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the start date.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the end date.';
                }
            }
            group("Terminal Clearance Form")
            {
                Caption = 'Terminal Clearance Form';

                field("CEO Name"; Rec."CEO Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the Chief Executive Officer who signs the form.';
                }
                part("Clearance Sign-off"; "Exit Form Lines Subform")
                {
                    ApplicationArea = All;
                    Caption = 'Departmental Clearance (Name, Signature, Date, Remarks)';
                    SubPageLink = "Document No." = field("No."), Section = const('Clearance');
                }
            }
            group("Terminated Form")
            {
                Caption = 'Terminated Employee/Intern/Casual Form';

                field("Termination Reason"; Rec."Termination Reason")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the reason for termination.';
                }
                field("Date Of Termination"; Rec."Date Of Termination")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the last working day.';
                }
                field("Work Days Paid"; Rec."Work Days Paid")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of work days paid.';
                }
                field("Leave Balance"; Rec."Leave Balance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the leave balance.';
                }
                field("Payment In Lieu Of Leave"; Rec."Payment In Lieu Of Leave")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the payment in lieu of leave days.';
                }
                field("Notice Period"; Rec."Notice Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the notice period.';
                }
                field("Payment In Lieu Of Notice"; Rec."Payment In Lieu Of Notice")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the payment in lieu of notice.';
                }
                field("Other Allowances"; Rec."Other Allowances")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies other allowances.';
                }
                field("Gross Pay"; Rec."Gross Pay")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the gross pay.';
                }
                field("Benefits"; Rec."Benefits")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the benefits.';
                }
                group("Deductions")
                {
                    Caption = 'Deductions Made (KSH)';

                    field("NSSF"; Rec."NSSF")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the NSSF deduction.';
                    }
                    field("NHIF"; Rec."NHIF")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the NHIF deduction.';
                    }
                    field("HELB"; Rec."HELB")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the HELB deduction.';
                    }
                    field("Pension"; Rec."Pension")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the pension deduction.';
                    }
                    field("PAYE"; Rec."PAYE")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the PAYE deduction.';
                    }
                    field("SACCO"; Rec."SACCO")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the SACCO deduction.';
                    }
                    field("Housing Levy"; Rec."Housing Levy")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the housing levy deduction.';
                    }
                    field("Other Deduction Description"; Rec."Other Deduction Description")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies what the other deduction is for.';
                    }
                    field("Other Deduction Amount"; Rec."Other Deduction Amount")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the amount of the other deduction.';
                    }
                }
field("Net Pay"; Rec."Net Pay")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the net pay.';
                }
                field("Authorised By"; Rec."Authorised By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies who authorised the payment.';
                }
                field("Comment"; Rec."Comment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a comment.';
                }
            }
            group("Intern Assessment Form")
            {
                Caption = 'Intern Assessment Form (Employer Assessment)';

                field("Supervisor"; Rec."Supervisor")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the intern''s supervisor.';
                }
                part("General Workplace"; "Exit Form Lines Subform")
                {
                    ApplicationArea = All;
                    Caption = '1. General Workplace Performance (scale 1 to 6)';
                    SubPageLink = "Document No." = field("No."), Section = const('General Workplace Performance');
                }
                part("Specific Job"; "Exit Form Lines Subform")
                {
                    ApplicationArea = All;
                    Caption = '2. Specific Job Assignment Performance (scale 1 to 6)';
                    SubPageLink = "Document No." = field("No."), Section = const('Specific Job Assignment Performance');
                }
                field("Overall Performance"; Rec."Overall Performance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the overall performance, for example outstanding, above average, satisfactory, below average or unsatisfactory.';
                }
                part("Weekly Log"; "Exit Form Lines Subform")
                {
                    ApplicationArea = All;
                    Caption = 'Part 2: Weekly Log (Month and Year, Week, Activities Done, Remark)';
                    SubPageLink = "Document No." = field("No."), Section = const('Weekly Log');
                }
            }
            group("Clearance Certificate")
            {
                Caption = 'Clearance Certificate';

                field("Amount Received"; Rec."Amount Received")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the sum received in full and final settlement.';
                }
                field("Certificate Date"; Rec."Certificate Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date the certificate was signed.';
                }
                field("Witness Name"; Rec."Witness Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the witness.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }
}
