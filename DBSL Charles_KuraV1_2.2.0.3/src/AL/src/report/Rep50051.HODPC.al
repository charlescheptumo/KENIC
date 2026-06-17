report 50051 HODPC
{
    Caption = 'HODPCReminder';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(ResponsibilityCenter; "Responsibility Center")
        {
            RequestFilterFields = Code;

            trigger OnAfterGetRecord()
            var

                SPMGeneralSetup: Record "SPM General Setup";
                NotificationofPC: Date;
                Employee: Record Employee;
                Email2: Text;
                Email3: Text;
                Recepient, Subject, Body : Text;
                Email: Codeunit Email;
                EmailMess: Codeunit "Email Message";
                EmailScen: Enum "Email Scenario";
            begin

                // NotificationofPC := CALCDATE('-' + FORMAT(SPMGeneralSetup."Notification Due of PC"), SPMGeneralSetup."Current Quarter Start Date");
                // IF (TODAY = NotificationofPC) THEN BEGIN
                Employee.RESET;
                Employee.SETRANGE("Department Code", ResponsibilityCenter.Code);
                Employee.SETRANGE(HOD, TRUE);

                IF Employee.FINDFIRST THEN BEGIN
                    Email3 := Employee."Company E-Mail";
                    Email2 := SPMGeneralSetup."Planning and Strategy Email";
                    Subject := 'HOD Perfomance Contract Reminder';
                    Body += 'Attention HoD: ' + ResponsibilityCenter.Name + ',';
                    Body += 'Dear ' + Employee."First Name" + ', Please Draft your Performance Contract for Period of ' + SPMGeneralSetup."Current Reporting Period" + ' Quarter ' + SPMGeneralSetup."Current Reporting Quarter";
                    Body += '<BR><BR>Warm Regards,' + '<BR><BR>RPM.<BR>' + '<BR>';
                    //Message(Body);
                    EmailMess.Create(Email3, Subject, Body, true);
                    Email.OpenInEditor(EmailMess, EmailScen::Default);

                END;

                EmailMess.Create(Email3, Subject, Body, true);
                Email.Send(EmailMess, EmailScen::Default);
            END;
            //End;
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
