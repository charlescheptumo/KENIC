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
        ShouldReplace: Boolean;
    begin
        ToDateTime := CreateDateTime(AsOfDate, 235959T);

        DomainLedgerEntry.Reset();
        DomainLedgerEntry.SetFilter(Created, '<=%1', ToDateTime);
        DomainLedgerEntry.SetFilter(DomainName, '<>%1', '');

        if DomainLedgerEntry.FindSet() then
            repeat
                DomainKey := UpperCase(DomainLedgerEntry.DomainName);

                ShouldReplace := not LatestCreated.ContainsKey(DomainKey);
                if not ShouldReplace then
                    ShouldReplace := DomainLedgerEntry.Created > SafeGetDateTime(LatestCreated, DomainKey);

                if ShouldReplace then begin
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
            if IsExcluded(SafeGetText(LatestTransType, DomainKey), ExcludedTransTypeFilter) then
                continue; 

            Roid := SafeGetRoid(LatestRoid, DomainKey);
            if Roid = '' then
                continue;

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

        
                    RoidToName.Set(DomainClient.Roid, DisplayName);
                end;
            until DomainClient.Next() = 0;
    end;

    local procedure WriteRows(AsOfDate: Date; var RoidCounts: Dictionary of [Code[50], Integer]; var RoidToName: Dictionary of [Code[50], Text])
    var
        Roid: Code[50];
        Handled: Dictionary of [Code[50], Boolean];
    begin
       
        foreach Roid in RoidToName.Keys do begin
            InsertRow(AsOfDate, Roid, SafeGetText2(RoidToName, Roid), GetCount(RoidCounts, Roid));
            Handled.Set(Roid, true);
        end;

     
        foreach Roid in RoidCounts.Keys do
            if not Handled.ContainsKey(Roid) then
                InsertRow(AsOfDate, Roid, Roid, GetCount(RoidCounts, Roid));
    end;

    local procedure GetCount(var RoidCounts: Dictionary of [Code[50], Integer]; Roid: Code[50]): Integer
    begin
        if RoidCounts.ContainsKey(Roid) then
            exit(RoidCounts.Get(Roid));
        exit(0);
    end;

    local procedure SafeGetDateTime(var Dict: Dictionary of [Text, DateTime]; DictKey: Text): DateTime
    begin
        if Dict.ContainsKey(DictKey) then
            exit(Dict.Get(DictKey));
        exit(0DT);
    end;

    local procedure SafeGetText(var Dict: Dictionary of [Text, Text]; DictKey: Text): Text
    begin
        if Dict.ContainsKey(DictKey) then
            exit(Dict.Get(DictKey));
        exit('');
    end;

    local procedure SafeGetText2(var Dict: Dictionary of [Code[50], Text]; DictKey: Code[50]): Text
    begin
        if Dict.ContainsKey(DictKey) then
            exit(Dict.Get(DictKey));
        exit(DictKey);
    end;

    local procedure SafeGetRoid(var Dict: Dictionary of [Text, Code[50]]; DictKey: Text): Code[50]
    begin
        if Dict.ContainsKey(DictKey) then
            exit(Dict.Get(DictKey));
        exit('');
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