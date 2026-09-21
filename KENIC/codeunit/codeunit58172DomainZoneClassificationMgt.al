codeunit 58172 "Domain Zone Classification Mgt"
{
    procedure GetZoneCode(DomainName: Text[100]): Code[20]
    var
        UpperDomain: Text[100];
    begin
        UpperDomain := UpperCase(DomainName);
        case true of
            UpperDomain.EndsWith('.CO.KE'):
                exit('CO.KE');
            UpperDomain.EndsWith('.OR.KE'):
                exit('OR.KE');
            UpperDomain.EndsWith('.AC.KE'):
                exit('AC.KE');
            UpperDomain.EndsWith('.SC.KE'):
                exit('SC.KE');
            UpperDomain.EndsWith('.NE.KE'):
                exit('NE.KE');
            UpperDomain.EndsWith('.ME.KE'):
                exit('ME.KE');
            UpperDomain.EndsWith('.MOBI.KE'):
                exit('MOBI.KE');
            UpperDomain.EndsWith('.INFO.KE'):
                exit('INFO.KE');
            UpperDomain.EndsWith('.GO.KE'):
                exit('GO.KE');
            UpperDomain.EndsWith('.KE'):
                exit('KE');
            else
                exit('OTHER');
        end;
    end;

    procedure GetZoneDescription(ZoneCode: Code[20]): Text[100]
    begin
        case ZoneCode of
            'CO.KE':
                exit('Companies');
            'OR.KE':
                exit('Non Profit Making Organizations');
            'AC.KE':
                exit('Institutions of Higher Education');
            'SC.KE':
                exit('Lower and Middle Level Institutions');
            'NE.KE':
                exit('Personal Websites and E-mail (NE)');
            'ME.KE':
                exit('Personal Websites and E-mail (ME)');
            'MOBI.KE':
                exit('Mobile Content');
            'INFO.KE':
                exit('Information');
            'GO.KE':
                exit('Government Institutions');
            'KE':
                exit('Second Level');
            'OTHER':
                exit('Other / Unclassified');
            else
                exit(ZoneCode);
        end;
    end;

    procedure GetOrderedZoneCodes(var ZoneCodes: List of [Code[20]])
    begin
        Clear(ZoneCodes);
        ZoneCodes.Add('CO.KE');
        ZoneCodes.Add('OR.KE');
        ZoneCodes.Add('AC.KE');
        ZoneCodes.Add('SC.KE');
        ZoneCodes.Add('NE.KE');
        ZoneCodes.Add('ME.KE');
        ZoneCodes.Add('MOBI.KE');
        ZoneCodes.Add('INFO.KE');
        ZoneCodes.Add('GO.KE');
        ZoneCodes.Add('KE');
    end;

    procedure RefreshStatistics(YearFilter: Integer)
    var
        DomainLedgerEntry: Record "Domain Ledger Entry";
        DomainZoneStatistics: Record "Domain Zone Statistics";
        ZoneCodes: List of [Code[20]];
        ZoneCode: Code[20];
        FromDateTime: DateTime;
        ToDateTime: DateTime;
        EntryDate: Date;
        MonthNo: Integer;
        CountKey: Text;
        Counts: Dictionary of [Text, Integer];
        MonthTotals: array[12] of Integer;
    begin
        DomainZoneStatistics.Reset();
        DomainZoneStatistics.SetRange(Year, YearFilter);
        DomainZoneStatistics.DeleteAll();

        GetOrderedZoneCodes(ZoneCodes);

        FromDateTime := CreateDateTime(DMY2Date(1, 1, YearFilter), 0T);
        ToDateTime := CreateDateTime(DMY2Date(31, 12, YearFilter), 235959T);

        DomainLedgerEntry.Reset();
        DomainLedgerEntry.SetRange(Created, FromDateTime, ToDateTime);
        DomainLedgerEntry.SetRange(TransType, 'Registration');
        if DomainLedgerEntry.FindSet() then
            repeat
                EntryDate := DT2Date(DomainLedgerEntry.Created);
                MonthNo := Date2DMY(EntryDate, 2);
                ZoneCode := GetZoneCode(DomainLedgerEntry.DomainName);
                CountKey := Format(MonthNo) + '|' + ZoneCode;
                if Counts.ContainsKey(CountKey) then
                    Counts.Set(CountKey, Counts.Get(CountKey) + 1)
                else
                    Counts.Add(CountKey, 1);
                MonthTotals[MonthNo] += 1;
            until DomainLedgerEntry.Next() = 0;

        for MonthNo := 1 to 12 do
            foreach ZoneCode in ZoneCodes do
                InsertRow(YearFilter, MonthNo, ZoneCode, GetZoneDescription(ZoneCode),
                    GetCount(Counts, MonthNo, ZoneCode), MonthTotals[MonthNo]);

        // Include OTHER only for months that actually had unclassified domains.
        for MonthNo := 1 to 12 do begin
            CountKey := Format(MonthNo) + '|OTHER';
            if Counts.ContainsKey(CountKey) then
                InsertRow(YearFilter, MonthNo, 'OTHER', GetZoneDescription('OTHER'),
                    Counts.Get(CountKey), MonthTotals[MonthNo]);
        end;
    end;

    local procedure GetCount(var Counts: Dictionary of [Text, Integer]; MonthNo: Integer; ZoneCode: Code[20]): Integer
    var
        CountKey: Text;
    begin
        CountKey := Format(MonthNo) + '|' + ZoneCode;
        if Counts.ContainsKey(CountKey) then
            exit(Counts.Get(CountKey));
        exit(0);
    end;

    local procedure InsertRow(YearFilter: Integer; MonthNo: Integer; ZoneCode: Code[20]; ZoneDescription: Text[100]; CountValue: Integer; MonthTotal: Integer)
    var
        DomainZoneStatistics: Record "Domain Zone Statistics";
    begin
        DomainZoneStatistics.Init();
        DomainZoneStatistics.Year := YearFilter;
        DomainZoneStatistics."Month No." := MonthNo;
        DomainZoneStatistics."Month Name" := MonthShortName(MonthNo);
        DomainZoneStatistics."Zone Code" := ZoneCode;
        DomainZoneStatistics."Zone Description" := ZoneDescription;
        DomainZoneStatistics."Domain Count" := CountValue;
        if MonthTotal <> 0 then
            DomainZoneStatistics.Percentage := Round(CountValue / MonthTotal * 100, 0.1)
        else
            DomainZoneStatistics.Percentage := 0;
        DomainZoneStatistics."Last Updated" := CurrentDateTime;
        DomainZoneStatistics.Insert();
    end;

    local procedure MonthShortName(MonthNo: Integer): Text[3]
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