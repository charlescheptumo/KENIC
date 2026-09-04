namespace KICD.KICD;

using System.Email;

codeunit 50044 "Teams Meeting Integration"
{
    trigger OnRun()
    begin
    end;


    procedure CreateTeamsOnlineMeeting(Subject: Text; StartDateTime: DateTime; EndDateTime: DateTime) JoinUrl: Text
    var
        Graph: Record "Microsoft Graphs";
        CustomFunc: Codeunit "Custom Function";
        Client: HttpClient;
        Contents: HttpContent;
        Headers: HttpHeaders;
        ResponseMessage: HttpResponseMessage;
        JsonPayload: JsonObject;
        ResultObj: JsonObject;
        ResultJtoken: JsonToken;
        ContentText: Text;
        Response: Text;
        Token: Text;
        Url: Text;
    begin
        Graph.Reset();
        Graph.SetRange(Type, Graph.Type::Graph);
        if not Graph.FindFirst() then
            Error(GraphSetupMissingErr);
        if Graph."Microsoft Graph UserId" = '' then
            Error(GraphSetupMissingErr);

        Token := CustomFunc.GetAccessToken();

        Clear(JsonPayload);
        JsonPayload.Add('startDateTime', Format(StartDateTime, 0, DateTimeFormatTxt));
        JsonPayload.Add('endDateTime', Format(EndDateTime, 0, DateTimeFormatTxt));
        JsonPayload.Add('subject', Subject);
        JsonPayload.WriteTo(ContentText);

        Contents.Clear();
        Contents.WriteFrom(ContentText);
        Contents.GetHeaders(Headers);
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'application/json');

        Url := StrSubstNo(OnlineMeetingsUrlTxt, Graph."Microsoft Graph UserId");

        Client.Clear();
        Client.DefaultRequestHeaders.Add('Authorization', 'Bearer ' + Token);

        if not Client.Post(Url, Contents, ResponseMessage) then
            Error(RequestFailedErr);
        ResponseMessage.Content.ReadAs(Response);
        if not ResponseMessage.IsSuccessStatusCode then
            Error(Response);

        Clear(ResultObj);
        ResultObj.ReadFrom(Response);
        ResultObj.Get('joinUrl', ResultJtoken);
        JoinUrl := ResultJtoken.AsValue().AsText();
    end;

    procedure SendTeamsMeetingInvite(ToEmail: Text; ToName: Text; Subject: Text; JoinUrl: Text; StartDateTime: DateTime; EndDateTime: DateTime)
    var
        EmailMess: Codeunit "Email Message";
        Email: Codeunit Email;
        EmailScen: Enum "Email Scenario";
        Body: Text;
    begin
        if ToEmail = '' then
            exit;

        Body += StrSubstNo('Dear %1,<br><br>', ToName);
        Body += StrSubstNo('You have been invited to a Microsoft Teams meeting: <b>%1</b>.<br><br>', Subject);
        Body += StrSubstNo('When: %1 - %2<br><br>', Format(StartDateTime), Format(EndDateTime));
        Body += StrSubstNo('<a href="%1">Click here to join the Teams meeting</a><br><br>', JoinUrl);
        Body += 'Kind Regards,<br>KENIC';

        EmailMess.Create(ToEmail, Subject, Body, true);
        Email.Send(EmailMess, EmailScen::Default);
    end;


    procedure CreateTeamsMeetingForUsers(Subject: Text; StartDateTime: DateTime; EndDateTime: DateTime; Recipients: Dictionary of [Text, Text]) JoinUrl: Text
    var
        RecipientEmails: List of [Text];
        RecipientEmail: Text;
    begin
        if Recipients.Count = 0 then
            Error(NoRecipientsSelectedErr);

        JoinUrl := CreateTeamsOnlineMeeting(Subject, StartDateTime, EndDateTime);

        RecipientEmails := Recipients.Keys();
        foreach RecipientEmail in RecipientEmails do
            SendTeamsMeetingInvite(RecipientEmail, Recipients.Get(RecipientEmail), Subject, JoinUrl, StartDateTime, EndDateTime);

        Message(TeamsMeetingSentMsg, Recipients.Count);
    end;

    var
        DateTimeFormatTxt: Label '<Year4>-<Month,2>-<Day,2>T<Hours24,2>:<Minutes,2>:<Seconds,2>', Locked = true;
        OnlineMeetingsUrlTxt: Label 'https://graph.microsoft.com/v1.0/users/%1/onlineMeetings', Comment = '%1 = Microsoft Graph UserId of the organizer', Locked = true;
        GraphSetupMissingErr: Label 'The Microsoft Graph setup (Type = Graph) is missing the organizer''s Microsoft Graph UserId.';
        RequestFailedErr: Label 'Could not reach the Microsoft Graph onlineMeetings endpoint.';
        NoRecipientsSelectedErr: Label 'Select at least one user to send the Teams meeting link to.';
        TeamsMeetingSentMsg: Label 'Teams meeting created and sent to %1 user(s).', Comment = '%1 = number of recipients';
}
