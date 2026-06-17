report 50045 "Notice On Contract"
{
    ApplicationArea = All;
    Caption = 'Notice On Contract';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(Emp; Employee)
        {
            RequestFilterFields = "No.";

            column(No_Emp; Emp."No.")
            {
            }

            dataitem(Integer; Integer)
            {


                trigger OnPreDataItem()
                begin
                    Integer.SetRange(Number, 1);
                end;

                trigger OnAfterGetRecord()
                begin
                    Emp.Reset();
                    // Emp.SetRange("No.", Emp."No.");
                    Emp.SetRange(Status, Emp.Status::Active);
                    Emp.SetFilter(Emp."Contract End Date", '<=%1', CalcDate(Emp."Notice Period", Today));
                    if Emp.FindSet() then begin
                        if Emp.Get(Emp."No.") then
                            if Emp."E-Mail" = '' then
                                Error('Insert email for Employee %1', Emp."No.");
                        Recepient := Emp."E-Mail";

                        // Notice := CalcDate(Emp."Notice Period", Emp."Contract End Date");
                        // if (Notice < Today) or (Notice = Today) then begin

                        Clear(ToRecipients);
                        Clear(CC);
                        Clear(BCC);
                        ToRecipients.Add(Recepient);
                        // CC.Add('robertwachira@dynasoft.co.ke');

                        Subject := 'Contract Expiry Reminder';
                        Body := 'Dear Sir/Madam' + ',<br>';
                        Body += '<br> This is a reminder to that your contract is almost expiring.' + Emp."No.";
                        Body += '<br> <br> Kind Regards, <br>';
                        Body += 'Human Resource Management Department. <br>';
                        Body += 'Anti-Doping Agency of Kenya.';

                        // EmailMessage.Create(Recepient, Subject, Body, true);

                        EmailMessage.Create(ToRecipients, Subject, Body, true, CC, BCC);

                        Email.Send(EmailMessage, "Email Scenario"::HR);
                    end;
                end;
            }
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

    var
        i: Integer;
        NoOfDays: Integer;
        ReportingDate: Date;
        // Emp: Record Employee;
        Email: Codeunit Email;
        EmailScen: Codeunit "Email Scenario";
        EmailMessage: Codeunit "Email Message";
        Recepient: Text[100];
        Subject: Text;
        Body: Text;
        Notice: Date;
        ToRecipients: List of [Text];
        BCC: List of [Text];
        CC: List of [Text];
}
