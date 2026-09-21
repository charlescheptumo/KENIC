codeunit 58174 "Domain Deletion Report Mgt"
{
    procedure RefreshStatistics(StartDate: Date; EndDate: Date)
    var
        RegDict: Dictionary of [Text, Integer];
        RenewDict: Dictionary of [Text, Integer];
        RoidList: List of [Code[50]];
        RoidToName: Dictionary of [Code[50], Text];
        Roid: Code[50];
        FromDateTime: DateTime;
        ToDateTime: DateTime;
        MonthDate: Date;
    begin
        DeleteExistingRows(StartDate, EndDate);

        FromDateTime := CreateDateTime(StartDate, 0T);
        ToDateTime := CreateDateTime(EndDate, 235959T);

        TallyTransType('Registration', FromDateTime, ToDateTime, RegDict, RoidList);
        TallyTransType('Renewal', FromDateTime, ToDateTime, RenewDict, RoidList);

        BuildRoidToNameMap(RoidToName);

        MonthDate := DMY2Date(1, Date2DMY(StartDate, 2), Date2DMY(StartDate, 3));
        while MonthDate <= EndDate do begin
            foreach Roid in RoidList do
                InsertRow(Roid, Date2DMY(MonthDate, 3), Date2DMY(MonthDate, 2), RegDict, RenewDict, RoidToName);
            MonthDate := CalcDate('<1M>', MonthDate);
        end;
    end;

    local procedure TallyTransType(TransTypeFilter: Text; FromDateTime: DateTime; ToDateTime: DateTime; var CountDict: Dictionary of [Text, Integer]; var RoidList: List of [Code[50]])
    var
        DomainLedgerEntry: Record "Domain Ledger Entry";
        EntryDate: Date;
        DictKey: Text;
    begin
        DomainLedgerEntry.Reset();
        DomainLedgerEntry.SetRange(Created, FromDateTime, ToDateTime);
        DomainLedgerEntry.SetRange(TransType, TransTypeFilter);

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
    begin
        DomainClient.Reset();
        if DomainClient.FindSet() then
            repeat
                if DomainClient.Name <> '' then
                    RoidToName.Add(DomainClient.Roid, DomainClient.Name)
                else
                    RoidToName.Add(DomainClient.Roid, DomainClient.Roid);
            until DomainClient.Next() = 0;
    end;

    local procedure BuildKey(Roid: Code[50]; YearValue: Integer; MonthNo: Integer): Text
    begin
        exit(Roid + '|' + Format(YearValue) + '|' + Format(MonthNo));
    end;

    local procedure InsertRow(Roid: Code[50]; YearValue: Integer; MonthNo: Integer; var RegDict: Dictionary of [Text, Integer]; var RenewDict: Dictionary of [Text, Integer]; var RoidToName: Dictionary of [Code[50], Text])
    var
        DomainDeletionStatistics: Record "Domain Deletion Statistics";
        DictKey: Text;
        RegCount: Integer;
        RenewCount: Integer;
    begin
        DictKey := BuildKey(Roid, YearValue, MonthNo);
        if RegDict.ContainsKey(DictKey) then
            RegCount := RegDict.Get(DictKey)
        else
            RegCount := 0;
        if RenewDict.ContainsKey(DictKey) then
            RenewCount := RenewDict.Get(DictKey)
        else
            RenewCount := 0;

        if (RegCount = 0) and (RenewCount = 0) then
            exit; // Skip fully-empty rows.

        DomainDeletionStatistics.Init();
        DomainDeletionStatistics."Registrar Roid" := Roid;
        DomainDeletionStatistics.Year := YearValue;
        DomainDeletionStatistics."Month No." := MonthNo;
        DomainDeletionStatistics."Month Name" := MonthShortName(MonthNo);
        if RoidToName.ContainsKey(Roid) then
            DomainDeletionStatistics."Registrar Name" := CopyStr(RoidToName.Get(Roid), 1, 150)
        else
            DomainDeletionStatistics."Registrar Name" := Roid;
        DomainDeletionStatistics."Registration Count" := RegCount;
        DomainDeletionStatistics."Renewal Count" := RenewCount;
        DomainDeletionStatistics."Deleted Count" := RegCount - RenewCount; // Can go negative - see caveat.
        DomainDeletionStatistics."Last Updated" := CurrentDateTime;
        DomainDeletionStatistics.Insert();
    end;

    local procedure DeleteExistingRows(StartDate: Date; EndDate: Date)
    var
        DomainDeletionStatistics: Record "Domain Deletion Statistics";
        MonthDate: Date;
    begin
        MonthDate := DMY2Date(1, Date2DMY(StartDate, 2), Date2DMY(StartDate, 3));
        while MonthDate <= EndDate do begin
            DomainDeletionStatistics.Reset();
            DomainDeletionStatistics.SetRange(Year, Date2DMY(MonthDate, 3));
            DomainDeletionStatistics.SetRange("Month No.", Date2DMY(MonthDate, 2));
            DomainDeletionStatistics.DeleteAll();
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