#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69043 "Payroll Admin Role Center"
{
    Caption = 'Role Center';
    PageType = RoleCenter;
    ApplicationArea = All;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part(Control1000000004; "Payroll Activities")
                {
                }
                systempart(Control1901420308; Outlook)
                {
                }
            }
            group(Control1900724708)
            {
                part(Control21; "My Job Queue")
                {
                    Visible = false;
                }
                systempart(Control1901377608; MyNotes)
                {
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            separator(Action1000000008)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            group(Payslip)
            {
                Caption = 'Payslip';
                action("1 Page Payslip")
                {
                    ApplicationArea = Basic;
                    Caption = '1 Page Payslip';
                    Image = "Report";

                    // The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    // PromotedIsBig = false;
                    RunObject = Report "1 Page Payslip";
                    ToolTip = 'Executes the 1 Page Payslip action.';
                }
              
                action("2 Page Payslip")
                {
                    ApplicationArea = Basic;
                    Caption = '2 Page Payslip';
                    Image = "Report";
                    ToolTip = 'Executes the 2 Page Payslip action.';
                    // RunObject = Report "New Payslip";
                }
                action("Email PDF Payslips")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send PDF Payslips';
                    Image = Email;
                    ToolTip = 'Executes the Send PDF Payslips action.';
                    RunObject = Report "Email All Payslips";
                }
            }
            separator(Action1000000041)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            group("Management Reports")
            {
                Caption = 'Management Reports';
                action("Master Roll Excel Export")
                {
                    ApplicationArea = Basic;
                    Caption = 'Master Roll Excel Export';
                    Image = "Report";
                    RunObject = Report "Master Roll Excel Export";
                    ToolTip = 'Executes the Master Roll Excel Export action.';
                }
                action("Detailed E/D Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Detailed E/D Report';
                    Image = "Report";
                    RunObject = Report "Master reporterx";
                    ToolTip = 'Executes the Detailed E/D Report action.';
                }
                action("Loans Detailed Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Loans Detailed Report';
                    Image = "Report";

                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    // RunObject = Report "Loans Detailed Report1";
                    Visible = false;
                    ToolTip = 'Executes the Loans Detailed Report action.';
                }
                action("Loan Balances")
                {
                    ApplicationArea = Basic;
                    Caption = 'Loan Balances';
                    Image = "Report";

                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    //   RunObject = Report "Loan Balances";
                    Visible = false;
                    ToolTip = 'Executes the Loan Balances action.';
                }
                action("Employee Payroll Analysis")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Payroll Analysis';
                    Image = "Report";
                    ToolTip = 'Executes the Employee Payroll Analysis action.';
                    // RunObject = Report "Payroll Cost Analysis";
                }
                action("Employee/Employer Deductions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee/Employer Deductions';
                    Image = "Report";

                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Employee/Employer Deductions";
                    ToolTip = 'Executes the Employee/Employer Deductions action.';
                    //  Visible = false;
                }
                action("Employee Pay Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Pay Details';
                    Image = "Report";
                    RunObject = Report "Employee Pay Details";
                    ToolTip = 'Executes the Employee Pay Details action.';
                }
                action("Employee Payroll Pay File")
                {
                    ApplicationArea = Basic;
                    // Caption = 'ITax Generator';
                    Image = "Report";
                    RunObject = xmlport "Employee Payroll Pay File";
                    ToolTip = 'Executes the Employee Payroll Pay File action.';
                }
                action("ITax Generator")
                {
                    ApplicationArea = Basic;
                    Caption = 'ITax Generator';
                    Image = "Report";
                    RunObject = Report "ITax Generator";
                    ToolTip = 'Executes the ITax Generator action.';
                }
                action("Detailed Institutional ROUSA Report")
                {
                    ApplicationArea = Basic;
                    //Caption = 'ITax Generator';
                    Image = "Report";
                    RunObject = Report "Institutional Report_email";
                    ToolTip = 'Executes the Detailed Institutional ROUSA Report action.';
                }
                action("Detailed Institutional ICEA Report")
                {
                    ApplicationArea = Basic;
                    //Caption = 'ITax Generator';
                    Image = "Report";
                    RunObject = Report "Institutional iCEA";
                    ToolTip = 'Executes the Detailed Institutional ICEA Report action.';
                }
                action("Net Pay Less Than 1/3")
                {
                    ApplicationArea = Basic;
                    //Caption = 'ITax Generator';
                    Image = "Report";
                    RunObject = Report "Net Pay Less Than 1/3";
                    ToolTip = 'Executes the Net Pay Less Than 1/3 action.';
                }
            }
            group(Statutory)
            {
                Caption = 'Statutory';
                action(NHIF)
                {
                    ApplicationArea = Basic;
                    Caption = 'SHIF';
                    Image = "Report";
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report NHIF;
                    ToolTip = 'Executes the SHIF action.';
                }
                action(NSSF)
                {
                    ApplicationArea = Basic;
                    Caption = 'NSSF';
                    Image = "Report";
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "NSSF Reporting";
                    ToolTip = 'Executes the NSSF action.';
                }
                action("Housing Levy")
                {
                    ApplicationArea = Basic;
                    Caption = 'Housing Levy';
                    Image = "Report";
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Housing Levy";
                    ToolTip = 'Executes the Housing Levy action.';
                }
                action("Monthly PAYE Export")
                {
                    ApplicationArea = Basic;
                    Caption = 'Monthly PAYE Export';
                    Image = "Report";

                    RunObject = Report "Monthly PAYE Export";
                    ToolTip = 'Executes the Monthly PAYE Export action.';
                }
                action(P9A)
                {
                    ApplicationArea = Basic;
                    Caption = 'P9A';
                    Image = "Report";

                    RunObject = Report "P9A Report";
                    ToolTip = 'Executes the P9A action.';
                }
            }
            group("Payroll Reconcilliation")
            {
                Caption = 'Payroll Reconcilliation';
                action("Zero Earnings Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Zero Earnings Report';
                    Image = "Report";
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Zero Earnings Report";
                    ToolTip = 'Executes the Zero Earnings Report action.';
                }
                action("Zero Deductions Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Zero Deductions Report';
                    Image = "Report";
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Zero Deductions Report";
                    ToolTip = 'Executes the Zero Deductions Report action.';
                }
                action("New Employees")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Employees';
                    Image = "Report";
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "New Employees";
                    ToolTip = 'Executes the New Employees action.';
                }
                action("Employees Removed")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employees Removed';
                    Image = "Report";

                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Employees Removed";
                    ToolTip = 'Executes the Employees Removed action.';
                }
                action("Payroll Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Summary';
                    Image = "Report";

                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Payroll Summary";
                    ToolTip = 'Executes the Payroll Summary action.';
                }
                action("Master Roll(Department)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Master Roll(Department)';
                    Image = "Report";

                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Master Roll(Departments)";
                    ToolTip = 'Executes the Master Roll(Department) action.';
                }
                action("Master Roll(Salary Scale)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Master Roll(Salary Scale)';
                    Image = "Report";
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Employee Grouped Scales";
                    ToolTip = 'Executes the Master Roll(Salary Scale) action.';
                }
                action("Master Roll")
                {
                    ApplicationArea = Basic;
                    Caption = 'Master Roll';
                    Image = "Report";
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Employee Master Roll";
                    ToolTip = 'Executes the Master Roll action.';
                }
                action("Payroll Reconciliation Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Reconciliation Summary';
                    Image = "Report";

                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Payroll Reconciliation Summary";
                    ToolTip = 'Executes the Payroll Reconciliation Summary action.';
                }
                action("Payroll Reconciliation (Gross)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Reconciliation(Gross)';
                    Image = "Report";

                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Payroll Reconciliation(Gross)";
                    ToolTip = 'Executes the Payroll Reconciliation(Gross) action.';
                }
                action("Payroll Reconciliation Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Reconciliation Details';
                    Image = "Report";

                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Report "Payroll Reconciliation Earnin";
                    ToolTip = 'Executes the Payroll Reconciliation Details action.';
                }
            }
        }
        area(embedding)
        {

            action("Employee List")
            {
                ApplicationArea = Basic;
                Caption = 'Employee List';
                Image = Employee;
                RunObject = Page "Employee List-P";
                ToolTip = 'Executes the Employee List action.';
            }
            action("Pay Periods")
            {
                ApplicationArea = Basic;
                Caption = 'Pay Periods';
                Image = Employee;
                RunObject = Page "Pay Periods";
                ToolTip = 'Executes the Pay Periods action.';
            }
            action(Earnings)
            {
                ApplicationArea = Basic;
                Caption = 'Earnings';
                Image = Employee;
                RunObject = Page Earnings;
                ToolTip = 'Executes the Earnings action.';
            }
            action(Deductions)
            {
                ApplicationArea = Basic;
                Caption = 'Deductions';
                Image = Employee;
                RunObject = Page Deductions;
                ToolTip = 'Executes the Deductions action.';
            }
            action("Salary Processing")
            {
                ApplicationArea = Basic;
                Caption = 'Salary Vouchers';
                Image = Loaners;
                RunObject = Page "Payroll Processing List";
                ToolTip = 'Executes the Salary Vouchers action.';
            }
            action("Payment Vouchers")
            {
                ApplicationArea = Basic;
                Caption = 'Payment Vouchers';
                Image = PaymentHistory;
                RunObject = page "Payments Vouchers HR";
                ToolTip = 'executes the payment Vouchers Action';
            }
            action("Brackets Table")
            {
                ApplicationArea = Basic;
                Caption = 'Brackets Table';
                Image = Employee;
                RunObject = Page "Brackets Table";
                ToolTip = 'Executes the Brackets Table action.';
            }
            action(Loans)
            {
                ApplicationArea = Basic;
                Caption = 'Loans';
                Image = Loaners;
                RunObject = Page Loans;
                ToolTip = 'Executes the Loans action.';
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Employee;
                RunObject = Page Dimensions;
                ToolTip = 'Executes the Dimensions action.';
            }
            action("Employee Posting Group")
            {
                ApplicationArea = Basic;
                Caption = 'Employee Posting Group';
                Image = Employee;
                RunObject = Page "Employee Posting Group";
                ToolTip = 'Executes the Employee Posting Group action.';
            }
            action("Employee PGroups")
            {
                ApplicationArea = Basic;
                Caption = 'Employee PGroups';
                RunObject = Page "Employee PGroups";
                ToolTip = 'Executes the Employee PGroups action.';
            }
            action("Employee Bank List")
            {
                ApplicationArea = Basic;
                Caption = 'Employee Bank List';
                Image = Employee;
                RunObject = Page "Employee Bank List";
                ToolTip = 'Executes the Employee Bank List action.';
            }
            action("Loans Products")
            {
                ApplicationArea = Basic;
                Caption = 'Loans Products';
                Image = Loaners;
                RunObject = Page "Loan Products";
                ToolTip = 'Executes the Loans Products action.';
            }
        }
        area(sections)
        {
            group("Salary Advance")
            {
                action("Salary Advance List Memos")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Salary Advance Memos";
                    ToolTip = 'Executes the Salary Advance List Memos action.';
                }
                action("Approved Salary Advance List Memos")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Salary Advance Memos";
                    ToolTip = 'Executes the Approved Salary Advance List Memos action.';
                }
                action("Posted  Salary Advance List Memos")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Posted Salary Advance Memos";
                    ToolTip = 'Executes the Posted  Salary Advance List Memos action.';
                }
                action("Salary Advance List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Salary Advance List";
                    ToolTip = 'Executes the Salary Advance List action.';
                }
                action("Approved Salary Advance List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Approved Salary Advance List";
                    ToolTip = 'Executes the Approved Salary Advance List action.';
                }
                action("Posted  Salary Advance List")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Posted  Salary Advance List";
                    ToolTip = 'Executes the Posted  Salary Advance List action.';
                }
            }
            group("Management Approvals")
            {
                Caption = 'Management Approvals';
                Image = Confirm;
                action("Approval Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Entries';
                    Image = ServiceAgreement;
                    RunObject = Page "Approval Entries";
                    ToolTip = 'Executes the Approval Entries action.';
                }
            }
        }
        area(processing)
        {
            group("Data Import")
            {
                Caption = 'Data Import';
                Image = Calculator;
                action("Earnings Import")
                {
                    ApplicationArea = Basic;
                    Caption = 'Earnings Import';
                    Image = Import;
                    RunObject = XMLport "Earnings Import";
                    ToolTip = 'Executes the Earnings Import action.';
                }
                action("Deductions Import")
                {
                    ApplicationArea = Basic;
                    Caption = 'Deductions Import';
                    Image = Import;
                    RunObject = XMLport "Deductions Import";
                    ToolTip = 'Executes the Deductions Import action.';
                }
            }
            group("Payroll Processing")
            {
                Caption = 'Payroll Processing';
                Image = Calculator;
                action("Current Earnings/Deductions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Earnings/Deductions';
                    Image = CashReceiptJournal;

                    RunObject = Page "Current Earnings/Deductions";
                    ToolTip = 'Executes the Current Earnings/Deductions action.';
                }
                action("Run Payroll Run")
                {
                    ApplicationArea = Basic;
                    Caption = 'Run Payroll Run';
                    Image = Calculate;
                    RunObject = Report "Payroll Run";
                    ToolTip = 'Executes the Run Payroll Run action.';
                }
                action("Process Loan Interest")
                {
                    ApplicationArea = Basic;
                    Caption = 'Process Loan Interest';
                    Image = Suggest;
                    ToolTip = 'Executes the Process Loan Interest action.';
                    //  RunObject = Report "Process Loan Interest";
                }
                action("Assign Default Earnings/Ded")
                {
                    ApplicationArea = Basic;
                    Image = Allocate;
                    ToolTip = 'Executes the Assign Default Earnings/Ded action.';
                    // RunObject = Report "Assign Default Earning/Deducti";
                }
                action("Closed Earnings/Deductions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Closed Earnings/Deductions';
                    Image = CashReceiptJournal;
                    RunObject = Page "Closed Earnings/Deductions";
                    ToolTip = 'Executes the Closed Earnings/Deductions action.';
                }
            }
            group("Data Export")
            {
                Caption = 'Data Export';
                Image = Calculator;
                action(EFT)
                {
                    ApplicationArea = Basic;
                    Caption = 'EFT';
                    Image = Export;
                    ToolTip = 'Executes the EFT action.';
                    //  RunObject = Report "EFT/SFI-Admin";
                }
                action("Send PDF Payslips")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send PDF Payslips';
                    Image = Export;
                    ToolTip = 'Executes the Send PDF Payslips action.';
                    //   RunObject = Report "Send PDF Payslips";
                }
            }
        }
    }
}
profile HRAdministratorRoleCenter
{
    ProfileDescription = 'HR Administrator Role Center';
    RoleCenter = "Payroll Admin Role Center";
    Caption = 'HR Administrator Role Center';
}
