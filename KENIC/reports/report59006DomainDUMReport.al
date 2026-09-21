report 59218 "Domain DUM Report"
{
    Caption = 'Domains Under Management Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './KENIC/layout/Rep59006DomainDUM.rdlc';

    dataset
    {
        dataitem(DUMBuffer; "Domain DUM Buffer")
        {
            DataItemTableView = sorting("Line No.");

            column(CompanyInfo_Name; CompanyInfo.Name) { }
            column(CompanyInfo_Picture; CompanyInfo.Picture) { }
            column(CompanyInfo_Address; CompanyInfo.Address) { }
            column(CompanyInfo_Address2; CompanyInfo."Address 2") { }
            column(CompanyInfo_City; CompanyInfo.City) { }
            column(CompanyInfo_Phone; CompanyInfo."Phone No.") { }
            column(CompanyInfo_Email; CompanyInfo."E-Mail") { }

            column(As_Of_Date; AsOfDate) { }

            column(Registrar_Roid; "Registrar Roid") { }
            column(Registrar_Name; "Registrar Name") { }
            column(DUM_Count; "DUM Count") { }
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

                    field(AsOfDate; AsOfDate)
                    {
                        Caption = 'As Of Date';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the snapshot date - only ledger activity up to and including this date is considered.';
                    }
                    field(ExcludedTransTypeFilter; ExcludedTransTypeFilter)
                    {
                        Caption = 'Excluded Transaction Type';
                        ApplicationArea = All;
                        ToolTip = 'Specifies a Transaction Type (e.g. Deletion) whose domains should be excluded when it is the most recent event for that domain. Leave blank to count every domain ever seen as active.';
                    }
                    field(RegistrarFilter; RegistrarFilter)
                    {
                        Caption = 'Registrar';
                        ApplicationArea = All;
                        TableRelation = "Domain Client".Roid;
                        ToolTip = 'Specifies an optional registrar to filter the report to.';
                    }
                    field(HideZeroRegistrars; HideZeroRegistrars)
                    {
                        Caption = 'Hide Registrars With No Active Domains';
                        ApplicationArea = All;
                        ToolTip = 'Specifies whether registrars with a DUM Count of 0 should be excluded from the report.';
                    }
                }
            }
        }

        trigger OnOpenPage()
        begin
            if AsOfDate = 0D then
                AsOfDate := Today;
        end;
    }

    trigger OnPreReport()
    begin
        if AsOfDate = 0D then
            Error('Please specify an As Of Date.');

        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
        BuildBuffer();
    end;

    var
        CompanyInfo: Record "Company Information";
        DomainDUMStatistics: Record "Domain DUM Statistics";
        ReportMgt: Codeunit "Domain DUM Report Mgt";
        AsOfDate: Date;
        ExcludedTransTypeFilter: Text[50];
        RegistrarFilter: Code[50];
        HideZeroRegistrars: Boolean;

    local procedure BuildBuffer()
    var
        LineNo: Integer;
        GrandTotal: Integer;
    begin
        DUMBuffer.Reset();
        DUMBuffer.DeleteAll();

        ReportMgt.RefreshStatistics(AsOfDate, ExcludedTransTypeFilter);

        DomainDUMStatistics.Reset();
        DomainDUMStatistics.SetRange("As Of Date", AsOfDate);
        DomainDUMStatistics.SetCurrentKey("Registrar Name");
        if RegistrarFilter <> '' then
            DomainDUMStatistics.SetRange("Registrar Roid", RegistrarFilter);

        LineNo := 0;
        if DomainDUMStatistics.FindSet() then
            repeat
                LineNo += 10;
                DUMBuffer.Init();
                DUMBuffer."Registrar Roid" := DomainDUMStatistics."Registrar Roid";
                DUMBuffer."Line No." := LineNo;
                DUMBuffer."Registrar Name" := DomainDUMStatistics."Registrar Name";
                DUMBuffer."DUM Count" := DomainDUMStatistics."DUM Count";
                DUMBuffer.Insert();
                GrandTotal += DomainDUMStatistics."DUM Count";
            until DomainDUMStatistics.Next() = 0;

        if HideZeroRegistrars then begin
            DUMBuffer.Reset();
            DUMBuffer.SetRange("DUM Count", 0);
            DUMBuffer.DeleteAll();
        end;

        // Grand total row, shown last - matches the "Total DUM" line in the source sheet.
        DUMBuffer.Init();
        DUMBuffer."Registrar Roid" := 'TOTAL';
        DUMBuffer."Line No." := 999999;
        DUMBuffer."Registrar Name" := 'Total DUM';
        DUMBuffer."DUM Count" := GrandTotal;
        DUMBuffer.Insert();
    end;
}