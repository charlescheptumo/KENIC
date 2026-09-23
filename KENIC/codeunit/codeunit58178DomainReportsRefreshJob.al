codeunit 58178 "Domain Reports Refresh Job"
{
    trigger OnRun()
    begin
        RefreshAll();
    end;

    procedure RefreshAll()
    var
        CurrentYear: Integer;
    begin
        CurrentYear := Date2DMY(Today, 3);

        if not TryRefreshZone(CurrentYear) then
            LogFailure('Zone');
        if not TryRefreshRegistration(CurrentYear) then
            LogFailure('Registration');
        if not TryRefreshRenewal(CurrentYear) then
            LogFailure('Renewal');
        if not TryRefreshDeletion(CurrentYear) then
            LogFailure('Deletion');
        if not TryRefreshDUM() then
            LogFailure('DUM');
        if not TryRefreshAcctMgr(CurrentYear) then
            LogFailure('Account Manager');
    end;

    [TryFunction]
    local procedure TryRefreshZone(CurrentYear: Integer)
    var
        ZoneMgt: Codeunit "Domain Zone Classification Mgt";
    begin
        ZoneMgt.RefreshStatistics(CurrentYear);
    end;

    [TryFunction]
    local procedure TryRefreshRegistration(CurrentYear: Integer)
    var
        RegistrationMgt: Codeunit "Domain Registration Report Mgt";
    begin
        RegistrationMgt.RefreshStatistics(DMY2Date(1, 1, CurrentYear), Today);
    end;

    [TryFunction]
    local procedure TryRefreshRenewal(CurrentYear: Integer)
    var
        RenewalMgt: Codeunit "Domain Renewal Report Mgt";
    begin
        RenewalMgt.RefreshStatistics(DMY2Date(1, 1, CurrentYear), Today);
    end;

    [TryFunction]
    local procedure TryRefreshDeletion(CurrentYear: Integer)
    var
        DeletionMgt: Codeunit "Domain Deletion Report Mgt";
    begin
        DeletionMgt.RefreshStatistics(DMY2Date(1, 1, CurrentYear), Today);
    end;

    [TryFunction]
    local procedure TryRefreshDUM()
    var
        DUMMgt: Codeunit "Domain DUM Report Mgt";
    begin
        DUMMgt.RefreshStatistics(Today, '');
    end;

    [TryFunction]
    local procedure TryRefreshAcctMgr(CurrentYear: Integer)
    var
        AcctMgrMgt: Codeunit "Domain Acct Mgr Report Mgt";
    begin
        AcctMgrMgt.RefreshStatistics('', DMY2Date(1, 1, CurrentYear), Today);
    end;

    local procedure LogFailure(ReportName: Text)
    begin
        Message('%1 refresh failed - check data or run manually via its Refresh Now action.', ReportName);
     
    end;
}