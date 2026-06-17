page 50065 "CEO Appointment"
{
    ApplicationArea = All;
    Caption = 'CEO Appointment';
    PageType = Card;
    SourceTable = "CEO Appointment";
    SourceTableView = where("Appointment Status" = filter("Pending Acceptance"));

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.', Comment = '%';
                    Editable = false;
                }
                field("Appointment Status"; Rec."Appointment Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointment Status field.', Comment = '%';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Appointment Date"; Rec."Appointment Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointment Date field.', Comment = '%';
                }
                field("Appointment Time"; Rec."Appointment Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointment Time field.', Comment = '%';
                }
                field("Appointment End Date"; Rec."Appointment End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointment End Date field.', Comment = '%';
                }
                field("Appointment End Time"; Rec."Appointment End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointment End Time field.', Comment = '%';
                }
                field("Is Online?"; Rec."Is Online?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Is Online? field.', Comment = '%';
                }
                field("Meeting Subject"; Rec."Meeting Subject")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Subject field.', Comment = '%';
                }
                field("Meeting Venue"; Rec."Meeting Venue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Venue field.', Comment = '%';
                }
                field("Rescheduled Date"; Rec."Rescheduled Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rescheduled Date field.', Comment = '%';
                }
                field("Rescheduled Time"; Rec."Rescheduled Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rescheduled Time field.', Comment = '%';
                }
                field("Requested by Employee No"; Rec."Requested by Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.', Comment = '%';
                }
                field("Requested by Employee Name"; Rec."Requested by Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.', Comment = '%';
                }

            }
        }
    }
    actions
    {
        area(Creation)
        {
            action("Request Appointment")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = BookingsLogo;
                Caption = '&Request Appointment';
                Visible = false;
                ToolTip = 'Executes the &Request Appointment action.';

                trigger OnAction()
                begin
                    // Emp.Get(Rec."Employee No");
                    Emp.Get(Rec."CEO No");
                    if Emp."E-Mail" = '' then
                        Error('Kindly Contact the System Administrator due to blank email for Employee %1', Emp."First Name");

                    Recepient := Emp."E-Mail";

                    Subject := 'Booking for an Appointment';
                    Body += 'Dear ' + Emp."First Name" + ',';
                    // Body += '<br>I am currently booking for an appointment at this date and time' + Rec."Appointment Date" + '.';
                    Body += '<br> There is an appointment booking awaiting for your action. <br>';
                    Body += '<br> Kindly log in into the Business Central System to confirm your availability. <br>';
                    Body += '<br> Kind Regards, <br> <br> ' + Emp."First Name" + ' ' + Emp."Middle Name" + '.';

                    EmailMess.Create(Recepient, Subject, Body, true);
                    Email.Send(EmailMess, EmailScen::Default);
                    Rec."Appointment Status" := Rec."Appointment Status"::"Pending Acceptance";
                    Message('You have Requested for an Appointment');
                    // CustomFunc.CreateEvent(Rec);
                end;
            }
            action("Accept Appointment")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Visible = false;
                Image = BookingsLogo;
                Caption = '&Accept Appointment';
                ToolTip = 'Executes the &Accept Appointment action.';

                trigger OnAction()
                begin
                    Emp.Get(Rec."Requested by Employee No");
                    if Emp."E-Mail" = '' then
                        Error('Kindly Contact the System Administrator due to blank email for Employee %1', Emp."First Name");

                    Recepient := Emp."E-Mail";

                    Subject := 'Booking for an Appointment';
                    Body += 'Dear ' + Emp."First Name" + ',';
                    // Body += '<br>I am currently booking for an appointment at this date and time' + Rec."Appointment Date" + '.';
                    Body += '<br> Your Appointment has been approved. <br> ';
                    Body += '<br> Kindly keep mind to attend the appointment. <br> ';
                    Body += '<br> Kind Regards, <br> <br> The CEO. <br> ';

                    EmailMess.Create(Recepient, Subject, Body, true);
                    Email.Send(EmailMess, EmailScen::Default);
                    Rec."Appointment Status" := Rec."Appointment Status"::Accepted;
                    Message('You have accepted the Appointment');
                    // CustomFunc.CreateEvent(Rec);
                    CurrPage.Close();
                end;
            }
            action("Accept Appointment & Add to Calendar")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Image = BookingsLogo;
                Caption = '&Accept Appointment/Add to Calendar';
                ToolTip = 'Executes the &Accept Appointment/Add to Calendar action.';

                trigger OnAction()
                begin
                    Emp.Get(Rec."Requested by Employee No");
                    if Emp."E-Mail" = '' then
                        Error('Kindly Contact the System Administrator due to blank email for Employee %1', Emp."First Name");

                    Recepient := Emp."E-Mail";

                    Subject := 'Booking for an Appointment';
                    Body += 'Dear ' + Emp."First Name" + ',';
                    Body += '<br>Your Appointment has been approved. <br> ';
                    Body += '<br>Kindly keep mind to attend the appointment. <br> ';
                    Body += '<br>Kind Regards,<br><br>The CEO.<br> ';

                    // EmailMess.Create(Recepient, Subject, Body, true);
                    // Email.Send(EmailMess, EmailScen::Default);
                    //Rec."Appointment Status" := Rec."Appointment Status"::Accepted;
                    Message('You have accepted the Appointment');
                    CustomFunc.CreateEvent(Rec);
                    CurrPage.Close();
                end;
            }
            action("Test Appointment")
            {
                ApplicationArea = All;
                ToolTip = 'Executes the Test Appointment action.';

                trigger OnAction()
                begin
                    CustomFunc.GetUserId();
                end;
            }
            action("Reject Appointment")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Image = BookingsLogo;
                Caption = '&Reject Appointment';
                ToolTip = 'Executes the &Reject Appointment action.';

                trigger OnAction()
                begin
                    Emp.Get(Rec."Requested by Employee No");
                    if Emp."E-Mail" = '' then
                        Error('Kindly Contact the System Administrator due to blank email for Employee %1', Emp."First Name");

                    Recepient := Emp."E-Mail";

                    Subject := 'Booking for an Appointment';
                    Body += 'Dear ' + Emp."First Name" + ' ,';
                    // Body += '<br>I am currently booking for an appointment at this date and time' + Rec."Appointment Date" + '.';
                    Body += '<br> Your Appointment has been rejected.<br> ';
                    // Body += '<br>Kindly keep mind to attend the appointment.<br>';
                    Body += '<br> Kind Regards, <br> <br>The CEO. <br> ';

                    EmailMess.Create(Recepient, Subject, Body, true);
                    Email.Send(EmailMess, EmailScen::Default);
                    // CustomFunc.CreateEvent(Rec);
                    Rec."Appointment Status" := Rec."Appointment Status"::Rejected;
                    Message('You have Rejected the Appointment');
                    CurrPage.Close();
                end;
            }
            action("Reschedule Booking")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Image = BookingsLogo;
                Caption = '&Reschedule Appointment';
                ToolTip = 'Executes the &Reschedule Appointment action.';

                trigger OnAction()
                begin
                    Rec.TestField(Rec."Rescheduled Date");
                    Emp.Get(Rec."Requested by Employee No");
                    if Emp."E-Mail" = '' then
                        Error('Kindly Contact the System Administrator due to blank email for Employee %1', Emp."First Name");

                    Recepient := Emp."E-Mail";

                    Subject := 'Booking for an Appointment';
                    Body += 'Dear ' + Emp."First Name" + ' ,';
                    // Body += '<br>I am currently booking for an appointment at this date and time' + Rec."Appointment Date" + '.';
                    Body += '<br> Your Appointment has been rescheduled to %1' + Format(Rec."Rescheduled Date");
                    // Body += '<br>Kindly keep mind to attend the appointment.<br>';
                    Body += '<br> Kind Regards, <br> <br>The CEO. <br> ';

                    EmailMess.Create(Recepient, Subject, Body, true);
                    Email.Send(EmailMess, EmailScen::Default);
                    Message('You have Rescheduled the Appointment');
                    Rec."Appointment Status" := Rec."Appointment Status"::Rescheduled;
                    CurrPage.Close();
                    // CustomFunc.CreateEvent(Rec);
                end;
            }

        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if Rec."CEO No" = '' then begin
            Emp.Reset();
            Emp.SetRange(CEO, true);
            if Emp.Find('-') then begin
                Rec."CEO No" := Emp."No.";
                Rec."CEO Email" := Emp."E-Mail";
            end
        end;
        UserSet.Get(UserId);
        if Rec."Requested By Employee No" = '' then begin
            Rec."Requested By Employee No" := UserSet."Employee No.";
            Rec."Requested by Employee Name" := UserSet."Employee Name";
        end
    end;

    trigger OnAfterGetRecord()
    begin
        UserSet.Get(UserId);
        Rec."Requested by Employee No" := UserSet."Employee No.";
        Rec."Requested by Employee Name" := UserSet."Employee Name";
        if Rec."Requested By Employee No" = '' then begin
            Rec."Requested By Employee No" := UserSet."Employee No.";
            Rec."Requested By Employee Name" := UserSet."Employee Name";
        end
    end;

    // trigger OnOpenPage()
    // var
    // TypeHelper: Codeunit "Type Helper";
    // TimeZoneOffset: Duration;
    // UTCDateTime: DateTime;
    // LocalDateTime: DateTime;
    // Msg: Label 'UTC is %1.\Timezone Offset: %2\Local Datetime is %3';
    // begin
    //     LocalDateTime := CurrentDateTime;
    //     if not TypeHelper.GetUserTimezoneOffset(TimezoneOffset) then
    //         TimezoneOffset := 0;
    //         UTCDateTime := LocalDateTime - TimeZoneOffset;
    //         Message(Msg, UTCDateTime, TimezoneOffset, LocalDateTime);
        
    // end;
    trigger OnOpenPage();
    var
        LocalDateTime: DateTime;
        UTC: Text;
        Msg: Label 'Local Datetime is %1.\UTC is %2.';
    begin
        LocalDateTime := CurrentDateTime;
        UTC := Format(CurrentDateTime, 0, 9);
        Message(Msg, LocalDateTime, UTC);
    end;

    var
        Email: Codeunit Email;
        EmailMess: Codeunit "Email Message";
        EmailScen: Enum "Email Scenario";
        Emp: Record Employee;
        Recepient, Subject, Body : Text;
        CustomFunc: Codeunit "Custom Function";
        UserSet: Record "User Setup";
}
