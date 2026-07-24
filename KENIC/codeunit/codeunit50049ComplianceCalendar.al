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
        CalendarEntry.Status := CalendarEntry.Status::Open;
        CalendarEntry.Insert(true);
    end;

   
    // Sends automated email notifications to assigned employees for open tasks due within the upcoming threshold (e.g., 7 days).

    procedure SendUpcomingTaskReminders()
    var
        CalendarEntry: Record "Compliance Calendar Entry";
        Employee: Record Employee;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Subject: Text;
        Body: Text;
        ReminderThresholdDate: Date;
    begin
        CompanyInfo.Get();
        ReminderThresholdDate := CalcDate('<+7D>', Today()); 

        CalendarEntry.Reset();
        CalendarEntry.SetRange(Status, CalendarEntry.Status::Open);
        CalendarEntry.SetRange("Due Date", Today(), ReminderThresholdDate);

        if CalendarEntry.FindSet() then
            repeat
                if Employee.Get(CalendarEntry."Assigned Employee No.") then begin
                    if Employee."Company E-Mail" <> '' then begin
                        Subject := StrSubstNo('REMINDER: Compliance Task Due Soon - %1', CalendarEntry.Title);

                        Body := StrSubstNo('Dear %1,<br><br>', Employee.FullName());
                        Body += StrSubstNo('This is a reminder for your upcoming compliance task: <b>%1</b>.<br><br>', CalendarEntry.Title);
                        Body += StrSubstNo('<b>Task No.:</b> %1<br>', CalendarEntry."No.");
                        Body += StrSubstNo('<b>Obligation No.:</b> %1<br>', CalendarEntry."Obligation No.");
                        Body += StrSubstNo('<b>Due Date:</b> <span style="color: #d83b01; font-weight: bold;">%1</span><br><br>', Format(CalendarEntry."Due Date"));
                        Body += 'Please log into the ERP to attach required proof and mark the entry as complete.<br><br>';
                        Body += 'Regards,<br>';
                        Body += CompanyInfo.Name + '<br><br>';
                        Body += '<i>This is an automated system notification. Please do not reply.</i>';

                        Clear(EmailMessage);
                        EmailMessage.Create(Employee."Company E-Mail", Subject, Body, true);
                        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                    end;
                end;
            until CalendarEntry.Next() = 0;
    end;

 
    // Sweeps past-due open entries and updates their status to Overdue.
  
    procedure CheckAndUpdateOverdueEntries()
    var
        CalendarEntry: Record "Compliance Calendar Entry";
    begin
        CalendarEntry.Reset();
        CalendarEntry.SetRange(Status, CalendarEntry.Status::Open);
        CalendarEntry.SetFilter("Due Date", '<%1', Today());

        if CalendarEntry.FindSet(true) then
            repeat
                CalendarEntry.Status := CalendarEntry.Status::Overdue;
                CalendarEntry.Modify(true);
            until CalendarEntry.Next() = 0;
    end;
}