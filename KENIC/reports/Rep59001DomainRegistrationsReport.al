report 59001 "Domain Registrations Report"
{
    Caption = 'Domain Registrations by Registrar';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './KENIC/layout/Rep59001DomainRegistrations.rdlc';

    dataset
    {
        dataitem(RegistrarBuffer; "Registrar Domain Count Buffer")
        {
            DataItemTableView = sorting("Registrar Name");

            column(CompanyInfo_Name; CompanyInfo.Name) { }
            column(CompanyInfo_Picture; CompanyInfo.Picture) { }
            column(CompanyInfo_Address; CompanyInfo.Address) { }
            column(CompanyInfo_Address2; CompanyInfo."Address 2") { }
            column(CompanyInfo_City; CompanyInfo.City) { }
            column(CompanyInfo_Phone; CompanyInfo."Phone No.") { }
            column(CompanyInfo_Email; CompanyInfo."E-Mail") { }

            column(Report_Period; PeriodText) { }

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
            
           
            column(Year_Jan; Year_Jan) { }
            column(Year_Feb; Year_Feb) { }
            column(Year_Mar; Year_Mar) { }
            column(Year_Apr; Year_Apr) { }
            column(Year_May; Year_May) { }
            column(Year_Jun; Year_Jun) { }
            column(Year_Jul; Year_Jul) { }
            column(Year_Aug; Year_Aug) { }
            column(Year_Sep; Year_Sep) { }
            column(Year_Oct; Year_Oct) { }
            column(Year_Nov; Year_Nov) { }
            column(Year_Dec; Year_Dec) { }
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
                        Caption = 'From Date';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the start of the period to report domain registration counts for.';
                    }
                    field(EndDate; EndDate)
                    {
                        Caption = 'To Date';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the end of the period to report domain registration counts for.';
                    }
                    field(HideZeroRegistrars; HideZeroRegistrars)
                    {
                        Caption = 'Hide Registrars With No Activity';
                        ApplicationArea = All;
                        ToolTip = 'Specifies whether registrars with zero domains for the selected period should be excluded from the report.';
                    }
                }
            }
        }

        trigger OnOpenPage()
        begin
            HideZeroRegistrars := true;

            if StartDate = 0D then
                StartDate := CalcDate('<-CM>', Today);
            if EndDate = 0D then
                EndDate := Today;
        end;
    }

    trigger OnPreReport()
    begin
        if StartDate = 0D then
            Error('Please specify a From Date.');
        if EndDate = 0D then
            Error('Please specify a To Date.');
        if StartDate > EndDate then
            Error('From Date cannot be after To Date.');

        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
        PeriodText := Format(StartDate) + ' .. ' + Format(EndDate);
        BuildBuffer();
    end;

    var
        CompanyInfo: Record "Company Information";
        DomainLedgerEntry: Record "Domain Ledger Entry";
        DomainClient: Record "Domain Client";
        StartDate: Date;
        EndDate: Date;
        PeriodText: Text[50];
        HideZeroRegistrars: Boolean;

    local procedure BuildBuffer()
    var
        FromDateTime: DateTime;
        ToDateTime: DateTime;
        EntryDate: Date;
        MonthNo: Integer;
        YearNo: Integer;
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

        FromDateTime := CreateDateTime(StartDate, 0T);
        ToDateTime := CreateDateTime(EndDate, 235959T);

        DomainLedgerEntry.Reset();
        DomainLedgerEntry.SetRange(Created, FromDateTime, ToDateTime);
        DomainLedgerEntry.SetRange(TransType, 'Registration');

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
                YearNo := Date2DMY(EntryDate, 3);
                
                IncrementMonthWithYear(MonthNo, YearNo);
                
                RegistrarBuffer.Total += 1;
                RegistrarBuffer.Modify();
            until DomainLedgerEntry.Next() = 0;

        if HideZeroRegistrars then begin
            RegistrarBuffer.Reset();
            RegistrarBuffer.SetRange(Total, 0);
            RegistrarBuffer.DeleteAll();
        end;
    end;

    local procedure IncrementMonthWithYear(MonthNo: Integer; YearNo: Integer)
    begin
        case MonthNo of
            1:
                begin
                    RegistrarBuffer.Jan += 1;
                    RegistrarBuffer.Year_Jan := YearNo;
                end;
            2:
                begin
                    RegistrarBuffer.Feb += 1;
                    RegistrarBuffer.Year_Feb := YearNo;
                end;
            3:
                begin
                    RegistrarBuffer.Mar += 1;
                    RegistrarBuffer.Year_Mar := YearNo;
                end;
            4:
                begin
                    RegistrarBuffer.Apr += 1;
                    RegistrarBuffer.Year_Apr := YearNo;
                end;
            5:
                begin
                    RegistrarBuffer.May += 1;
                    RegistrarBuffer.Year_May := YearNo;
                end;
            6:
                begin
                    RegistrarBuffer.Jun += 1;
                    RegistrarBuffer.Year_Jun := YearNo;
                end;
            7:
                begin
                    RegistrarBuffer.Jul += 1;
                    RegistrarBuffer.Year_Jul := YearNo;
                end;
            8:
                begin
                    RegistrarBuffer.Aug += 1;
                    RegistrarBuffer.Year_Aug := YearNo;
                end;
            9:
                begin
                    RegistrarBuffer.Sep += 1;
                    RegistrarBuffer.Year_Sep := YearNo;
                end;
            10:
                begin
                    RegistrarBuffer.Oct += 1;
                    RegistrarBuffer.Year_Oct := YearNo;
                end;
            11:
                begin
                    RegistrarBuffer.Nov += 1;
                    RegistrarBuffer.Year_Nov := YearNo;
                end;
            12:
                begin
                    RegistrarBuffer.Dec += 1;
                    RegistrarBuffer.Year_Dec := YearNo;
                end;
        end;
    end;
}