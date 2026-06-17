namespace KICD.KICD;

using Microsoft.HumanResources.Employee;

page 50338 "Test Leave Email Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;
    Caption = 'Test Leave Email Notifications';

    layout
    {
        area(Content)
        {
            group(TestParameters)
            {
                Caption = 'Test Parameters';

                field(LeaveApplicationCode; LeaveApplicationCode)
                {
                    ApplicationArea = All;
                    Caption = 'Leave Application Code';
                    ToolTip = 'Enter the leave application code to test';
                }

                field(EmployeeNo; EmployeeNo)
                {
                    ApplicationArea = All;
                    Caption = 'Employee No';
                    ToolTip = 'Enter employee number to check email';
                    TableRelation = Employee."No.";
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CheckEmailConfig)
            {
                ApplicationArea = All;
                Caption = 'Check Email Configuration';
                Image = Setup;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    LeaveNotifications: Codeunit "Leave Approval Notifications";
                begin
                    LeaveNotifications.CheckEmailConfiguration();
                end;
            }

            action(CheckEmployeeEmail)
            {
                ApplicationArea = All;
                Caption = 'Check Employee Email';
                Image = Employee;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    LeaveNotifications: Codeunit "Leave Approval Notifications";
                begin
                    if EmployeeNo = '' then
                        Error('Please enter an Employee No first');

                    LeaveNotifications.CheckEmployeeEmail(EmployeeNo);
                end;
            }

            action(TestSingleEmail)
            {
                ApplicationArea = All;
                Caption = 'Test Leave Email';
                Image = Email;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    LeaveNotifications: Codeunit "Leave Approval Notifications";
                begin
                    if LeaveApplicationCode = '' then
                        Error('Please enter a Leave Application Code first');

                    LeaveNotifications.TestEmailForLeaveApplication(LeaveApplicationCode);
                end;
            }
        }
    }

    var
        LeaveApplicationCode: Code[20];
        EmployeeNo: Code[20];
}