codeunit 69210 "HR Auto Approve Leave JQ"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    var
        LeaveApp: Record "HR Leave Applications";
        Emp: Record Employee;
        ErrorMsg: Text;
    begin
        LeaveApp.Reset();
        LeaveApp.SetRange(LeaveApp.Status, LeaveApp.Status::"Pending Approval");
        LeaveApp.SetFilter(LeaveApp."Start Date", '<=%1', Today());
        LeaveApp.SetRange(LeaveApp.Posted, false);
        if LeaveApp.FindSet(true) then
            repeat
                if Emp.Get(LeaveApp."Employee No") then
                    if Emp."Company E-Mail" <> '' then begin
                        if LeaveApp."Approved days" = 0 then
                            LeaveApp."Approved days" := LeaveApp."Days Applied";
                        LeaveApp.Status := LeaveApp.Status::Released;
                        LeaveApp.Modify(true);
                        if not TryPostLeave(LeaveApp) then begin
                            ErrorMsg := GetLastErrorText();
                        end;
                    end;
            until LeaveApp.Next() = 0;
    end;

    [TryFunction]
    local procedure TryPostLeave(var LeaveApp: Record "HR Leave Applications")
    begin
        LeaveApp.CreateLeaveLedgerEntries();
    end;
}