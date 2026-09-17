report 59003 "Domain Zone Report"
{
    Caption = 'Domain Registrations by Zone';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './KENIC/layout/Rep59003DomainZones.rdlc';

    dataset
    {
        dataitem(ZoneBuffer; "Domain Zone Count Buffer")
        {
            DataItemTableView = sorting("Line No.");

            column(CompanyInfo_Name; CompanyInfo.Name) { }
            column(CompanyInfo_Picture; CompanyInfo.Picture) { }
            column(CompanyInfo_Address; CompanyInfo.Address) { }
            column(CompanyInfo_Address2; CompanyInfo."Address 2") { }
            column(CompanyInfo_City; CompanyInfo.City) { }
            column(CompanyInfo_Phone; CompanyInfo."Phone No.") { }
            column(CompanyInfo_Email; CompanyInfo."E-Mail") { }

            column(Report_Year; YearFilter) { }

            column(Zone_Code; "Zone Code") { }
            column(Zone_Description; "Zone Description") { }

            column(Jan; Jan) { }
            column(Feb; Feb) { }
            column(Mar; Mar) { }
            column(Apr; Apr) { }
            column(May; May) { }
            column(Jun; Jun) { }
            column(Jul; Jul) { }
            column(Aug; Aug) { }
            column(Sep; Sep) { }
            column(Oct; Oct) { }
            column(Nov; Nov) { }
            column(Dec; Dec) { }

            column(Jan_Pct; "Jan %") { }
            column(Feb_Pct; "Feb %") { }
            column(Mar_Pct; "Mar %") { }
            column(Apr_Pct; "Apr %") { }
            column(May_Pct; "May %") { }
            column(Jun_Pct; "Jun %") { }
            column(Jul_Pct; "Jul %") { }
            column(Aug_Pct; "Aug %") { }
            column(Sep_Pct; "Sep %") { }
            column(Oct_Pct; "Oct %") { }
            column(Nov_Pct; "Nov %") { }
            column(Dec_Pct; "Dec %") { }

            column(Total; Total) { }
            column(Total_Pct; "Total %") { }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field(YearFilter; YearFilter)
                    {
                        Caption = 'Year';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the year to report domain registrations by zone for.';
                    }
                    field(HideZeroZones; HideZeroZones)
                    {
                        Caption = 'Hide Zones With No Activity';
                        ApplicationArea = All;
                        ToolTip = 'Specifies whether zones with zero registrations for the selected year should be excluded from the report.';
                    }
                }
            }
        }

        trigger OnOpenPage()
        begin
            if YearFilter = 0 then
                YearFilter := Date2DMY(Today, 3);
        end;
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
        BuildBuffer();
    end;

    var
        CompanyInfo: Record "Company Information";
        DomainLedgerEntry: Record "Domain Ledger Entry";
        ClassificationMgt: Codeunit "Domain Zone Classification Mgt";
        YearFilter: Integer;
        HideZeroZones: Boolean;

    local procedure BuildBuffer()
    var
        ZoneCodes: List of [Code[20]];
        ZoneCode: Code[20];
        LineNo: Integer;
        FromDateTime: DateTime;
        ToDateTime: DateTime;
        EntryDate: Date;
        MonthNo: Integer;
        MonthTotals: array[12] of Integer;
        GrandTotal: Integer;
        PercentValue: Decimal;
    begin
        ZoneBuffer.Reset();
        ZoneBuffer.DeleteAll();

        // Seed every known zone, in the fixed display order, so a zone with
        // zero registrations still shows as a 0 row instead of disappearing.
        ClassificationMgt.GetOrderedZoneCodes(ZoneCodes);
        LineNo := 0;
        foreach ZoneCode in ZoneCodes do begin
            LineNo += 10;
            ZoneBuffer.Init();
            ZoneBuffer."Zone Code" := ZoneCode;
            ZoneBuffer."Line No." := LineNo;
            ZoneBuffer."Zone Description" := ClassificationMgt.GetZoneDescription(ZoneCode);
            ZoneBuffer.Insert();
        end;

        // Catch-all bucket for anything that doesn't end in .KE at all (data-quality safety net).
        ZoneBuffer.Init();
        ZoneBuffer."Zone Code" := 'OTHER';
        ZoneBuffer."Line No." := 105;
        ZoneBuffer."Zone Description" := ClassificationMgt.GetZoneDescription('OTHER');
        ZoneBuffer.Insert();

        // Grand total row, shown last.
        ZoneBuffer.Init();
        ZoneBuffer."Zone Code" := 'TOTAL';
        ZoneBuffer."Line No." := 999;
        ZoneBuffer."Zone Description" := 'Total';
        ZoneBuffer.Insert();

        // Single pass over Domain Ledger Entry: Registration transactions for the selected year.
        FromDateTime := CreateDateTime(DMY2Date(1, 1, YearFilter), 0T);
        ToDateTime := CreateDateTime(DMY2Date(31, 12, YearFilter), 235959T);

        DomainLedgerEntry.Reset();
        DomainLedgerEntry.SetRange(Created, FromDateTime, ToDateTime);
        DomainLedgerEntry.SetRange(TransType, 'Registration');

        if DomainLedgerEntry.FindSet() then
            repeat
                ZoneCode := ClassificationMgt.GetZoneCode(DomainLedgerEntry.DomainName);
                if not ZoneBuffer.Get(ZoneCode) then begin
                    ZoneBuffer.Init();
                    ZoneBuffer."Zone Code" := ZoneCode;
                    ZoneBuffer."Line No." := 106;
                    ZoneBuffer."Zone Description" := ClassificationMgt.GetZoneDescription(ZoneCode);
                    ZoneBuffer.Insert();
                end;

                EntryDate := DT2Date(DomainLedgerEntry.Created);
                MonthNo := Date2DMY(EntryDate, 2);
                IncrementZoneMonth(MonthNo);
                ZoneBuffer.Total += 1;
                ZoneBuffer.Modify();

                MonthTotals[MonthNo] += 1;
                GrandTotal += 1;
            until DomainLedgerEntry.Next() = 0;

        // Fill in the grand total row's monthly figures.
        if ZoneBuffer.Get('TOTAL') then begin
            for MonthNo := 1 to 12 do
                SetZoneMonth(MonthNo, MonthTotals[MonthNo]);
            ZoneBuffer.Total := GrandTotal;
            ZoneBuffer.Modify();
        end;

        // Second pass: each row's % of that month's total, and its % of the year total.
        ZoneBuffer.Reset();
        ZoneBuffer.SetCurrentKey("Line No.");
        if ZoneBuffer.FindSet(true) then
            repeat
                for MonthNo := 1 to 12 do begin
                    if MonthTotals[MonthNo] <> 0 then
                        PercentValue := Round(GetZoneMonth(MonthNo) / MonthTotals[MonthNo] * 100, 0.1)
                    else
                        PercentValue := 0;
                    SetZoneMonthPercent(MonthNo, PercentValue);
                end;

                if GrandTotal <> 0 then
                    ZoneBuffer."Total %" := Round(ZoneBuffer.Total / GrandTotal * 100, 0.1)
                else
                    ZoneBuffer."Total %" := 0;
                ZoneBuffer.Modify();
            until ZoneBuffer.Next() = 0;

        if HideZeroZones then begin
            ZoneBuffer.Reset();
            ZoneBuffer.SetRange(Total, 0);
            ZoneBuffer.SetFilter("Zone Code", '<>%1', 'TOTAL');
            ZoneBuffer.DeleteAll();
        end;
    end;

    local procedure IncrementZoneMonth(MonthNo: Integer)
    begin
        case MonthNo of
            1: ZoneBuffer.Jan += 1;
            2: ZoneBuffer.Feb += 1;
            3: ZoneBuffer.Mar += 1;
            4: ZoneBuffer.Apr += 1;
            5: ZoneBuffer.May += 1;
            6: ZoneBuffer.Jun += 1;
            7: ZoneBuffer.Jul += 1;
            8: ZoneBuffer.Aug += 1;
            9: ZoneBuffer.Sep += 1;
            10: ZoneBuffer.Oct += 1;
            11: ZoneBuffer.Nov += 1;
            12: ZoneBuffer.Dec += 1;
        end;
    end;

    local procedure SetZoneMonth(MonthNo: Integer; Value: Integer)
    begin
        case MonthNo of
            1: ZoneBuffer.Jan := Value;
            2: ZoneBuffer.Feb := Value;
            3: ZoneBuffer.Mar := Value;
            4: ZoneBuffer.Apr := Value;
            5: ZoneBuffer.May := Value;
            6: ZoneBuffer.Jun := Value;
            7: ZoneBuffer.Jul := Value;
            8: ZoneBuffer.Aug := Value;
            9: ZoneBuffer.Sep := Value;
            10: ZoneBuffer.Oct := Value;
            11: ZoneBuffer.Nov := Value;
            12: ZoneBuffer.Dec := Value;
        end;
    end;

    local procedure GetZoneMonth(MonthNo: Integer): Integer
    begin
        case MonthNo of
            1: exit(ZoneBuffer.Jan);
            2: exit(ZoneBuffer.Feb);
            3: exit(ZoneBuffer.Mar);
            4: exit(ZoneBuffer.Apr);
            5: exit(ZoneBuffer.May);
            6: exit(ZoneBuffer.Jun);
            7: exit(ZoneBuffer.Jul);
            8: exit(ZoneBuffer.Aug);
            9: exit(ZoneBuffer.Sep);
            10: exit(ZoneBuffer.Oct);
            11: exit(ZoneBuffer.Nov);
            12: exit(ZoneBuffer.Dec);
        end;
    end;

    local procedure SetZoneMonthPercent(MonthNo: Integer; Value: Decimal)
    begin
        case MonthNo of
            1: ZoneBuffer."Jan %" := Value;
            2: ZoneBuffer."Feb %" := Value;
            3: ZoneBuffer."Mar %" := Value;
            4: ZoneBuffer."Apr %" := Value;
            5: ZoneBuffer."May %" := Value;
            6: ZoneBuffer."Jun %" := Value;
            7: ZoneBuffer."Jul %" := Value;
            8: ZoneBuffer."Aug %" := Value;
            9: ZoneBuffer."Sep %" := Value;
            10: ZoneBuffer."Oct %" := Value;
            11: ZoneBuffer."Nov %" := Value;
            12: ZoneBuffer."Dec %" := Value;
        end;
    end;
}