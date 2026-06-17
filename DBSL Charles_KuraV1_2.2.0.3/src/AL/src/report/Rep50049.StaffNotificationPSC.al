report 50049 "Staff Notification PSC"
{
    Caption = 'Staff Notification PSC';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    ApplicationArea = All;
    dataset
    {
        dataitem(PerfomanceContractHeader; "Perfomance Contract Header")


        {
            //DataItemTableView = where("Score Card Type" = filter(staff | Principal | Principal));
            RequestFilterFields = "Responsible Employee No.";
            trigger OnAfterGetRecord()
            var
                SPMGeneralSetup: Record "SPM General Setup";
                NotificationofPC: Date;
                Employee: Record Employee;
                Email2: Text;
                Email3: Text;
                NotifyEmployeeOneweekbefore: Date;
                EmployeeName: Text[250];
                Recepient, Subject, Body : Text;
                Email: Codeunit Email;
                EmailMess: Codeunit "Email Message";
                EmailScen: Enum "Email Scenario";

            begin
                //NotifyEmployeeOneweekbefore := CALCDATE('-15D', SPMGeneralSetup."Current Quarter End Date");
                //  IF (TODAY=NotifyEmployeeOneweekbefore) THEN BEGIN
                Employee.RESET;
                Employee.SETRANGE("No.", PerfomanceContractHeader."Responsible Employee No.");
                //Employee.SetRange(HOD, false);
                IF Employee.FINDFIRST THEN BEGIN
                    Email3 := Employee."Company E-Mail";
                    EmployeeName := Employee."First Name" + ' ' + Employee."Last Name";
                    //EndDate := "Perfomance Contract Header"."End Date";
                    Email2 := SPMGeneralSetup."Planning and Strategy Email";
                    Subject := 'Staff Annual Workplan Reminder';
                    Body += 'Dear ' + EmployeeName + ', You are reminded that your individual annual perfomance targets are due on' + SPMGeneralSetup."Current Reporting Period" + ' Quarter ' + SPMGeneralSetup."Current Reporting Quarter";
                    Body += '<BR><BR>Human Resource & Administration,' + '<BR>';
                    Body := Body + 'Log into the Planning & Strategy module to prepare and submit your targets before the deadline.';
                    EmailMess.Create(Email3, Subject, Body, true);
                    Email.OpenInEditor(EmailMess, EmailScen::Default);
                END;
                EmailMess.Create(Email3, Subject, Body, true);
                Email.Send(EmailMess, EmailScen::Default);
            END;


        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }


    }
}
