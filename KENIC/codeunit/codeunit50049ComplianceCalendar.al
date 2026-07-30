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
       // CalendarEntry.Insert(true);
        CalendarEntry.Validate("Obligation No.", Obligation."No.");
        CalendarEntry."Category Code" := Obligation."Category Code";
        CalendarEntry."Legislation Code" := Obligation."Legislation Code"; 
        CalendarEntry."Legislation Name" := Obligation."Legislation Name"; 
        CalendarEntry.Title := Obligation.Title;
        CalendarEntry."Due Date" := Obligation."Next Due Date";
        CalendarEntry.Validate("Assigned Employee No.", EmpNo);
        CalendarEntry.Status := CalendarEntry.Status::"In Progress";
        CalendarEntry.Insert(true);
        //CalendarEntry.Modify(true);
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
    //sending email to assigned members
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
                        'Compliance Obligation - %1',
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

    //CEO And Board Secretary
   procedure SendManagerTaskStatusNotifications()
var
    ComplianceObligation: Record "Compliance Obligation";
    ObligationEmployee: Record "Compliance Obligation Employee";
    CompanyInfo: Record "Company Information";
    EBoardSetup: Record "E-Board Setup";
    BoardMember: Record "Board Members";
    Email: Codeunit Email;
    EmailMessage: Codeunit "Email Message";
    Subject: Text;
    Body: Text;
    Recipients: List of [Text];
    HasOverdueEmployees: Boolean;
begin
    CompanyInfo.Get();

    if EBoardSetup.Get() then begin
        if EBoardSetup."CEO Personal No." <> '' then
            if BoardMember.Get(EBoardSetup."CEO Personal No.") then
                if BoardMember."Company E-Mail" <> '' then
                    Recipients.Add(BoardMember."Company E-Mail");

        if EBoardSetup."Board Secretary Personal No." <> '' then
            if BoardMember.Get(EBoardSetup."Board Secretary Personal No.") then
                if BoardMember."Company E-Mail" <> '' then
                    Recipients.Add(BoardMember."Company E-Mail");
    end;


    if Recipients.Count() = 0 then
        exit;

  
    ComplianceObligation.Reset();
    ComplianceObligation.SetRange(Posted, true);
    ComplianceObligation.SetFilter("Next Due Date", '<%1', Today());
    ComplianceObligation.SetRange("Manager Notification Sent", false);

    if ComplianceObligation.FindSet(true) then
        repeat
          
            ObligationEmployee.Reset();
            ObligationEmployee.SetRange("Obligation No.", ComplianceObligation."No.");
            ObligationEmployee.SetRange(Status, ObligationEmployee.Status::Overdue);

            HasOverdueEmployees := not ObligationEmployee.IsEmpty();

            if HasOverdueEmployees then begin

                Subject := StrSubstNo('Compliance Escalation: Overdue Obligation - %1', ComplianceObligation.Title);

         
                Body := 'Dear Executive Management,<br><br>';
                Body += 'The following compliance obligation has one or more <b>overdue board member assignments</b> requiring immediate attention.<br><br>';

                Body += '<table style="border-collapse: collapse; width: 100%; max-width: 650px; font-family: Arial, sans-serif; font-size: 14px;">';
                Body += StrSubstNo('<tr style="border-bottom: 1px solid #dddddd;"><td style="padding: 8px; font-weight: bold; background-color: #f2f2f2; width: 30%;">Obligation No.</td><td style="padding: 8px;">%1</td></tr>', ComplianceObligation."No.");
                Body += StrSubstNo('<tr style="border-bottom: 1px solid #dddddd;"><td style="padding: 8px; font-weight: bold; background-color: #f2f2f2;">Title</td><td style="padding: 8px;">%1</td></tr>', ComplianceObligation.Title);
                Body += StrSubstNo('<tr style="border-bottom: 1px solid #dddddd;"><td style="padding: 8px; font-weight: bold; background-color: #f2f2f2;">Description</td><td style="padding: 8px;">%1</td></tr>', ComplianceObligation.Description);
                Body += StrSubstNo('<tr style="border-bottom: 1px solid #dddddd;"><td style="padding: 8px; font-weight: bold; background-color: #f2f2f2;">Priority</td><td style="padding: 8px;">%1</td></tr>', Format(ComplianceObligation.Priority));
                Body += StrSubstNo('<tr style="border-bottom: 1px solid #dddddd;"><td style="padding: 8px; font-weight: bold; background-color: #f2f2f2;">Due Date</td><td style="padding: 8px; color: #d9534f; font-weight: bold;">%1</td></tr>', Format(ComplianceObligation."Next Due Date"));
                Body += '</table><br><br>';

               
                Body += '<b style="font-family: Arial, sans-serif; font-size: 15px; color: #333333;">Overdue Board Members</b><br><br>';
                Body += '<table style="border-collapse: collapse; width: 100%; max-width: 650px; font-family: Arial, sans-serif; font-size: 13px; border: 1px solid #cccccc;">';
                Body += '<tr style="background-color: #333333; color: #ffffff; text-align: left;">';
                Body += '<th style="border: 1px solid #cccccc; padding: 10px;">Board Member</th>';
                Body += '<th style="border: 1px solid #cccccc; padding: 10px;">Email</th>';
                Body += '<th style="border: 1px solid #cccccc; padding: 10px;">Status</th>';
                Body += '</tr>';

                if ObligationEmployee.FindSet() then
                    repeat
                        Body += '<tr style="border-bottom: 1px solid #cccccc;">';
                        Body += StrSubstNo('<td style="border: 1px solid #cccccc; padding: 8px;">%1</td>', ObligationEmployee."Employee Name");
                        Body += StrSubstNo('<td style="border: 1px solid #cccccc; padding: 8px;">%1</td>', ObligationEmployee."Employee Email");
                        Body += StrSubstNo('<td style="border: 1px solid #cccccc; padding: 8px; color: #d9534f; font-weight: bold;">%1</td>', Format(ObligationEmployee.Status));
                        Body += '</tr>';
                    until ObligationEmployee.Next() = 0;

                Body += '</table><br><br>';
                Body += 'Please review and action accordingly.<br><br>';
                Body += 'Regards,<br>';
                Body += '<b>' + CompanyInfo.Name + '</b><br><br>';
                Body += '<i style="color: #777777; font-size: 12px;">This is an automated system notification. Please do not reply.</i>';

                
                if (Time() >= 080000T) and (Time() < 170000T) then begin
                    Clear(EmailMessage);
                    EmailMessage.Create(
                        Recipients,
                        Subject,
                        Body,
                        true);

                    if Email.Send(EmailMessage, Enum::"Email Scenario"::Default) then begin
                        ComplianceObligation."Manager Notification Sent" := true;
                        ComplianceObligation.Modify(true);
                    end;
                end;

            end;
        until ComplianceObligation.Next() = 0;
end;
}