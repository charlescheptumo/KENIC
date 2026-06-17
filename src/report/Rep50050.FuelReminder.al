report 50050 "Fuel Reminder"
{
    ApplicationArea = All;
    Caption = 'Fuel Reminder';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Fuel Card"; "Fuel Card")
        {
            RequestFilterFields = No;

            trigger OnAfterGetRecord()
            begin
                "Fuel Card".Reset();
                "Fuel Card".SetRange(No, "Fuel Card".No);
                if "Fuel Card".findset then begin
                    Reminder := "Fuel Card"."Allocated Vehicle Limit" - "Fuel Card"."Total Amount Spend";
                    if Reminder <= "Fuel Card".lowerlimit then begin
                        // if "Fuel Card".lowerlimit <= "Fuel Card"."Fuel Card Limit Reminder" then begin
                        UserSetup.Get();
                        UserSetup.SetRange("Fuel Reminder", true);
                        if UserSetup.findset() then begin
                            repeat
                                Recepient := UserSetup."E-Mail";
                                EmployeeNo := UserSetup."Employee No.";
                                EmployeeName := UserSetup."Employee Name";

                                Subject := 'Reminder to refill the Fuel Card ' + FuelCardNo;
                                Body += 'Dear ' + EmployeeName + ', <br>';
                                Body += '<br>This is a reminder to refill the Fuel Card ' + FuelCardNo + ' since is has reached the Fuel Card Limit of ' + Format("Fuel Card".lowerlimit);
                                Body += '<br><br>This is an automated mail. Kindly do not respond to it.';

                                EmailMessage.Create(Recepient, Subject, Body, true);
                                Email.Send(EmailMessage, EmailScenario::Default);
                            until UserSetup.next = 0;
                        end;
                    end;
                end;
            end;
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
        FuelCard: Record "Fuel Card";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailScenario: Enum "Email Scenario";
        Recepient, Subject, Body, EmployeeName : Text;
        UserSetup: Record "User Setup";
        EmployeeNo, FuelCardNo : Code[250];
        Reminder: Decimal;
}
