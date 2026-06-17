/// <summary>
/// Codeunit HR Job Queue (ID 50020).
/// </summary>
codeunit 50020 "HR Job Queue"
{
    trigger OnRun()
    begin
        NotifyHROnStaffRetirements();
    end;

    local procedure NotifyHROnStaffRetirements()
    var
        Employee: Record Employee;
        HRSetup: Record "Human Resources Setup";
    begin
        Employee.Reset();
        Employee.SetRange(Status, Employee.Status::Active);
        Employee.SetRange("Retirement Date", /*CalcDate('<CM+90D>', Today)*/Today);
        if Employee.FindSet() then
            repeat
                SendRetirementEmails(Employee);
            until Employee.Next() = 0;
    end;

    local procedure SendRetirementEmails(Emp: Record Employee)
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        HRSetup: Record "Human Resources Setup";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        EmailCCRecepient: List of [Text];
        EmailBCCRecepient: List of [Text];
    begin
        EmailSubject := 'STAFF RETIREMENT REMINDER';
        EmailBody := 'This is to remind you that' + ' <B>' + Emp.FullName() + '</B> will be retiring on date' + ' <B>' + Format(Emp."Retirement Date") + '</B>.';

        EmailRecepient.Add('jimmymutiso@dynasoft.co.ke');
        EmailCCRecepient.Add(Emp."E-Mail");

        EmailMessage.Create(
            EmailRecepient,
            EmailSubject,
            EmailBody,
            false,
            EmailCCRecepient,
            EmailBCCRecepient);

        Email.Send(EmailMessage);

    end;
}
