codeunit 58175 "Domain DUM Report Mgt"
{
    procedure RefreshStatistics(AsOfDate: Date; ExcludedTransTypeFilter: Text)
    var
        LatestCreated: Dictionary of [Text, DateTime];
        LatestRoid: Dictionary of [Text, Code[50]];
        LatestTransType: Dictionary of [Text, Text];
        RoidCounts: Dictionary of [Code[50], Integer];
        RoidToName: Dictionary of [Code[50], Text];
    begin
        DeleteExistingRows(AsOfDate);

        BuildLatestDomainMap(AsOfDate, LatestCreated, LatestRoid, LatestTransType);
        TallyByRegistrar(LatestRoid, LatestTransType, ExcludedTransTypeFilter, RoidCounts);
        BuildRoidToNameMap(RoidToName);
        WriteRows(AsOfDate, RoidCounts, RoidToName);
    end;

    local procedure BuildLatestDomainMap(AsOfDate: Date; var LatestCreated: Dictionary of [Text, DateTime]; var LatestRoid: Dictionary of [Text, Code[50]]; var LatestTransType: Dictionary of [Text, Text])
    var
        DomainLedgerEntry: Record "Domain Ledger Entry";
        ToDateTime: DateTime;
        DomainKey: Text;
    begin
        ToDateTime := CreateDateTime(AsOfDate, 235959T);

        DomainLedgerEntry.Reset();
        DomainLedgerEntry.SetFilter(Created, '<=%1', ToDateTime);
        DomainLedgerEntry.SetFilter(DomainName, '<>%1', '');

        if DomainLedgerEntry.FindSet() then
            repeat
                DomainKey := UpperCase(DomainLedgerEntry.DomainName);

                // Keep only the chronologically latest entry per domain, regardless
                // of table iteration order - this is what "as of AsOfDate" means.
                if (not LatestCreated.ContainsKey(DomainKey)) or (DomainLedgerEntry.Created > LatestCreated.Get(DomainKey)) then begin
                    LatestCreated.Set(DomainKey, DomainLedgerEntry.Created);
                    LatestRoid.Set(DomainKey, DomainLedgerEntry.ClientRoid);
                    LatestTransType.Set(DomainKey, DomainLedgerEntry.TransType);
                end;
            until DomainLedgerEntry.Next() = 0;
    end;

    local procedure TallyByRegistrar(var LatestRoid: Dictionary of [Text, Code[50]]; var LatestTransType: Dictionary of [Text, Text]; ExcludedTransTypeFilter: Text; var RoidCounts: Dictionary of [Code[50], Integer])
    var
        DomainKey: Text;
        Roid: Code[50];
    begin
        foreach DomainKey in LatestRoid.Keys do begin
            if IsExcluded(LatestTransType.Get(DomainKey), ExcludedTransTypeFilter) then
                continue; // Latest known event for this domain is a removal - not counted as active.

            Roid := LatestRoid.Get(DomainKey);
            if RoidCounts.ContainsKey(Roid) then
                RoidCounts.Set(Roid, RoidCounts.Get(Roid) + 1)
            else
                RoidCounts.Add(Roid, 1);
        end;
    end;

    local procedure IsExcluded(TransTypeValue: Text; ExcludedTransTypeFilter: Text): Boolean
    begin
        if ExcludedTransTypeFilter = '' then
            exit(false);
        exit(UpperCase(TransTypeValue) = UpperCase(ExcludedTransTypeFilter));
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

    local procedure WriteRows(AsOfDate: Date; var RoidCounts: Dictionary of [Code[50], Integer]; var RoidToName: Dictionary of [Code[50], Text])
    var
        DomainDUMStatistics: Record "Domain DUM Statistics";
        Roid: Code[50];
        Handled: Dictionary of [Code[50], Boolean];
    begin
        // 1. Every known registrar (Domain Client), including zero-DUM ones.
        foreach Roid in RoidToName.Keys do begin
            InsertRow(AsOfDate, Roid, RoidToName.Get(Roid), GetCount(RoidCounts, Roid));
            Handled.Add(Roid, true);
        end;

        // 2. Any ROID that shows up in the ledger but has no matching Domain Client record.
        foreach Roid in RoidCounts.Keys do
            if not Handled.ContainsKey(Roid) then
                InsertRow(AsOfDate, Roid, Roid, RoidCounts.Get(Roid));
    end;

    local procedure GetCount(var RoidCounts: Dictionary of [Code[50], Integer]; Roid: Code[50]): Integer
    begin
        if RoidCounts.ContainsKey(Roid) then
            exit(RoidCounts.Get(Roid));
        exit(0);
    end;

    local procedure InsertRow(AsOfDate: Date; Roid: Code[50]; RegistrarName: Text; DUMCount: Integer)
    var
        DomainDUMStatistics: Record "Domain DUM Statistics";
    begin
        DomainDUMStatistics.Init();
        DomainDUMStatistics."Registrar Roid" := Roid;
        DomainDUMStatistics."As Of Date" := AsOfDate;
        DomainDUMStatistics."Registrar Name" := CopyStr(RegistrarName, 1, 150);
        DomainDUMStatistics."DUM Count" := DUMCount;
        DomainDUMStatistics."Last Updated" := CurrentDateTime;
        DomainDUMStatistics.Insert();
    end;

    local procedure DeleteExistingRows(AsOfDate: Date)
    var
        DomainDUMStatistics: Record "Domain DUM Statistics";
    begin
        DomainDUMStatistics.Reset();
        DomainDUMStatistics.SetRange("As Of Date", AsOfDate);
        DomainDUMStatistics.DeleteAll();
    end;
}