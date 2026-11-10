#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
// Closes resolutions/elections and meeting date polls whose deadline has passed.
// Runs from the cards, from every portal voting call, and from a Job Queue Entry
// (Object Type = Codeunit, Object ID = 58171, recurring every 5 minutes).
codeunit 58171 "Resolution Deadline Enforcer"
{
    trigger OnRun()
    begin
        case CloseTarget of
            CloseTarget::Resolution:
                CloseOneResolution();
            CloseTarget::MeetingPlan:
                CloseOneMeetingPlan();
            else begin
                CloseOverdueResolutions();
                CloseOverdueMeetingPlans();
            end;
        end;
    end;

    procedure CloseOverdueVotes()
    begin
        CloseOverdueResolutions();
        CloseOverdueMeetingPlans();
    end;

    procedure CloseOverdueResolutions()
    var
        Resolution: Record "Meeting Resolutions";
        Closer: Codeunit "Resolution Deadline Enforcer";
        Overdue: List of [Code[20]];
        ResNo: Code[20];
    begin
        Resolution.SetRange("Voting Status", Resolution."Voting Status"::Open);
        Resolution.SetFilter("Voting Deadline", '>%1&<=%2', 0DT, CurrentDateTime());
        if Resolution.FindSet() then
            repeat
                Overdue.Add(Resolution."No.");
            until Resolution.Next() = 0;

        foreach ResNo in Overdue do begin
            Clear(Closer);
            Closer.SetTarget(CloseTarget::Resolution, ResNo);
            Commit();
            if Closer.Run() then;
        end;
    end;

    procedure CloseOverdueMeetingPlans()
    var
        MeetingPlan: Record "Meeting Plans";
        Closer: Codeunit "Resolution Deadline Enforcer";
        Overdue: List of [Code[20]];
        PlanId: Code[20];
    begin
        MeetingPlan.SetRange("Voting Status", MeetingPlan."Voting Status"::Open);
        MeetingPlan.SetFilter("Poll Deadline", '>%1&<=%2', 0DT, CurrentDateTime());
        if MeetingPlan.FindSet() then
            repeat
                Overdue.Add(MeetingPlan.Id);
            until MeetingPlan.Next() = 0;

        foreach PlanId in Overdue do begin
            Clear(Closer);
            Closer.SetTarget(CloseTarget::MeetingPlan, PlanId);
            Commit();
            if Closer.Run() then;
        end;
    end;

    procedure SetTarget(NewTarget: Option " ",Resolution,MeetingPlan; NewKey: Code[20])
    begin
        CloseTarget := NewTarget;
        TargetKey := NewKey;
    end;

    local procedure CloseOneResolution()
    var
        Resolution: Record "Meeting Resolutions";
    begin
        if not Resolution.Get(TargetKey) then
            exit;
        if Resolution."Voting Status" <> Resolution."Voting Status"::Open then
            exit;
        Resolution.CloseVoting();
    end;

    local procedure CloseOneMeetingPlan()
    var
        MeetingPlan: Record "Meeting Plans";
    begin
        if not MeetingPlan.Get(TargetKey) then
            exit;
        if MeetingPlan."Voting Status" <> MeetingPlan."Voting Status"::Open then
            exit;
        MeetingPlan.ClosePoll();
    end;

    var
        CloseTarget: Option " ",Resolution,MeetingPlan;
        TargetKey: Code[20];
}
