namespace KICD.KICD;

page 50346 "Send SMS Dialog"
{
    PageType = StandardDialog;
    ApplicationArea = All;
    Caption = 'Send SMS';

    layout
    {
        area(content)
        {
            group(General)
            {
                field(PhoneNo; PhoneNo)
                {
                    ApplicationArea = All;
                    Caption = 'Phone Number';
                }

                field(MessageText; MessageText)
                {
                    ApplicationArea = All;
                    Caption = 'Message';
                    MultiLine = true;
                }
            }
        }
    }

    var
        PhoneNo: Text;
        MessageText: Text;

    procedure SetDefaults(No: Text; Msg: Text)
    begin
        PhoneNo := No;
        MessageText := Msg;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        SMSCU: Codeunit SMS;
        Response: Text;
    begin
        // Only send when user clicks OK
        if CloseAction = Action::OK then begin

            if PhoneNo = '' then
                Error('Phone number is required.');

            if MessageText = '' then
                Error('Message cannot be empty.');

            Response := SMSCU.SendSingleSMS(PhoneNo, MessageText);
        end;

        exit(true);
    end;
}