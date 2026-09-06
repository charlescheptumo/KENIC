#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
codeunit 58171 "Resolution Deadline Enforcer"
{


    trigger OnRun()
    begin
        CloseOverdueResolutions();
    end;

    procedure CloseOverdueResolutions()
    var
        Resolution: Record "Meeting Resolutions";
    begin
        Resolution.SetRange("Voting Status", Resolution."Voting Status"::Open);
        Resolution.SetFilter("Voting Deadline", '>%1&<=%2', 0DT, CurrentDateTime());
        if Resolution.FindSet() then
            repeat
               
                TryCloseVoting(Resolution);
            until Resolution.Next() = 0;
    end;

    [TryFunction]
    local procedure TryCloseVoting(var Resolution: Record "Meeting Resolutions")
    begin
        Resolution.CloseVoting();
    end;
}