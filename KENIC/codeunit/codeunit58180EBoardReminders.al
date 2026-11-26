namespace KENIC.KENIC;

using System.Email;
using Microsoft.Foundation.Company;

// Sends reminder emails one day ahead of:
//   - a meeting plan's poll deadline (to members who have not voted yet)
//   - a published board/committee meeting (date, time, venue and online link to attendees)
//   - an e-signature document's signing deadline (to signatories who have not signed yet)
// Run from a Job Queue Entry (Object Type = Codeunit, Object ID = 58180), recurring every hour.
codeunit 58180 "E-Board Reminders"
{
    trigger OnRun()
    begin
        SendPollClosingReminders();
        SendMeetingReminders();
        SendSigningReminders();
    end;

    procedure SendPollClosingReminders()
    var
        MeetingPlan: Record "Meeting Plans";
        Poll: Record "Meeting Date Polls";
        Voted: Record "Meeting Date Polls";
        Reminded: List of [Code[20]];
        Subject: Text;
        Body: Text;
    begin
        LoadSetup();
        MeetingPlan.SetRange("Voting Status", MeetingPlan."Voting Status"::Open);
        MeetingPlan.SetRange("Send Poll Reminder", true);
        MeetingPlan.SetRange("Poll Reminder Sent", false);
        MeetingPlan.SetFilter("Poll Deadline", '>%1&<=%2', CurrentDateTime(), CurrentDateTime() + OneDayMs());
        if MeetingPlan.FindSet(true) then
            repeat
                Clear(Reminded);
                Subject := StrSubstNo('Reminder: Meeting date poll closes on %1 - %2', Format(MeetingPlan."Poll Deadline"), MeetingPlan.Title);

                Poll.SetRange("Meeting Plan Id", MeetingPlan."Id");
                if Poll.FindSet() then
                    repeat
                        if not Reminded.Contains(Poll."Member No.") then begin
                            Reminded.Add(Poll."Member No.");

                            Voted.SetRange("Meeting Plan Id", MeetingPlan."Id");
                            Voted.SetRange("Member No.", Poll."Member No.");
                            Voted.SetRange("Has Voted", true);
                            if Voted.IsEmpty() then begin
                                Body := StrSubstNo('Dear %1,<br><br>', Poll."Member Name");
                                Body += StrSubstNo('This is a reminder that the poll to choose the meeting date for <b>%1</b> closes on <b>%2</b>.<br><br>',
                                    MeetingPlan.Title, Format(MeetingPlan."Poll Deadline"));
                                Body += 'You have not voted yet. Please log in to the E-Board Portal and vote on your preferred date and meeting mode.<br><br>';
                                Body += PortalButton('Vote on Meeting Date');
                                Body += Signature();
                                SendToMember(Poll."Member No.", Subject, Body);
                            end;
                        end;
                    until Poll.Next() = 0;

                MeetingPlan."Poll Reminder Sent" := true;
                MeetingPlan.Modify();
            until MeetingPlan.Next() = 0;
    end;

    procedure SendMeetingReminders()
    var
        Meeting: Record "Board Meetings";
        Attendee: Record "Board Meeting Attendance";
        StartAt: DateTime;
        Subject: Text;
        Body: Text;
    begin
        LoadSetup();
        Meeting.SetRange(Published, true);
        Meeting.SetRange(Closed, false);
        Meeting.SetRange("Send Meeting Reminder", true);
        Meeting.SetRange("Meeting Reminder Sent", false);
        Meeting.SetRange("Start date", Today(), Today() + 1);
        if Meeting.FindSet(true) then
            repeat
                StartAt := CreateDateTime(Meeting."Start date", Meeting."Start time");
                if (StartAt > CurrentDateTime()) and (StartAt <= CurrentDateTime() + OneDayMs()) then begin
                    Subject := StrSubstNo('Meeting reminder: %1 on %2 at %3', MeetingName(Meeting), Format(Meeting."Start date"), Format(Meeting."Start time"));

                    Attendee.SetRange("Meeting Code", Meeting.No);
                    if Attendee.FindSet() then
                        repeat
                            Body := StrSubstNo('Dear %1,<br><br>', Attendee."Member Name");
                            Body += 'This is a reminder of the upcoming meeting:<br><br>';
                            Body += '<b>Meeting:</b> ' + MeetingName(Meeting) + '<br>';
                            Body += '<b>Date:</b> ' + Format(Meeting."Start date") + '<br>';
                            Body += '<b>Time:</b> ' + Format(Meeting."Start time");
                            if Meeting."End time" <> 0T then
                                Body += ' - ' + Format(Meeting."End time");
                            Body += '<br>';
                            if Meeting."Venue/Location" <> '' then
                                Body += '<b>Venue:</b> ' + Meeting."Venue/Location" + '<br>';
                            if Meeting."Online Meeting Link" <> '' then
                                Body += StrSubstNo('<b>Online link:</b> <a href="%1">%1</a><br>', Meeting."Online Meeting Link");
                            Body += '<br>' + PortalButton('Open E-Board Portal');
                            Body += Signature();

                            if Attendee."E-mail" <> '' then
                                SendTo(Attendee."E-mail", Subject, Body)
                            else
                                SendToMember(Attendee."Member No", Subject, Body);
                        until Attendee.Next() = 0;

                    Meeting."Meeting Reminder Sent" := true;
                    Meeting.Modify();
                end;
            until Meeting.Next() = 0;
    end;

    procedure SendSigningReminders()
    var
        SignHeader: Record "ESign Header";
        SignLine: Record "ESign Line";
        Subject: Text;
        Body: Text;
    begin
        LoadSetup();
        SignHeader.SetRange(Posted, true);
        SignHeader.SetRange(Status, SignHeader.Status::Posted);
        SignHeader.SetRange("Send Signing Reminder", true);
        SignHeader.SetFilter("Signing Deadline", '>%1&<=%2', CurrentDateTime(), CurrentDateTime() + OneDayMs());
        if SignHeader.FindSet() then
            repeat
                Subject := StrSubstNo('Reminder: Please sign %1 by %2', SignHeader.Title, Format(SignHeader."Signing Deadline"));

                SignLine.SetRange("Document No.", SignHeader."No.");
                SignLine.SetRange(Status, SignLine.Status::Pending);
                SignLine.SetRange("Reminder Sent", false);
                SignLine.SetFilter(Email, '<>%1', '');
                if SignLine.FindSet(true) then
                    repeat
                        Body := StrSubstNo('Dear %1,<br><br>', SignLine."Board Member Name");
                        Body += StrSubstNo('This is a reminder that document <b>%1 - %2</b> is still awaiting your electronic signature.<br><br>',
                            SignHeader."No.", SignHeader.Title);
                        Body += '<b>Signing deadline:</b> ' + Format(SignHeader."Signing Deadline") + '<br><br>';
                        Body += PortalButton('Log In to E-Board Portal & Sign');
                        Body += Signature();

                        if SendTo(SignLine.Email, Subject, Body) then begin
                            SignLine."Reminder Sent" := true;
                            SignLine.Modify();
                        end;
                    until SignLine.Next() = 0;
            until SignHeader.Next() = 0;
    end;

    local procedure SendToMember(MemberNo: Code[50]; Subject: Text; Body: Text): Boolean
    var
        BoardMember: Record "Board Members";
    begin
        BoardMember.SetRange("Personal No", MemberNo);
        if not BoardMember.FindFirst() then
            exit(false);
        if BoardMember."Company E-Mail" <> '' then
            exit(SendTo(BoardMember."Company E-Mail", Subject, Body));
        if BoardMember."E-Mail" <> '' then
            exit(SendTo(BoardMember."E-Mail", Subject, Body));
        exit(false);
    end;

    local procedure SendTo(Recipient: Text; Subject: Text; Body: Text): Boolean
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        if Recipient = '' then
            exit(false);
        EmailMessage.Create(Recipient, Subject, Body, true);
        exit(Email.Send(EmailMessage, Enum::"Email Scenario"::Default));
    end;

    local procedure MeetingName(Meeting: Record "Board Meetings"): Text
    begin
        if Meeting.Title <> '' then
            exit(Meeting.Title);
        if Meeting.Description <> '' then
            exit(Meeting.Description);
        exit(Meeting.No);
    end;

    local procedure PortalButton(Caption: Text): Text
    begin
        if EBoardSetup."E-Board Portal URL" = '' then
            exit('');
        exit(StrSubstNo('<a href="%1" style="display:inline-block;padding:10px 20px;background:#0078d4;color:#ffffff;text-decoration:none;border-radius:4px;">%2</a><br><br>',
            EBoardSetup."E-Board Portal URL", Caption));
    end;

    local procedure Signature(): Text
    begin
        exit('Regards,<br>' + CompanyInfo.Name + '<br><br><i>This is a system-generated email. Please do not reply.</i>');
    end;

    local procedure LoadSetup()
    begin
        if SetupLoaded then
            exit;
        CompanyInfo.Get();
        EBoardSetup.GetRecordOnce();
        SetupLoaded := true;
    end;

    local procedure OneDayMs(): Duration
    var
        OneDay: Duration;
    begin
        OneDay := 86400000; // 24 hours in milliseconds
        exit(OneDay);
    end;

    var
        CompanyInfo: Record "Company Information";
        EBoardSetup: Record "E-Board Setup";
        SetupLoaded: Boolean;
}
