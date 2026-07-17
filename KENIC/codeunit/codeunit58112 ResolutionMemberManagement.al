namespace KENIC.KENIC;

using System.Email;
using Microsoft.Foundation.Company;
using System.Security.User;

codeunit 50048 "Resolution Management"
{
    var
        EBoardSetup: Record "E-Board Setup";
        CompanyInfo: Record "Company Information";

    procedure NotifyMembersToVote(CircularResolution: Record "Circular Resolution Header")
    var
        ResolutionLine: Record "Circular Resolution lines";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Subject: Text;
        Body: Text;
        DisplayDeadline: Text;
    begin

        if (not CircularResolution.Posted) or (CircularResolution.Status <> CircularResolution.Status::Voting) then
            exit;

        CompanyInfo.Get();
        GetEBoardSetup(EBoardSetup);

        if CircularResolution."Voting Deadline" <> 0DT then
            DisplayDeadline := Format(CircularResolution."Voting Deadline")
        else
            DisplayDeadline := 'Not Set';

        Subject := StrSubstNo(
            'Vote on Circular Resolution – %1',
            CircularResolution."No.");

        ResolutionLine.Reset();
        ResolutionLine.SetRange("Resolution No.", CircularResolution."No.");

        ResolutionLine.SetFilter("Email", '<>%1', '');
        ResolutionLine.SetRange("Notification Sent", false);

        if ResolutionLine.FindSet(true) then
            repeat
                Body := StrSubstNo('Dear %1,<br><br>', ResolutionLine."Employee Name");
                Body += StrSubstNo(
                    'Circular Resolution <b>%1</b> has been formally posted and is now open for voting.<br><br>',
                    CircularResolution."No.");

                Body += '<b>Subject:</b> ' + CircularResolution.Title + '<br>';
                Body += '<b>Date Opened:</b> ' + Format(Today()) + '<br>';
                Body += '<b>Voting Deadline:</b> <b>' + DisplayDeadline + '</b><br>';

                if EBoardSetup."E-Board Portal URL" <> '' then begin
                    Body += '<br>Please log in to the E-Board Portal to cast your vote.<br><br>';
                    Body += StrSubstNo(
                        '<a href="%1" style="display:inline-block;padding:10px 20px;background:#0078d4;color:#ffffff;text-decoration:none;border-radius:4px;">Access E-Board Portal</a><br><br>',
                        EBoardSetup."E-Board Portal URL");
                end;

                Body += 'Regards,<br>';
                Body += CompanyInfo.Name + '<br><br>';
                Body += '<i>This is a system-generated email. Please do not reply.</i>';

                Clear(EmailMessage);
                EmailMessage.Create(
                    ResolutionLine.Email,
                    Subject,
                    Body,
                    true);

                if Email.Send(EmailMessage, Enum::"Email Scenario"::Default) then begin
                    ResolutionLine."Notification Sent" := true;
                    ResolutionLine."Notification DateTime" := CurrentDateTime;
                    ResolutionLine.Modify(true);
                end;

            until ResolutionLine.Next() = 0;
    end;

    procedure GetUserEmail(UserID: Code[100]): Text
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.SetRange("User ID", UserID);
        if UserSetup.FindFirst() then
            exit(UserSetup."E-Mail");
    end;

    local procedure GetEBoardSetup(var Setup: Record "E-Board Setup")
    begin
        Setup.GetRecordOnce();
    end;

    //Voting options
    procedure CreateDefaultVotingOptions(ResolutionNo: Code[20])
    var
        ResolutionOption: Record "Circular Resolution Option";
    begin
        ResolutionOption.SetRange("Resolution No.", ResolutionNo);

        if not ResolutionOption.IsEmpty() then
            exit;

        // FOR
        ResolutionOption.Init();
        ResolutionOption."Resolution No." := ResolutionNo;
        ResolutionOption."Line No." := 1;
        ResolutionOption."Option Code" := 'FOR';
        ResolutionOption."Option Description" := 'For';
        ResolutionOption."Display Order" := 1;
        ResolutionOption.Insert(true);

        // AGAINST
        ResolutionOption.Init();
        ResolutionOption."Resolution No." := ResolutionNo;
        ResolutionOption."Line No." := 2;
        ResolutionOption."Option Code" := 'AGAINST';
        ResolutionOption."Option Description" := 'Against';
        ResolutionOption."Display Order" := 2;
        ResolutionOption.Insert(true);

        // ABSTAIN
        ResolutionOption.Init();
        ResolutionOption."Resolution No." := ResolutionNo;
        ResolutionOption."Line No." := 3;
        ResolutionOption."Option Code" := 'ABSTAIN';
        ResolutionOption."Option Description" := 'Abstain';
        ResolutionOption."Display Order" := 3;
        ResolutionOption.Insert(true);
    end;

    //Highest Winning option
    procedure UpdateWinningOption(var ResolutionHeader: Record "Circular Resolution Header")
    var
        ResolutionOption: Record "Circular Resolution Option";
        HighestVotes: Integer;
        WinningOption: Code[20];
        Tie: Boolean;
    begin
        HighestVotes := -1;
        WinningOption := '';
        Tie := false;

        ResolutionOption.SetRange("Resolution No.", ResolutionHeader."No.");

        if ResolutionOption.FindSet() then
            repeat
                ResolutionOption.CalcFields("Vote Count");

                if ResolutionOption."Vote Count" > HighestVotes then begin
                    HighestVotes := ResolutionOption."Vote Count";
                    WinningOption := ResolutionOption."Option Code";
                    Tie := false;
                end else
                    if ResolutionOption."Vote Count" = HighestVotes then
                        Tie := true;
            until ResolutionOption.Next() = 0;

        if Tie then
            WinningOption := '';

        if ResolutionHeader."Winning Option" <> WinningOption then begin
            ResolutionHeader."Winning Option" := WinningOption;
            ResolutionHeader.Modify(true);
        end;
    end;

    //Portal Guide
    // procedure SubmitVote(ResolutionNo: Code[20]; EmployeeNo: Code[20]; SelectedOption: Integer; Remarks: Text[250])
    // var
    //     VoteLine: Record "Circular Resolution lines";
    //     ResolutionHeader: Record "Circular Resolution Header";
    //     ResolutionOption: Record "Circular Resolution Option";
    // begin

    //     if not ResolutionHeader.Get(ResolutionNo) then
    //         Error('Circular Resolution %1 was not found.', ResolutionNo);


    //     if not ResolutionHeader.Posted then
    //         Error('This Circular Resolution has not been posted for voting.');


    //     ResolutionHeader.UpdateStatusBasedOnDeadline();


    //     ResolutionHeader.Get(ResolutionNo);


    //     if ResolutionHeader.Status <> ResolutionHeader.Status::Voting then
    //         Error('Voting is not available for this Circular Resolution.');


    //     if ResolutionHeader."Approval Status" <> ResolutionHeader."Approval Status"::Released then
    //         Error('This Circular Resolution has not been released for voting.');


    //     ResolutionOption.SetRange("Resolution No.", ResolutionNo);
    //     ResolutionOption.SetRange("Line No.", SelectedOption);
    //     if not ResolutionOption.FindFirst() then
    //         Error('Invalid voting option selected.');


    //     VoteLine.SetRange("Resolution No.", ResolutionNo);
    //     VoteLine.SetRange("Employee No.", EmployeeNo);

    //     if not VoteLine.FindFirst() then
    //         Error('You are not an authorized member for this Circular Resolution.');


    //     if VoteLine."Vote Status" = VoteLine."Vote Status"::Voted then
    //         Error('You have already submitted your vote.');


    //     VoteLine.Validate("Selected Option Line No.", SelectedOption);
    //     VoteLine.Remarks := Remarks;
    //     VoteLine.Modify(true);


    //     UpdateWinningOption(ResolutionHeader);
    //     SendVoteConfirmation(VoteLine, ResolutionHeader);
    // end;

    procedure SendAutomatedVotingReminders()
    var
        CircularResolution: Record "Circular Resolution Header";
        ResolutionLine: Record "Circular Resolution lines";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Subject: Text;
        Body: Text;
        DisplayDeadline: Text;
        TimeUntilDeadline: Duration;
        Send24HReminder: Boolean;
        Send30MReminder: Boolean;
        AnyEmailSentSuccessfully: Boolean;
    begin
        GetEBoardSetup(EBoardSetup);

        if not EBoardSetup."Enable Reminders" then
            exit;

        CompanyInfo.Get();


        CircularResolution.Reset();
        CircularResolution.SetRange(Posted, true);
        CircularResolution.SetRange(Status, CircularResolution.Status::Voting);

        CircularResolution.SetRange("Approval Status", CircularResolution."Approval Status"::Released);
        CircularResolution.SetFilter("Voting Deadline", '>%1', CurrentDateTime());

        if CircularResolution.FindSet(true) then
            repeat
                TimeUntilDeadline := CircularResolution."Voting Deadline" - CurrentDateTime();
                Send24HReminder := false;
                Send30MReminder := false;
                AnyEmailSentSuccessfully := false;

                // Tier 1: 24-Hour Notice 
                if (TimeUntilDeadline <= 86400000) and (TimeUntilDeadline > 1800000) and (not CircularResolution."24H Reminder Sent") then begin

                    if CircularResolution."Posting Date" < Today() then begin
                        Send24HReminder := true;
                        Subject := StrSubstNo('REMINDER: Voting on Circular Resolution %1 closes in 24 Hours', CircularResolution."No.");
                    end;
                end;

                // Tier 2: 30-Minute Urgent Final Call
                if (TimeUntilDeadline <= 1800000) and (TimeUntilDeadline > 0) and (not CircularResolution."30M Reminder Sent") then begin
                    Send30MReminder := true;
                    Subject := StrSubstNo('URGENT: Final 30 Minutes to Vote on Circular Resolution %1', CircularResolution."No.");
                end;


                if Send24HReminder or Send30MReminder then begin
                    DisplayDeadline := Format(CircularResolution."Voting Deadline");

                    ResolutionLine.Reset();
                    ResolutionLine.SetRange("Resolution No.", CircularResolution."No.");
                    ResolutionLine.SetFilter("Email", '<>%1', '');

                    ResolutionLine.SetRange("Vote Status", ResolutionLine."Vote Status"::Pending);

                    if ResolutionLine.FindSet() then
                        repeat
                            Body := StrSubstNo('Dear %1,<br><br>', ResolutionLine."Employee Name");
                            Body += StrSubstNo('This is a reminder that you have a pending vote for Circular Resolution <b>%1</b>.<br><br>', CircularResolution."No.");
                            Body += '<b>Subject:</b> ' + CircularResolution.Title + '<br>';
                            Body += '<b>CLOSING DEADLINE:</b> <span style="color: #d83b01; font-weight: bold;">' + DisplayDeadline + '</span><br><br>';

                            if EBoardSetup."E-Board Portal URL" <> '' then begin
                                Body += 'Please log in to the portal immediately to submit your vote:<br><br>';
                                Body += StrSubstNo(
                                    '<a href="%1" style="display:inline-block;padding:10px 20px;background:#0078d4;color:#ffffff;text-decoration:none;border-radius:4px;font-weight:bold;">Cast Your Vote Now</a><br><br>',
                                    EBoardSetup."E-Board Portal URL");
                            end;

                            Body += 'Regards,<br>';
                            Body += CompanyInfo.Name + '<br><br>';
                            Body += '<i>This is an automated system notification. Please do not reply.</i>';

                            Clear(EmailMessage);
                            EmailMessage.Create(ResolutionLine.Email, Subject, Body, true);


                            if Email.Send(EmailMessage, Enum::"Email Scenario"::Default) then
                                AnyEmailSentSuccessfully := true;
                        until ResolutionLine.Next() = 0;


                    if AnyEmailSentSuccessfully then begin
                        if Send24HReminder then
                            CircularResolution."24H Reminder Sent" := true;
                        if Send30MReminder then
                            CircularResolution."30M Reminder Sent" := true;

                        CircularResolution.Modify(true);
                    end;
                end;
            until CircularResolution.Next() = 0;
    end;

    //Confirmation message
    procedure SendVoteConfirmation(VoteLine: Record "Circular Resolution lines"; ResolutionHeader: Record "Circular Resolution Header")
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Subject: Text;
        Body: Text;
    begin
        if VoteLine.Email = '' then
            exit;

        CompanyInfo.Get();

        Subject := StrSubstNo(
            'Vote Successfully Submitted - Circular Resolution %1',
            ResolutionHeader."No.");

        Body := StrSubstNo('Dear %1,<br><br>', VoteLine."Employee Name");
        Body += 'Your vote has been successfully submitted.<br><br>';
        Body += '<b>Resolution:</b> ' + ResolutionHeader.Title + '<br>';
        Body += '<b>Resolution No.:</b> ' + ResolutionHeader."No." + '<br>';
        Body += '<b>Submitted On:</b> ' + Format(VoteLine."Vote DateTime") + '<br><br>';
        Body += 'Thank you for participating.<br><br>';
        Body += 'Regards,<br>';
        Body += CompanyInfo.Name + '<br><br>';
        Body += '<i>This is a system-generated email. Please do not reply.</i>';

        Clear(EmailMessage);
        EmailMessage.Create(
            VoteLine.Email,
            Subject,
            Body,
            true);

        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;
}