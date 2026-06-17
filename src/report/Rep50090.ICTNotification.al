namespace KICD.KICD;
using System.Email;

report 50090 "ICT Notification"
{
    Caption = 'ICT Notification';
    ProcessingOnly = true;
    ApplicationArea = All;
    dataset
    {
        dataitem(ICTHelpdesk; "ICT Helpdesk")
        {
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                ICTHelpdesk.Reset();
                ICTHelpdesk.SetRange(Status, Status::Assigned);
                ICTHelpdesk.SetFilter("Request Date", '<>%1', 0D);
                if ICTHelpdesk.FindSet() then
                    repeat
                        if CalcDate('3D', "Request Date") <= Today then begin
                            Recipient := ICTHelpdesk."Assign To Email";
                            Subject := 'ICT NOTIFICATION REMINDER' + ' ' + ICTHelpdesk."Job No.";
                            //Body := 'Please note that the issue on the subject above was assigned to you by' + ' ' + ICTHelpdesk."Assigned To";
                            Body := 'Dear ' + ICTHelpdesk."Assigned To EmpNo" + ',' + '\n' +
                                    'This is a gentle reminder regarding the ICT Helpdesk request assigned to you.' + '\n' +
                                    'The ICT Helpdesk Issues No. ' + ICTHelpdesk."Job No." + ' was assigned to you on ' + Format(ICTHelpdesk."Assigned Date") + '.' + '\n' +
                                    'kindly request that you review and address the issue as soon as possible.' + '\n' +
                                    'Thank you for your prompt attention to this matter.' + '\n';
                            EmailMess.Create(Recipient, Subject, Body);
                            Em.Send(EmailMess, "Email Scenario"::Default);
                        end;
                    until ICTHelpdesk.Next() = 0;

            end;
        }
    }
    var
        Recipient: Text;
        Subject: Text;
        Body: Text;
        Em: Codeunit Email;
        EmailMess: Codeunit "Email Message";
}