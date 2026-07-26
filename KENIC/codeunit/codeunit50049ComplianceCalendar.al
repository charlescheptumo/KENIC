namespace KENIC.KENIC;

using System.Email;
using Microsoft.Foundation.Company;
using Microsoft.HumanResources.Employee;

codeunit 50049 "Compliance Calendar"
{
    var
        CompanyInfo: Record "Company Information";


    // Generates individual Compliance Calendar Entries from a Compliance Obligation.
    procedure GenerateCalendarEntries(Obligation: Record "Compliance Obligation")
    var
        ObligationEmp: Record "Compliance Obligation Employee";
    begin
        ObligationEmp.Reset();
        ObligationEmp.SetRange("Obligation No.", Obligation."No.");

        if ObligationEmp.FindSet() then
            repeat
                CreateSingleCalendarEntry(Obligation, ObligationEmp."Employee No.");
            until ObligationEmp.Next() = 0
        else

            if Obligation."Primary Employee No." <> '' then
                CreateSingleCalendarEntry(Obligation, Obligation."Primary Employee No.");
    end;

    local procedure CreateSingleCalendarEntry(Obligation: Record "Compliance Obligation"; EmpNo: Code[20])
    var
        CalendarEntry: Record "Compliance Calendar Entry";
    begin
        CalendarEntry.Init();
        CalendarEntry."No." := '';
        CalendarEntry.Validate("Obligation No.", Obligation."No.");
        CalendarEntry."Category Code" := Obligation."Category Code";
        CalendarEntry.Title := Obligation.Title;
        CalendarEntry."Due Date" := Obligation."Next Due Date";
        CalendarEntry.Validate("Assigned Employee No.", EmpNo);
        CalendarEntry.Status := CalendarEntry.Status::"In Progress";
        CalendarEntry.Insert(true);
    end;


    // Sends automated email notifications to assigned employees for open tasks due within the upcoming threshold 
    procedure SendUpcomingTaskReminders()
    var
        CalendarEntry: Record "Compliance Calendar Entry";
        Employee: Record Employee;
        CompanyInfo: Record "Company Information";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Subject: Text;
        Body: Text;
        DaysUntilDue: Integer;
        CurrentTime: Time;
        ShouldSendReminder: Boolean;
    begin
        CompanyInfo.Get();
        CurrentTime := Time();


        if (CurrentTime < 090000T) or (CurrentTime >= 160000T) then
            exit;

        CalendarEntry.Reset();
        CalendarEntry.SetRange(Status, CalendarEntry.Status::"In Progress");

        CalendarEntry.SetRange("Due Date", Today(), CalcDate('<+60D>', Today()));

        if CalendarEntry.FindSet(true) then
            repeat
                DaysUntilDue := CalendarEntry."Due Date" - Today();
                ShouldSendReminder := false;


                case DaysUntilDue of
                    60:
                        if not CalendarEntry."60-Day Reminder Sent" then begin
                            ShouldSendReminder := true;
                            CalendarEntry."60-Day Reminder Sent" := true;
                        end;
                    30:
                        if not CalendarEntry."30-Day Reminder Sent" then begin
                            ShouldSendReminder := true;
                            CalendarEntry."30-Day Reminder Sent" := true;
                        end;
                    14:
                        if not CalendarEntry."14-Day Reminder Sent" then begin
                            ShouldSendReminder := true;
                            CalendarEntry."14-Day Reminder Sent" := true;
                        end;
                end;

                if ShouldSendReminder then
                    if Employee.Get(CalendarEntry."Assigned Employee No.") then
                        if Employee."Company E-Mail" <> '' then begin
                            Subject := StrSubstNo('REMINDER: Compliance Obligation Due in %1 Days - %2', DaysUntilDue, CalendarEntry.Title);

                            Body := StrSubstNo('Dear %1,<br><br>', Employee.FullName());
                            Body += StrSubstNo('This is a reminder for your upcoming compliance obligation: <b>%1</b>.<br><br>', CalendarEntry.Title);
                            Body += StrSubstNo('<b>Entry No.:</b> %1<br>', CalendarEntry."No.");
                            Body += StrSubstNo('<b>Obligation No.:</b> %1<br>', CalendarEntry."Obligation No.");
                            Body += StrSubstNo('<b>Due Date:</b> <span style="color: #d83b01; font-weight: bold;">%1 (%2 days remaining)</span><br><br>', Format(CalendarEntry."Due Date"), DaysUntilDue);
                            Body += 'Please log into the system to review and update the compliance obligation status.<br><br>';
                            Body += 'Regards,<br>';
                            Body += CompanyInfo.Name + '<br><br>';
                            Body += '<i>This is an automated system notification. Please do not reply.</i>';

                            Clear(EmailMessage);
                            EmailMessage.Create(Employee."Company E-Mail", Subject, Body, true);

                            if Email.Send(EmailMessage, Enum::"Email Scenario"::Default) then
                                CalendarEntry.Modify(true);
                        end;
            until CalendarEntry.Next() = 0;
    end;


    // Sweeps past-due open entries and updates their status to Overdue.
    procedure CheckAndUpdateOverdueEntries()
    var
        CalendarEntry: Record "Compliance Calendar Entry";
        ObligationEmployee: Record "Compliance Obligation Employee";
    begin
        CalendarEntry.Reset();
        CalendarEntry.SetRange(Status, CalendarEntry.Status::"In Progress");
        CalendarEntry.SetFilter("Due Date", '<%1', Today());

        if CalendarEntry.FindSet(true) then
            repeat

                CalendarEntry.Status := CalendarEntry.Status::Overdue;
                CalendarEntry.Modify(true);


                if ObligationEmployee.Get(
                    CalendarEntry."Obligation No.",
                    CalendarEntry."Assigned Employee No.") then begin

                    if ObligationEmployee.Status <> ObligationEmployee.Status::Completed then begin
                        ObligationEmployee.Status := ObligationEmployee.Status::Overdue;
                        ObligationEmployee.Modify(true);
                    end;
                end;

            until CalendarEntry.Next() = 0;
    end;
    //sending email to assigned employees
    procedure SendTaskAssignmentNotifications(Obligation: Record "Compliance Obligation")
    var
        ObligationEmployee: Record "Compliance Obligation Employee";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        CompanyInfo: Record "Company Information";
        Subject: Text;
        Body: Text;
    begin
        CompanyInfo.Get();

        ObligationEmployee.SetRange("Obligation No.", Obligation."No.");

        if ObligationEmployee.FindSet() then
            repeat
                if ObligationEmployee."Employee Email" <> '' then begin

                    Subject := StrSubstNo(
                        'New Compliance Obligation Assigned - %1',
                        Obligation.Title);

                    Body := StrSubstNo(
                        'Dear %1,<br><br>',
                        ObligationEmployee."Employee Name");

                    Body += 'A new compliance obligation has been assigned to you.<br><br>';

                    Body += '<table border="1" cellpadding="6" cellspacing="0" style="border-collapse:collapse;">';

                    Body += StrSubstNo(
                        '<tr><td><b>Obligation No.</b></td><td>%1</td></tr>',
                        Obligation."No.");

                    Body += StrSubstNo(
                        '<tr><td><b>Title</b></td><td>%1</td></tr>',
                        Obligation.Title);

                    Body += StrSubstNo(
                        '<tr><td><b>Description</b></td><td>%1</td></tr>',
                        Obligation.Description);

                    Body += StrSubstNo(
                        '<tr><td><b>Priority</b></td><td>%1</td></tr>',
                        Format(Obligation.Priority));

                    Body += StrSubstNo(
                        '<tr><td><b>Start Date</b></td><td>%1</td></tr>',
                        Format(Obligation."Start Date"));

                    Body += StrSubstNo(
                        '<tr><td><b>Due Date</b></td><td>%1</td></tr>',
                        Format(Obligation."Next Due Date"));

                    Body += StrSubstNo(
                        '<tr><td><b>Assigned By</b></td><td>%1</td></tr>',
                        Obligation."Assigned By Employee Name");

                    Body += '</table><br>';

                    Body += 'Please complete the assigned obligation before the due date and update status through the Portal.<br><br>';

                    Body += 'Regards,<br>';
                    Body += CompanyInfo.Name + '<br><br>';
                    Body += '<i>This is an automated system notification. Please do not reply.</i>';

                    Clear(EmailMessage);
                    EmailMessage.Create(
                        ObligationEmployee."Employee Email",
                        Subject,
                        Body,
                        true);

                    Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                end;
            until ObligationEmployee.Next() = 0;
    end;

    //Manager email
    procedure SendManagerTaskStatusNotifications()
    var
        ComplianceObligation: Record "Compliance Obligation";
        ObligationEmployee: Record "Compliance Obligation Employee";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        CompanyInfo: Record "Company Information";
        Subject: Text;
        Body: Text;
    begin
        CompanyInfo.Get();

        ComplianceObligation.Reset();
        ComplianceObligation.SetRange(Posted, true);
        ComplianceObligation.SetRange("Next Due Date", Today());
        ComplianceObligation.SetRange("Manager Notification Sent", false);

        if ComplianceObligation.FindSet(true) then
            repeat
                if ComplianceObligation."Assigned By Email" = '' then
                    continue;

                Subject := StrSubstNo(
                    'Compliance Obligation Due Today - %1',
                    ComplianceObligation.Title);

                Body := StrSubstNo(
                    'Dear %1,<br><br>',
                    ComplianceObligation."Assigned By Employee Name");

                Body += 'This is to notify you that the following compliance obligation assigned by you is due today.<br><br>';

                Body += '<table border="1" cellpadding="6" cellspacing="0" style="border-collapse:collapse;">';

                Body += StrSubstNo(
                    '<tr><td><b>Obligation No.</b></td><td>%1</td></tr>',
                    ComplianceObligation."No.");

                Body += StrSubstNo(
                    '<tr><td><b>Title</b></td><td>%1</td></tr>',
                    ComplianceObligation.Title);

                Body += StrSubstNo(
                    '<tr><td><b>Description</b></td><td>%1</td></tr>',
                    ComplianceObligation.Description);

                Body += StrSubstNo(
                    '<tr><td><b>Priority</b></td><td>%1</td></tr>',
                    Format(ComplianceObligation.Priority));

                Body += StrSubstNo(
                    '<tr><td><b>Start Date</b></td><td>%1</td></tr>',
                    Format(ComplianceObligation."Start Date"));

                Body += StrSubstNo(
                    '<tr><td><b>Due Date</b></td><td>%1</td></tr>',
                    Format(ComplianceObligation."Next Due Date"));

                Body += '</table><br><br>';

                Body += '<b>Employee Progress</b><br><br>';

                Body += '<table border="1" cellpadding="6" cellspacing="0" style="border-collapse:collapse;">';
                Body += '<tr>';
                Body += '<th>Employee</th>';
                Body += '<th>Email</th>';
                Body += '<th>Status</th>';
                Body += '<th>Completed On</th>';
                Body += '</tr>';

                ObligationEmployee.Reset();
                ObligationEmployee.SetRange("Obligation No.", ComplianceObligation."No.");

                if ObligationEmployee.FindSet() then
                    repeat
                        Body += '<tr>';

                        Body += StrSubstNo(
                            '<td>%1</td>',
                            ObligationEmployee."Employee Name");

                        Body += StrSubstNo(
                            '<td>%1</td>',
                            ObligationEmployee."Employee Email");

                        Body += StrSubstNo(
                            '<td>%1</td>',
                            Format(ObligationEmployee.Status));

                        if ObligationEmployee."Completed DateTime" <> 0DT then
                            Body += StrSubstNo(
                                '<td>%1</td>',
                                Format(ObligationEmployee."Completed DateTime"))
                        else
                            Body += '<td>-</td>';

                        Body += '</tr>';
                    until ObligationEmployee.Next() = 0;

                Body += '</table><br><br>';

                Body += 'Please follow up with employees who have not completed their assigned compliance obligations.<br><br>';

                Body += 'Regards,<br>';
                Body += CompanyInfo.Name + '<br><br>';
                Body += '<i>This is an automated system notification. Please do not reply.</i>';


                if (Time() >= 080000T) and (Time() < 170000T) then begin
                    Clear(EmailMessage);
                    EmailMessage.Create(
                        ComplianceObligation."Assigned By Email",
                        Subject,
                        Body,
                        true);

                    if Email.Send(EmailMessage, Enum::"Email Scenario"::Default) then begin
                        ComplianceObligation."Manager Notification Sent" := true;
                        ComplianceObligation.Modify(true);
                    end;
                end;

            until ComplianceObligation.Next() = 0;
    end;
}