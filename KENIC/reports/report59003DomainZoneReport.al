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
            DataItemTableView = sorting("Line No.", "Month No.");

            column(CompanyInfo_Name; CompanyInfo.Name) { }
            column(CompanyInfo_Picture; CompanyInfo.Picture) { }
            column(CompanyInfo_Address; CompanyInfo.Address) { }
            column(CompanyInfo_Address2; CompanyInfo."Address 2") { }
            column(CompanyInfo_City; CompanyInfo.City) { }
            column(CompanyInfo_Phone; CompanyInfo."Phone No.") { }
            column(CompanyInfo_Email; CompanyInfo."E-Mail") { }

            column(Start_Date; StartDate) { }
            column(End_Date; EndDate) { }

            column(Zone_Code; "Zone Code") { }
            column(Zone_Description; "Zone Description") { }
            column(Month_No; "Month No.") { }
            column(Month_Name; "Month Name") { }
            column(Count; Count) { }
            column(Percentage; Percentage) { }
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

                    field(StartDate; StartDate)
                    {
                        Caption = 'Start Date';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the start date for the domain registration period.';
                    }
                    field(EndDate; EndDate)
                    {
                        Caption = 'End Date';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the end date for the domain registration period.';
                    }
                    field(ZoneFilter; ZoneFilter)
                    {
                        Caption = 'Zone Filter';
                        ApplicationArea = All;
                        TableRelation = "Domain Zone Statistics"; 
                        ToolTip = 'Specifies an optional zone code to filter the report.';
                    }
                    field(HideZeroZones; HideZeroZones)
                    {
                        Caption = 'Hide Zones With No Activity';
                        ApplicationArea = All;
                        ToolTip = 'Specifies whether zones with zero registrations for the selected period should be excluded from the report.';
                    }
                }
            }
        }

        trigger OnOpenPage()
        begin
            if StartDate = 0D then
                StartDate := DMY2Date(1, 1, Date2DMY(Today, 3));
            if EndDate = 0D then
                EndDate := DMY2Date(31, 12, Date2DMY(Today, 3));
        end;
    }

    trigger OnPreReport()
    begin
        if StartDate = 0D then
            Error('Please specify a Start Date.');
        if EndDate = 0D then
            Error('Please specify an End Date.');
        if StartDate > EndDate then
            Error('Start Date cannot be greater than End Date.');

        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
        BuildBuffer();
    end;

    var
        CompanyInfo: Record "Company Information";
        DomainLedgerEntry: Record "Domain Ledger Entry";
        ClassificationMgt: Codeunit "Domain Zone Classification Mgt";
        StartDate: Date;
        EndDate: Date;
        ZoneFilter: Code[20];
        HideZeroZones: Boolean;

    local procedure BuildBuffer()
    var
        ZoneCodes: List of [Code[20]];
        ZoneCode: Code[20];
        LineNo: Integer;
        FromDateTime: DateTime;
        ToDateTime: DateTime;
        EntryDate: Date;
        StartMonth: Integer;
        EndMonth: Integer;
        MonthNo: Integer;
        MonthTotals: array[12] of Integer;
        GrandTotal: Integer;
        MonthNames: array[12] of Text[20];
    begin
        ZoneBuffer.Reset();
        ZoneBuffer.DeleteAll();

        MonthNames[1] := 'Jan';
        MonthNames[2] := 'Feb';
        MonthNames[3] := 'Mar';
        MonthNames[4] := 'Apr';
        MonthNames[5] := 'May';
        MonthNames[6] := 'Jun';
        MonthNames[7] := 'Jul';
        MonthNames[8] := 'Aug';
        MonthNames[9] := 'Sep';
        MonthNames[10] := 'Oct';
        MonthNames[11] := 'Nov';
        MonthNames[12] := 'Dec';

        // Extract exact month bounds from user-selected date range
        StartMonth := Date2DMY(StartDate, 2);
        EndMonth := Date2DMY(EndDate, 2);

        // 1. Seed base zones (ONLY for months inside the selected range)
        ClassificationMgt.GetOrderedZoneCodes(ZoneCodes);
        LineNo := 0;

        foreach ZoneCode in ZoneCodes do begin
            if (ZoneFilter = '') or (ZoneCode = ZoneFilter) then begin
                LineNo += 10;
                for MonthNo := StartMonth to EndMonth do begin
                    ZoneBuffer.Init();
                    ZoneBuffer."Zone Code" := ZoneCode;
                    ZoneBuffer."Month No." := MonthNo;
                    ZoneBuffer."Line No." := LineNo;
                    ZoneBuffer."Zone Description" := ClassificationMgt.GetZoneDescription(ZoneCode);
                    ZoneBuffer."Month Name" := MonthNames[MonthNo];
                    ZoneBuffer.Count := 0;
                    ZoneBuffer.Percentage := 0;
                    ZoneBuffer.Insert();
                end;
            end;
        end;

        // Catch-all bucket for 'OTHER'
        if (ZoneFilter = '') or (ZoneFilter = 'OTHER') then
            for MonthNo := StartMonth to EndMonth do begin
                ZoneBuffer.Init();
                ZoneBuffer."Zone Code" := 'OTHER';
                ZoneBuffer."Month No." := MonthNo;
                ZoneBuffer."Line No." := 105;
                ZoneBuffer."Zone Description" := ClassificationMgt.GetZoneDescription('OTHER');
                ZoneBuffer."Month Name" := MonthNames[MonthNo];
                ZoneBuffer.Count := 0;
                ZoneBuffer.Percentage := 0;
                ZoneBuffer.Insert();
            end;

        // 2. Fetch and aggregate records within the requested date range
        FromDateTime := CreateDateTime(StartDate, 0T);
        ToDateTime := CreateDateTime(EndDate, 235959T);

        DomainLedgerEntry.Reset();
        DomainLedgerEntry.SetRange(Created, FromDateTime, ToDateTime);
        DomainLedgerEntry.SetRange(TransType, 'Registration');

        if DomainLedgerEntry.FindSet() then
            repeat
                ZoneCode := ClassificationMgt.GetZoneCode(DomainLedgerEntry.DomainName);

                if (ZoneFilter = '') or (ZoneCode = ZoneFilter) then begin
                    EntryDate := DT2Date(DomainLedgerEntry.Created);
                    MonthNo := Date2DMY(EntryDate, 2);

                    // Ensure record exists in buffer (fallback for dynamic zones)
                    if not ZoneBuffer.Get(ZoneCode, MonthNo) then begin
                        ZoneBuffer.Init();
                        ZoneBuffer."Zone Code" := ZoneCode;
                        ZoneBuffer."Month No." := MonthNo;
                        ZoneBuffer."Line No." := 106;
                        ZoneBuffer."Zone Description" := ClassificationMgt.GetZoneDescription(ZoneCode);
                        ZoneBuffer."Month Name" := MonthNames[MonthNo];
                        ZoneBuffer.Count := 0;
                        ZoneBuffer.Percentage := 0;
                        ZoneBuffer.Insert();
                    end;

                    ZoneBuffer.Count += 1;
                    ZoneBuffer.Modify();

                    MonthTotals[MonthNo] += 1;
                    GrandTotal += 1;
                end;
            until DomainLedgerEntry.Next() = 0;

        // 3. Compute Monthly Percentages for requested active months
        ZoneBuffer.Reset();
        ZoneBuffer.SetCurrentKey("Line No.", "Month No.");
        if ZoneBuffer.FindSet(true) then
            repeat
                MonthNo := ZoneBuffer."Month No.";
                if MonthTotals[MonthNo] <> 0 then
                    ZoneBuffer.Percentage := Round(ZoneBuffer.Count / MonthTotals[MonthNo] * 100, 0.1)
                else
                    ZoneBuffer.Percentage := 0;

                ZoneBuffer.Modify();
            until ZoneBuffer.Next() = 0;

        // 4. Remove Zero-Count Zones if requested
        if HideZeroZones then begin
            ZoneBuffer.Reset();
            ZoneBuffer.SetRange(Count, 0);
            ZoneBuffer.DeleteAll();
        end;
    end;
}