report 59004 "Domain Account Manager Report"
{
    Caption = 'Domain Performance by Account Manager';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './KENIC/layout/Rep59004DomainAcctMgr.rdlc';

    dataset
    {
        dataitem(AcctMgrBuffer; "Domain Acct Mgr Buffer")
        {
            DataItemTableView = sorting("Line No.", Year, "Month No.");

            column(CompanyInfo_Name; CompanyInfo.Name) { }
            column(CompanyInfo_Picture; CompanyInfo.Picture) { }
            column(CompanyInfo_Address; CompanyInfo.Address) { }
            column(CompanyInfo_Address2; CompanyInfo."Address 2") { }
            column(CompanyInfo_City; CompanyInfo.City) { }
            column(CompanyInfo_Phone; CompanyInfo."Phone No.") { }
            column(CompanyInfo_Email; CompanyInfo."E-Mail") { }

            column(Start_Date; StartDate) { }
            column(End_Date; EndDate) { }

            column(Salesperson_Code; "Salesperson Code") { }
            column(Section_Code; "Section Code") { }
            column(Section_Description; "Section Description") { }
            column(Year; Year) { }
            column(Month_No; "Month No.") { }
            column(Month_Name; "Month Name") { }
            column(Target_Qty; "Target Qty") { }
            column(Actual_Qty; "Actual Qty") { }
            column(Pct_Achieved; "% Achieved") { }
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
                        ToolTip = 'Specifies the start date for the report period.';
                    }
                    field(EndDate; EndDate)
                    {
                        Caption = 'End Date';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the end date for the report period.';
                    }
                    field(BudgetNameFilter; BudgetNameFilter)
                    {
                        Caption = 'Budget Name';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the Item Budget (e.g. FY26) to pull targets from. Leave blank to include all budgets in the period.';
                    }
                    field(SalespersonFilter; SalespersonFilter)
                    {
                        Caption = 'Account Manager';
                        ApplicationArea = All;
                        TableRelation = "Salesperson/Purchaser".Code;
                        ToolTip = 'Specifies an optional account manager to filter the report to.';
                    }
                    field(HideZeroRows; HideZeroRows)
                    {
                        Caption = 'Hide Rows With No Target and No Actual';
                        ApplicationArea = All;
                        ToolTip = 'Specifies whether rows with both zero target and zero actual should be excluded.';
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
        DomainAcctMgrStatistics: Record "Domain Acct Mgr Statistics";
        ReportMgt: Codeunit "Domain Acct Mgr Report Mgt";
        StartDate: Date;
        EndDate: Date;
        BudgetNameFilter: Code[10];
        SalespersonFilter: Code[20];
        HideZeroRows: Boolean;

    local procedure BuildBuffer()
    var
        SectionCodes: List of [Code[20]];
        SectionCode: Code[20];
        SectionLineNo: Dictionary of [Code[20], Integer];
        LineNo: Integer;
    begin
        AcctMgrBuffer.Reset();
        AcctMgrBuffer.DeleteAll();

        // Rebuild the persisted statistics for exactly this period, then copy into the
        // temp buffer for the RDLC - one source of truth for the tally logic.
        ReportMgt.RefreshStatistics(BudgetNameFilter, StartDate, EndDate);

        ReportMgt.GetOrderedSectionCodes(SectionCodes);
        LineNo := 0;
        foreach SectionCode in SectionCodes do begin
            LineNo += 10;
            SectionLineNo.Add(SectionCode, LineNo);
        end;

        DomainAcctMgrStatistics.Reset();
        DomainAcctMgrStatistics.SetRange(Year, Date2DMY(StartDate, 3), Date2DMY(EndDate, 3));
        if SalespersonFilter <> '' then
            DomainAcctMgrStatistics.SetRange("Salesperson Code", SalespersonFilter);

        if DomainAcctMgrStatistics.FindSet() then
            repeat
                if IsWithinPeriod(DomainAcctMgrStatistics.Year, DomainAcctMgrStatistics."Month No.") then begin
                    AcctMgrBuffer.Init();
                    AcctMgrBuffer."Salesperson Code" := DomainAcctMgrStatistics."Salesperson Code";
                    AcctMgrBuffer."Section Code" := DomainAcctMgrStatistics."Section Code";
                    AcctMgrBuffer.Year := DomainAcctMgrStatistics.Year;
                    AcctMgrBuffer."Month No." := DomainAcctMgrStatistics."Month No.";
                    if SectionLineNo.ContainsKey(DomainAcctMgrStatistics."Section Code") then
                        AcctMgrBuffer."Line No." := SectionLineNo.Get(DomainAcctMgrStatistics."Section Code")
                    else
                        AcctMgrBuffer."Line No." := 999;
                    AcctMgrBuffer."Section Description" := DomainAcctMgrStatistics."Section Description";
                    AcctMgrBuffer."Month Name" := DomainAcctMgrStatistics."Month Name";
                    AcctMgrBuffer."Target Qty" := DomainAcctMgrStatistics."Target Qty";
                    AcctMgrBuffer."Actual Qty" := DomainAcctMgrStatistics."Actual Qty";
                    AcctMgrBuffer."% Achieved" := DomainAcctMgrStatistics."% Achieved";
                    AcctMgrBuffer.Insert();
                end;
            until DomainAcctMgrStatistics.Next() = 0;

        if HideZeroRows then begin
            AcctMgrBuffer.Reset();
            AcctMgrBuffer.SetRange("Target Qty", 0);
            AcctMgrBuffer.SetRange("Actual Qty", 0);
            AcctMgrBuffer.DeleteAll();
        end;
    end;

    local procedure IsWithinPeriod(YearValue: Integer; MonthNo: Integer): Boolean
    var
        PeriodDate: Date;
    begin
        PeriodDate := DMY2Date(1, MonthNo, YearValue);
        exit(PeriodDate <= EndDate);
    end;
}