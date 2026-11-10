#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
// Portal voting logic shared by NewEboard: meeting date polls, resolution votes and
// candidate elections. Every vote records the voter's device (browser, OS, device type, IP).
codeunit 58179 "Board Voting Mgt."
{
    procedure CastMeetingDateVote(MeetingPlanId: Code[20]; OptionId: Integer; MemberNo: Code[20]; IpAddress: Text; Browser: Text; OperatingSystem: Text; DeviceType: Text; UserAgent: Text): Text
    var
        MeetingPlan: Record "Meeting Plans";
        DatePoll: Record "Meeting Date Polls";
        Enforcer: Codeunit "Resolution Deadline Enforcer";
    begin
        Enforcer.CloseOverdueMeetingPlans();

        if not MeetingPlan.Get(MeetingPlanId) then
            exit('danger*Meeting plan not found');

        if MeetingPlan."Voting Status" <> MeetingPlan."Voting Status"::Open then
            exit('danger*Voting is closed for this meeting plan');

        DatePoll.SetRange("Meeting Plan Id", MeetingPlanId);
        DatePoll.SetRange("Meeting Date Option Id", OptionId);
        DatePoll.SetRange("Member No.", MemberNo);
        if not DatePoll.FindFirst() then
            exit('danger*You are not eligible to vote on this option');

        DatePoll.Validate("Has Voted", true);
        DatePoll."IP Address" := CopyStr(IpAddress, 1, MaxStrLen(DatePoll."IP Address"));
        DatePoll.Browser := CopyStr(Browser, 1, MaxStrLen(DatePoll.Browser));
        DatePoll."Operating System" := CopyStr(OperatingSystem, 1, MaxStrLen(DatePoll."Operating System"));
        DatePoll."Device Type" := CopyStr(DeviceType, 1, MaxStrLen(DatePoll."Device Type"));
        DatePoll."User Agent" := CopyStr(UserAgent, 1, MaxStrLen(DatePoll."User Agent"));
        if not DatePoll.Modify(true) then
            exit('danger*Could not save your vote');

        exit('success*Your vote has been recorded');
    end;

    procedure RemoveMeetingDateVote(MeetingPlanId: Code[20]; OptionId: Integer; MemberNo: Code[20]): Text
    var
        MeetingPlan: Record "Meeting Plans";
        DatePoll: Record "Meeting Date Polls";
        Enforcer: Codeunit "Resolution Deadline Enforcer";
    begin
        Enforcer.CloseOverdueMeetingPlans();

        if not MeetingPlan.Get(MeetingPlanId) then
            exit('danger*Meeting plan not found');

        if MeetingPlan."Voting Status" <> MeetingPlan."Voting Status"::Open then
            exit('danger*Voting is closed for this meeting plan');

        DatePoll.SetRange("Meeting Plan Id", MeetingPlanId);
        DatePoll.SetRange("Meeting Date Option Id", OptionId);
        DatePoll.SetRange("Member No.", MemberNo);
        if not DatePoll.FindFirst() then
            exit('danger*Vote record not found');

        DatePoll.Validate("Has Voted", false);
        if not DatePoll.Modify(true) then
            exit('danger*Could not remove your vote');

        exit('success*Your vote has been removed');
    end;

    procedure CastResolutionVote(ResolutionNo: Code[20]; MemberNo: Code[50]; VoteNo: Integer; IpAddress: Text; Browser: Text; OperatingSystem: Text; DeviceType: Text; UserAgent: Text): Text
    var
        Resolution: Record "Meeting Resolutions";
        ResolutionVote: Record "Resolution Votes";
        Enforcer: Codeunit "Resolution Deadline Enforcer";
    begin
        Enforcer.CloseOverdueResolutions();

        if not Resolution.Get(ResolutionNo) then
            exit('danger*Resolution not found');

        if Resolution.IsCandidateElection() then
            exit('danger*This is a candidate election. Please choose your candidate(s) on the ballot.');

        if Resolution."Voting Status" <> Resolution."Voting Status"::Open then
            exit('danger*Voting is closed for this resolution');

        if not ResolutionVote.Get(ResolutionNo, MemberNo) then
            exit('danger*You are not eligible to vote on this resolution');

        if (VoteNo < 1) or (VoteNo > 3) then
            exit('danger*Please choose For, Against or Abstain');

        ResolutionVote.Validate(Vote, VoteNo);
        SetResolutionVoteDevice(ResolutionVote, IpAddress, Browser, OperatingSystem, DeviceType, UserAgent);
        if not ResolutionVote.Modify(true) then
            exit('danger*Could not save your vote');

        exit('success*Your vote has been recorded');
    end;

    procedure CastElectionVote(ResolutionNo: Code[20]; MemberNo: Code[50]; CandidateLineNos: Text; IpAddress: Text; Browser: Text; OperatingSystem: Text; DeviceType: Text; UserAgent: Text): Text
    var
        Resolution: Record "Meeting Resolutions";
        ResolutionVote: Record "Resolution Votes";
        Candidate: Record "Resolution Candidates";
        Ballot: Record "Election Ballots";
        Enforcer: Codeunit "Resolution Deadline Enforcer";
        Choices: List of [Integer];
        Parts: List of [Text];
        Part: Text;
        LineNo: Integer;
        VotedAt: DateTime;
    begin
        Enforcer.CloseOverdueResolutions();

        if not Resolution.Get(ResolutionNo) then
            exit('danger*Election not found');

        if not Resolution.IsCandidateElection() then
            exit('danger*This resolution is not a candidate election');

        if Resolution."Voting Status" <> Resolution."Voting Status"::Open then
            exit('danger*Voting is closed for this election');

        if not ResolutionVote.Get(ResolutionNo, MemberNo) then
            exit('danger*You are not eligible to vote in this election');

        Parts := CandidateLineNos.Split(',');
        foreach Part in Parts do
            if DelChr(Part, '<>', ' ') <> '' then begin
                if not Evaluate(LineNo, DelChr(Part, '<>', ' ')) then
                    exit('danger*Invalid candidate selected');
                if not Candidate.Get(ResolutionNo, LineNo) then
                    exit('danger*Invalid candidate selected');
                if not Choices.Contains(LineNo) then
                    Choices.Add(LineNo);
            end;

        if Choices.Count() = 0 then
            exit('danger*Please choose a candidate');

        if Choices.Count() > Resolution.GetSeats() then
            exit(StrSubstNo('danger*You can choose at most %1 candidate(s)', Resolution.GetSeats()));

        // Replace any earlier ballot from this member (members may change their vote while voting is open)
        Ballot.SetRange("Resolution No.", ResolutionNo);
        Ballot.SetRange("Member No.", MemberNo);
        if not Ballot.IsEmpty() then
            Ballot.DeleteAll();

        VotedAt := CurrentDateTime();
        foreach LineNo in Choices do begin
            Clear(Ballot);
            Ballot."Resolution No." := ResolutionNo;
            Ballot."Member No." := MemberNo;
            Ballot."Candidate Line No." := LineNo;
            Ballot."Voted At" := VotedAt;
            Ballot.Insert();
        end;

        ResolutionVote."Election Voted" := true;
        ResolutionVote."Voted At" := VotedAt;
        SetResolutionVoteDevice(ResolutionVote, IpAddress, Browser, OperatingSystem, DeviceType, UserAgent);
        ResolutionVote.Modify(true);

        exit('success*Your ballot has been recorded');
    end;

    // Rows: LineNo*Name*Profile*Votes(or Hidden)*Elected(Yes/No)*MyChoice(Yes/No)::::
    procedure GetCandidates(ResolutionNo: Code[20]; MemberNo: Code[50]) Result: Text
    var
        Resolution: Record "Meeting Resolutions";
        Candidate: Record "Resolution Candidates";
        Ballot: Record "Election Ballots";
        VotesTxt: Text;
    begin
        if not Resolution.Get(ResolutionNo) then
            exit('');

        Candidate.SetRange("Resolution No.", ResolutionNo);
        if Candidate.FindSet() then
            repeat
                Candidate.CalcFields("Vote Count");
                if Resolution."Hide Vote Count" then
                    VotesTxt := 'Hidden'
                else
                    VotesTxt := Format(Candidate."Vote Count");

                Result += Format(Candidate."Line No.") + '*' + Clean(Candidate."Candidate Name") + '*' + Clean(Candidate.Profile) + '*' +
                          VotesTxt + '*' + YesNo(Candidate.Elected) + '*' +
                          YesNo(Ballot.Get(ResolutionNo, MemberNo, Candidate."Line No.")) + '::::';
            until Candidate.Next() = 0;
    end;

    // success*IsElection*Seats*HideVoteCount*DeadlineUtc*ElectedCandidates*BallotsCast*IHaveVoted*Eligible
    procedure GetResolutionVotingInfo(ResolutionNo: Code[20]; MemberNo: Code[50]): Text
    var
        Resolution: Record "Meeting Resolutions";
        ResolutionVote: Record "Resolution Votes";
        Enforcer: Codeunit "Resolution Deadline Enforcer";
        BallotsTxt: Text;
        Eligible: Boolean;
        HasVoted: Boolean;
    begin
        Enforcer.CloseOverdueResolutions();

        if not Resolution.Get(ResolutionNo) then
            exit('danger*Resolution not found');

        Resolution.CalcFields("Ballots Cast");
        if Resolution."Hide Vote Count" then
            BallotsTxt := 'Hidden'
        else
            BallotsTxt := Format(Resolution."Ballots Cast");

        Eligible := ResolutionVote.Get(ResolutionNo, MemberNo);
        if Eligible then
            HasVoted := ResolutionVote."Election Voted" or (ResolutionVote.Vote <> ResolutionVote.Vote::" ");

        exit('success*' + YesNo(Resolution.IsCandidateElection()) + '*' + Format(Resolution.GetSeats()) + '*' +
             YesNo(Resolution."Hide Vote Count") + '*' + FormatUtc(Resolution."Voting Deadline") + '*' +
             Clean(Resolution."Elected Candidates") + '*' + BallotsTxt + '*' + YesNo(HasVoted) + '*' + YesNo(Eligible));
    end;

    procedure SetResolutionVoteDevice(var ResolutionVote: Record "Resolution Votes"; IpAddress: Text; Browser: Text; OperatingSystem: Text; DeviceType: Text; UserAgent: Text)
    begin
        ResolutionVote."IP Address" := CopyStr(IpAddress, 1, MaxStrLen(ResolutionVote."IP Address"));
        ResolutionVote.Browser := CopyStr(Browser, 1, MaxStrLen(ResolutionVote.Browser));
        ResolutionVote."Operating System" := CopyStr(OperatingSystem, 1, MaxStrLen(ResolutionVote."Operating System"));
        ResolutionVote."Device Type" := CopyStr(DeviceType, 1, MaxStrLen(ResolutionVote."Device Type"));
        ResolutionVote."User Agent" := CopyStr(UserAgent, 1, MaxStrLen(ResolutionVote."User Agent"));
    end;

    procedure FormatUtc(Value: DateTime): Text
    begin
        if Value = 0DT then
            exit('');
        exit(Format(Value, 0, 9));
    end;

    procedure YesNo(Value: Boolean): Text
    begin
        if Value then
            exit('Yes');
        exit('No');
    end;

    procedure Clean(Value: Text): Text
    var
        Result: Text;
    begin
        Result := DelChr(Value, '=', '*');
        exit(Result.Replace('::::', ' '));
    end;
}
