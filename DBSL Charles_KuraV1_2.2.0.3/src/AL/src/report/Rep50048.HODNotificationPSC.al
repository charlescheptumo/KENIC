report 50048 "HOD Notification PSC"
{
    ApplicationArea = All;
    Caption = 'HOD Notification PSC';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
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
            begin

                // NotificationofPC := CALCDATE('-' + FORMAT(SPMGeneralSetup."Notification Due of PC"), SPMGeneralSetup."Current Quarter End Date");
                // IF (TODAY = NotificationofPC) THEN BEGIN
                Employee.RESET;
                Employee.SETRANGE("Department Code", ResponsibilityCenter.Code);
                Employee.SETRANGE(HOD, TRUE);

                IF Employee.FINDFIRST THEN BEGIN
                    Email3 := Employee."Company E-Mail";
                    Email2 := SPMGeneralSetup."Planning and Strategy Email";
                    Subject := 'HOD Annual Workplan Reminder';
                    Body += 'Attention HoD: ' + ResponsibilityCenter.Name + ',';
                    Body += 'Dear ' + Employee."First Name" + ', Please Draft your departmental Annual Workplan  for Period of ' + SPMGeneralSetup."Current Reporting Period" + ' Quarter ' + SPMGeneralSetup."Current Reporting Quarter";
                    Body += '<BR><BR>Warm Regards,' + '<BR><BR>RPM.<BR>' + '<BR>';
                    //Message(Body);
                    EmailMess.Create(Email3, Subject, Body, true);
                    Email.OpenInEditor(EmailMess, EmailScen::Default);

                END;
                //Message(Body);
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
        //end;
    }
    var
        Recepient, Subject, Body : Text;
        Email: Codeunit Email;
        EmailMess: Codeunit "Email Message";
        EmailScen: Enum "Email Scenario";

}
