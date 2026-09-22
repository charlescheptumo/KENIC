codeunit 58176 "Domain Registration Report Mgt"
{
     procedure RefreshStatistics(StartDate: Date; EndDate: Date)
    var
        CountDict: Dictionary of [Text, Integer];
        RoidList: List of [Code[50]];
        RoidToName: Dictionary of [Code[50], Text];
        FromDateTime: DateTime;
        ToDateTime: DateTime;
        MonthDate: Date;
        Roid: Code[50];
    begin
        DeleteExistingRows(StartDate, EndDate);

        FromDateTime := CreateDateTime(StartDate, 0T);
        ToDateTime := CreateDateTime(EndDate, 235959T);

        TallyRegistrations(FromDateTime, ToDateTime, CountDict, RoidList);
        BuildRoidToNameMap(RoidToName);

        MonthDate := DMY2Date(1, Date2DMY(StartDate, 2), Date2DMY(StartDate, 3));
        while MonthDate <= EndDate do begin
            foreach Roid in RoidList do
                InsertRow(Roid, Date2DMY(MonthDate, 3), Date2DMY(MonthDate, 2), CountDict, RoidToName);
            MonthDate := CalcDate('<1M>', MonthDate);
        end;
    end;
        local procedure TallyRegistrations(FromDateTime: DateTime; ToDateTime: DateTime; var CountDict: Dictionary of [Text, Integer]; var RoidList: List of [Code[50]])
    var
        DomainLedgerEntry: Record "Domain Ledger Entry";
        EntryDate: Date;
        DictKey: Text;
    begin
        DomainLedgerEntry.Reset();
        DomainLedgerEntry.SetRange(Created, FromDateTime, ToDateTime);
        DomainLedgerEntry.SetRange(TransType, 'Registration');

        if DomainLedgerEntry.FindSet() then
            repeat
                if not RoidList.Contains(DomainLedgerEntry.ClientRoid) then
                    RoidList.Add(DomainLedgerEntry.ClientRoid);

                EntryDate := DT2Date(DomainLedgerEntry.Created);
                DictKey := BuildKey(DomainLedgerEntry.ClientRoid, Date2DMY(EntryDate, 3), Date2DMY(EntryDate, 2));
                if CountDict.ContainsKey(DictKey) then
                    CountDict.Set(DictKey, CountDict.Get(DictKey) + 1)
                else
                    CountDict.Add(DictKey, 1);
            until DomainLedgerEntry.Next() = 0;
    end;

    local procedure BuildRoidToNameMap(var RoidToName: Dictionary of [Code[50], Text])
    var
        DomainClient: Record "Domain Client";
        DisplayName: Text;
    begin
        DomainClient.Reset();
        if DomainClient.FindSet() then
            repeat
                if DomainClient.Roid <> '' then begin
                    if DomainClient.Name <> '' then
                        DisplayName := DomainClient.Name
                    else
                        DisplayName := DomainClient.Roid;

                    // Set, not Add: Roid is only a secondary key on Domain Client, not
                    // the primary key, so duplicate Roids are valid data - Add() would
                    // throw on the second occurrence (same issue fixed in the DUM report).
                    RoidToName.Set(DomainClient.Roid, DisplayName);
                end;
            until DomainClient.Next() = 0;
    end;

    local procedure BuildKey(Roid: Code[50]; YearValue: Integer; MonthNo: Integer): Text
    begin
        exit(Roid + '|' + Format(YearValue) + '|' + Format(MonthNo));
    end;

    local procedure InsertRow(Roid: Code[50]; YearValue: Integer; MonthNo: Integer; var CountDict: Dictionary of [Text, Integer]; var RoidToName: Dictionary of [Code[50], Text])
    var
        DomainRegistrationStatistics: Record "Domain Registration Statistics";
        DictKey: Text;
        RegCount: Integer;
    begin
        DictKey := BuildKey(Roid, YearValue, MonthNo);
        if CountDict.ContainsKey(DictKey) then
            RegCount := CountDict.Get(DictKey)
        else
            RegCount := 0;

        if RegCount = 0 then
            exit; // Skip fully-empty rows so the table doesn't balloon with zero noise.

        DomainRegistrationStatistics.Init();
        DomainRegistrationStatistics."Registrar Roid" := Roid;
        DomainRegistrationStatistics.Year := YearValue;
        DomainRegistrationStatistics."Month No." := MonthNo;
        DomainRegistrationStatistics."Month Name" := MonthShortName(MonthNo);
        if RoidToName.ContainsKey(Roid) then
            DomainRegistrationStatistics."Registrar Name" := CopyStr(RoidToName.Get(Roid), 1, 150)
        else
            DomainRegistrationStatistics."Registrar Name" := Roid;
        DomainRegistrationStatistics."Registration Count" := RegCount;
        DomainRegistrationStatistics."Last Updated" := CurrentDateTime;
        DomainRegistrationStatistics.Insert();
    end;

    local procedure DeleteExistingRows(StartDate: Date; EndDate: Date)
    var
        DomainRegistrationStatistics: Record "Domain Registration Statistics";
        MonthDate: Date;
    begin
        MonthDate := DMY2Date(1, Date2DMY(StartDate, 2), Date2DMY(StartDate, 3));
        while MonthDate <= EndDate do begin
            DomainRegistrationStatistics.Reset();
            DomainRegistrationStatistics.SetRange(Year, Date2DMY(MonthDate, 3));
            DomainRegistrationStatistics.SetRange("Month No.", Date2DMY(MonthDate, 2));
            DomainRegistrationStatistics.DeleteAll();
            MonthDate := CalcDate('<1M>', MonthDate);
        end;
    end;

    local procedure MonthShortName(MonthNo: Integer): Text[10]
    begin
        case MonthNo of
            1: exit('Jan');
            2: exit('Feb');
            3: exit('Mar');
            4: exit('Apr');
            5: exit('May');
            6: exit('Jun');
            7: exit('Jul');
            8: exit('Aug');
            9: exit('Sep');
            10: exit('Oct');
            11: exit('Nov');
            12: exit('Dec');
        end;
    end;
}