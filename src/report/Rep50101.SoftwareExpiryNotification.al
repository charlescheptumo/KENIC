namespace KICD.KICD;
using System.Email;

report 50101 "Software Expiry Notification"
{
    Caption = 'Software Expiry Notification';
    ProcessingOnly = true;
    ApplicationArea = All;
    dataset
    {
        dataitem(ICTInventory; "ICT Inventory")
        {
            trigger OnAfterGetRecord()
            var
            begin
                ICTInventory.Reset();
                ICTInventory.SetRange("Has Expiry Date", true);
                ICTInventory.SetFilter("Expiry Date", '<>%1', 0D);
                if ICTInventory.FindSet() then
                    repeat
                        if CalcDate('-3M', "Expiry Date") = Today then begin
                            Recipient := ICTInventory.Email;
                            Subject := 'ICT NOTIFICATION ON SOFTWARE EXPIRY' + ' ' + ICTInventory.Code;
                            Body := 'Dear ' + 'ICT Team' + ',' + '\n' +
                                    'The Software item is set to expire on Please take the necessary action.';
                            EmailMess.Create(Recipient, Subject, Body);
                            Em.Send(EmailMess, "Email Scenario"::Default)
                        end;
                    until ICTInventory.Next() = 0;
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
        Recipient: Text;
        Subject: Text;
        Body: Text;
        Em: Codeunit Email;
        EmailMess: Codeunit "Email Message";
}
