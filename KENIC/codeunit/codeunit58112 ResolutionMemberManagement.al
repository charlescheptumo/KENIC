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
            'Action Required: Vote on Circular Resolution – %1',
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

                if EBoardSetup."Reminder Frequency (Days)" > 0 then
                    Body += StrSubstNo(
                        '<i>Automatic reminders will be sent every %1 day(s) until you vote.</i><br><br>',
                        EBoardSetup."Reminder Frequency (Days)");

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


        // Create FOR option
        ResolutionOption.Init();
        ResolutionOption."Resolution No." := ResolutionNo;
        ResolutionOption."Option Code" := 'FOR';
        ResolutionOption."Option Description" := 'For';
        ResolutionOption."Display Order" := 1;
        ResolutionOption.Insert();


        // Create AGAINST option
        ResolutionOption.Init();
        ResolutionOption."Resolution No." := ResolutionNo;
        ResolutionOption."Option Code" := 'AGAINST';
        ResolutionOption."Option Description" := 'Against';
        ResolutionOption."Display Order" := 2;
        ResolutionOption.Insert();


        // Create ABSTAIN option
        ResolutionOption.Init();
        ResolutionOption."Resolution No." := ResolutionNo;
        ResolutionOption."Option Code" := 'ABSTAIN';
        ResolutionOption."Option Description" := 'Abstain';
        ResolutionOption."Display Order" := 3;
        ResolutionOption.Insert();
    end;
}