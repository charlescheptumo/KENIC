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
        ResolutionOption.Insert(true);


        // Create AGAINST option
        ResolutionOption.Init();
        ResolutionOption."Resolution No." := ResolutionNo;
        ResolutionOption."Option Code" := 'AGAINST';
        ResolutionOption."Option Description" := 'Against';
        ResolutionOption."Display Order" := 2;
        ResolutionOption.Insert(true);


        // Create ABSTAIN option
        ResolutionOption.Init();
        ResolutionOption."Resolution No." := ResolutionNo;
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

    //Portal
   procedure SubmitVote(ResolutionNo: Code[20]; EmployeeNo: Code[20]; SelectedOption: Integer; Remarks: Text[250])
var
    VoteLine: Record "Circular Resolution lines";
    ResolutionHeader: Record "Circular Resolution Header";
    ResolutionOption: Record "Circular Resolution Option";
begin
   
    if not ResolutionHeader.Get(ResolutionNo) then
        Error('Circular Resolution %1 was not found.', ResolutionNo);


    if not ResolutionHeader.Posted then
        Error('This Circular Resolution has not been posted for voting.');

    
    ResolutionHeader.UpdateStatusBasedOnDeadline();

    
    ResolutionHeader.Get(ResolutionNo);

    
    if ResolutionHeader.Status <> ResolutionHeader.Status::Voting then
        Error('Voting is not available for this Circular Resolution.');

   
    if ResolutionHeader."Approval Status" <> ResolutionHeader."Approval Status"::Released then
        Error('This Circular Resolution has not been released for voting.');

    
    ResolutionOption.SetRange("Resolution No.", ResolutionNo);
    ResolutionOption.SetRange("Line No.", SelectedOption);
    if not ResolutionOption.FindFirst() then
        Error('Invalid voting option selected.');

    
    VoteLine.SetRange("Resolution No.", ResolutionNo);
    VoteLine.SetRange("Employee No.", EmployeeNo);

    if not VoteLine.FindFirst() then
        Error('You are not an authorized member for this Circular Resolution.');

    
    if VoteLine."Vote Status" = VoteLine."Vote Status"::Voted then
        Error('You have already submitted your vote.');

    
    VoteLine.Validate("Selected Option Line No.", SelectedOption);
    VoteLine.Remarks := Remarks;
    VoteLine.Modify(true);

    
    UpdateWinningOption(ResolutionHeader);
end;
}