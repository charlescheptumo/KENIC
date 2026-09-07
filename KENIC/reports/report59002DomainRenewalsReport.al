report 59002 "Domain Renewals Report"
{
    Caption = 'Domain Renewals by Registrar';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './KENIC/layout/Rep59002DomainRenewals.rdlc';

    dataset
    {
        dataitem(RegistrarBuffer; "Registrar Domain Renewal Buf")
        {
            DataItemTableView = sorting("Registrar Name");

           
            column(CompanyInfo_Name; CompanyInfo.Name) { }
            column(CompanyInfo_Picture; CompanyInfo.Picture) { }
            column(CompanyInfo_Address; CompanyInfo.Address) { }
            column(CompanyInfo_Address2; CompanyInfo."Address 2") { }
            column(CompanyInfo_City; CompanyInfo.City) { }
            column(CompanyInfo_Phone; CompanyInfo."Phone No.") { }
            column(CompanyInfo_Email; CompanyInfo."E-Mail") { }

            column(Report_Year; YearFilter) { }

            column(Registrar_Roid; "Registrar Roid") { }
            column(Registrar_Name; "Registrar Name") { }
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
            column(Total; Total) { }
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
                        ToolTip = 'Specifies the year to report domain renewal counts for.';
                    }
                    field(HideZeroRegistrars; HideZeroRegistrars)
                    {
                        Caption = 'Hide Registrars With No Activity';
                        ApplicationArea = All;
                        ToolTip = 'Specifies whether registrars with zero renewals for the selected year should be excluded from the report.';
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
        DomainClient: Record "Domain Client";
        YearFilter: Integer;
        HideZeroRegistrars: Boolean;

    local procedure BuildBuffer()
    var
        FromDateTime: DateTime;
        ToDateTime: DateTime;
        EntryDate: Date;
        MonthNo: Integer;
    begin
        RegistrarBuffer.Reset();
        RegistrarBuffer.DeleteAll();

      
        DomainClient.Reset();
        if DomainClient.FindSet() then
            repeat
                RegistrarBuffer.Init();
                RegistrarBuffer."Registrar Roid" := DomainClient.Roid;
                if DomainClient.Name <> '' then
                    RegistrarBuffer."Registrar Name" := CopyStr(DomainClient.Name, 1, MaxStrLen(RegistrarBuffer."Registrar Name"))
                else
                    RegistrarBuffer."Registrar Name" := DomainClient.Roid;
                RegistrarBuffer.Insert();
            until DomainClient.Next() = 0;

      
        FromDateTime := CreateDateTime(DMY2Date(1, 1, YearFilter), 0T);
        ToDateTime := CreateDateTime(DMY2Date(31, 12, YearFilter), 235959T);

        DomainLedgerEntry.Reset();
        DomainLedgerEntry.SetRange(Created, FromDateTime, ToDateTime);
        DomainLedgerEntry.SetRange(TransType, 'Renewal');

        if DomainLedgerEntry.FindSet() then
            repeat
                if not RegistrarBuffer.Get(DomainLedgerEntry.ClientRoid) then begin
                 
                    RegistrarBuffer.Init();
                    RegistrarBuffer."Registrar Roid" := DomainLedgerEntry.ClientRoid;
                    RegistrarBuffer."Registrar Name" := DomainLedgerEntry.ClientRoid;
                    RegistrarBuffer.Insert();
                end;

                EntryDate := DT2Date(DomainLedgerEntry.Created);
                MonthNo := Date2DMY(EntryDate, 2);
                IncrementMonth(MonthNo);
                RegistrarBuffer.Total += 1;
                RegistrarBuffer.Modify();
            until DomainLedgerEntry.Next() = 0;

        if HideZeroRegistrars then begin
            RegistrarBuffer.Reset();
            RegistrarBuffer.SetRange(Total, 0);
            RegistrarBuffer.DeleteAll();
        end;
    end;

    local procedure IncrementMonth(MonthNo: Integer)
    begin
        case MonthNo of
            1:
                RegistrarBuffer.Jan += 1;
            2:
                RegistrarBuffer.Feb += 1;
            3:
                RegistrarBuffer.Mar += 1;
            4:
                RegistrarBuffer.Apr += 1;
            5:
                RegistrarBuffer.May += 1;
            6:
                RegistrarBuffer.Jun += 1;
            7:
                RegistrarBuffer.Jul += 1;
            8:
                RegistrarBuffer.Aug += 1;
            9:
                RegistrarBuffer.Sep += 1;
            10:
                RegistrarBuffer.Oct += 1;
            11:
                RegistrarBuffer.Nov += 1;
            12:
                RegistrarBuffer.Dec += 1;
        end;
    end;
}