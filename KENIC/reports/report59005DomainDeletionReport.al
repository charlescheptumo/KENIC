report 59005 "Domain Deletion Report"
{
    Caption = 'Domain Deletion Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './KENIC/layout/Rep59005DomainDeletion.rdlc';

    dataset
    {
        dataitem(DeletionBuffer; "Domain Deletion Buffer")
        {
            DataItemTableView = sorting("Registrar Name", Year, "Month No.");

            column(CompanyInfo_Name; CompanyInfo.Name) { }
            column(CompanyInfo_Picture; CompanyInfo.Picture) { }
            column(CompanyInfo_Address; CompanyInfo.Address) { }
            column(CompanyInfo_Address2; CompanyInfo."Address 2") { }
            column(CompanyInfo_City; CompanyInfo.City) { }
            column(CompanyInfo_Phone; CompanyInfo."Phone No.") { }
            column(CompanyInfo_Email; CompanyInfo."E-Mail") { }

            column(Start_Date; StartDate) { }
            column(End_Date; EndDate) { }

            column(Registrar_Roid; "Registrar Roid") { }
            column(Registrar_Name; "Registrar Name") { }
            column(Year; Year) { }
            column(Month_No; "Month No.") { }
            column(Month_Name; "Month Name") { }
            column(Registration_Count; "Registration Count") { }
            column(Renewal_Count; "Renewal Count") { }
            column(Deleted_Count; "Deleted Count") { }
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
                    field(RegistrarFilter; RegistrarFilter)
                    {
                        Caption = 'Registrar';
                        ApplicationArea = All;
                        TableRelation = "Domain Client".Roid;
                        ToolTip = 'Specifies an optional registrar (e.g. Aheri) to filter the report to.';
                    }
                    field(HideZeroRows; HideZeroRows)
                    {
                        Caption = 'Hide Rows With No Activity';
                        ApplicationArea = All;
                        ToolTip = 'Specifies whether rows with zero registrations and zero renewals should be excluded.';
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
        DomainDeletionStatistics: Record "Domain Deletion Statistics";
        ReportMgt: Codeunit "Domain Deletion Report Mgt";
        StartDate: Date;
        EndDate: Date;
        RegistrarFilter: Code[50];
        HideZeroRows: Boolean;

    local procedure BuildBuffer()
    begin
        DeletionBuffer.Reset();
        DeletionBuffer.DeleteAll();

        ReportMgt.RefreshStatistics(StartDate, EndDate);

        DomainDeletionStatistics.Reset();
        DomainDeletionStatistics.SetRange(Year, Date2DMY(StartDate, 3), Date2DMY(EndDate, 3));
        if RegistrarFilter <> '' then
            DomainDeletionStatistics.SetRange("Registrar Roid", RegistrarFilter);

        if DomainDeletionStatistics.FindSet() then
            repeat
                if IsWithinPeriod(DomainDeletionStatistics.Year, DomainDeletionStatistics."Month No.") then begin
                    DeletionBuffer.Init();
                    DeletionBuffer."Registrar Roid" := DomainDeletionStatistics."Registrar Roid";
                    DeletionBuffer.Year := DomainDeletionStatistics.Year;
                    DeletionBuffer."Month No." := DomainDeletionStatistics."Month No.";
                    DeletionBuffer."Registrar Name" := DomainDeletionStatistics."Registrar Name";
                    DeletionBuffer."Month Name" := DomainDeletionStatistics."Month Name";
                    DeletionBuffer."Registration Count" := DomainDeletionStatistics."Registration Count";
                    DeletionBuffer."Renewal Count" := DomainDeletionStatistics."Renewal Count";
                    DeletionBuffer."Deleted Count" := DomainDeletionStatistics."Deleted Count";
                    DeletionBuffer.Insert();
                end;
            until DomainDeletionStatistics.Next() = 0;

        if HideZeroRows then begin
            DeletionBuffer.Reset();
            DeletionBuffer.SetRange("Registration Count", 0);
            DeletionBuffer.SetRange("Renewal Count", 0);
            DeletionBuffer.DeleteAll();
        end;
    end;

    local procedure IsWithinPeriod(YearValue: Integer; MonthNo: Integer): Boolean
    var
        PeriodDate: Date;
    begin
        PeriodDate := DMY2Date(1, MonthNo, YearValue);
        exit((PeriodDate >= StartDate) and (PeriodDate <= EndDate));
    end;
}