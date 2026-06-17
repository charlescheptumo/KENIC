namespace KICD.KICD;

using Microsoft.HumanResources.Employee;
using Microsoft.HumanResources.Payables;
using Microsoft.Foundation.Company;
using System.Security.AccessControl;
using Microsoft.Finance.Dimension;

report 50116 EmployeeImprestStatements
{
    Caption = 'Employee Standing Imprest Statement';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/EmployeeImprestStatements.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic;

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.", "Global Dimension 1 Code", Balance;


            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4)) { }
            column(CompanyInfo_Address; CompanyInfo.Address) { }
            column(CurrReport_PAGENO; CurrReport.PageNo) { }
            column(CompanyLogo; CompanyInfo.Picture) { }
            column(CompanyInfo_Name; CompanyInfo.Name) { }
            column(CompanyInfo__Address_2_; CompanyInfo."Address 2") { }
            column(CompanyEmail; CompanyInfo."E-Mail") { }
            column(CompanyPhone; CompanyInfo."Phone No.") { }
            column(CompanyCity; CompanyInfo.City) { }
            column(CompanyMotto; CompanyInfo.Motto) { }
            column(CompanyPostCode; CompanyInfo."Post Code") { }
            column(CompanyHomePage; CompanyInfo."Home Page") { }
            column(DocumentTitle; DocumentTitle) { }
            column(Dimension1Name; Codefactory.DimensionName(1, "Global Dimension 1 Code")) { }
            column(Dimension2Name; Codefactory.DimensionName(2, "Global Dimension 2 Code")) { }
            column(EmpFilter; EmpFilter) { }
            column(EmpDateFilter; EmpDateFilter) { }
            column(No_Employee; Employee."No.") { }
            column(EmployeeName; Employee.FullName()) { }
            column(JobTitle_Employee; Employee."Job Title") { }
            column(SearchName_Employee; Employee."Search Name") { }
            column(Address_Employee; Employee.Address) { }
            column(Address2_Employee; Employee."Address 2") { }
            column(City_Employee; Employee.City) { }
            column(PostCode_Employee; Employee."Post Code") { }
            column(Balance_Employee; ClosingBalance) { }
            column(Starting_Balance; StartBalAdjLCY) { }
            column(Closing_Balance; ClosingBalAdjLCY) { }
            column(EmpBalanceLCY_1; EmpBalanceLCY) { }
            column(OpeningBalance; OpeningBalance) { }
            column(Total; Total) { }
            column(Issued; Issued) { }
            column(Surrendered; Surrendered) { }
            column(Surrender_Due_Date; SurrenderDueDate) { }
            column(FiscalYear; GetCurrentFY()) { }
            column(ApprovedLimit; GetEmployeeLimit("No.")) { }
            column(TotalDebitCol; TotalDebit) { }
            column(TotalCreditCol; TotalCredit) { }
            column(TotalRunningBalCol; TotalRunningBal) { }

            dataitem(StandingImprestLimit; "Standing Imprest Limit")
            {
                DataItemLink = "Employee No" = field("No.");
                DataItemTableView = sorting("Employee No");

                column(StandingImprestPostingDate; "Created Date") { }
                column(StandingImprestDocumentNo; 'STIMPISSUED') { }
                column(StandingImprestDescription; 'Standing Imprest Issued') { }
                column(StandingImprestDebitAmount; 0) { }
                column(StandingImprestCreditAmount; Limit) { }
                column(StandingImprestAmount; -Limit) { }
                column(StandingImprestRunningBalance; StandingImprestRunningBal) { }

                trigger OnPreDataItem()
                begin
                    SetFilter("Financial Year", GetCurrentFY());
                end;

                trigger OnAfterGetRecord()
                begin
                    StandingImprestRunningBal := RunningBalance + Limit;
                    TotalCredit += Limit;
                    RunningBalance := StandingImprestRunningBal;
                    TotalRunningBal := RunningBalance;
                end;
            }

            dataitem("Employee Ledger Entry"; "Employee Ledger Entry")
            {
                DataItemLink = "Employee No." = field("No.");

#pragma warning disable AL0254
                DataItemTableView = sorting("Posting Date") order(ascending) WHERE("Imprest Document Type" = FILTER("Standing Imprest" | "Standing Imprest Surrender"));
#pragma warning restore AL0254

                column(EntryPostingDate; "Posting Date") { }
                column(EntryDocumentNo; "Document No.") { }
                column(EntryDescription; Description) { }
                column(EntryDebitAmount; "Debit Amount") { }
                column(EntryCreditAmount; "Credit Amount") { }
                column(EntryAmount; Amount) { }
                column(RunningBalanceField; RunningBalance) { }

                trigger OnPreDataItem()
                begin
                    SetFilter("Posting Date", '%1..%2', 0D, EndDate);
                    SetRange(Reversed, false);
                end;

                trigger OnAfterGetRecord()
                begin
                    "Employee Ledger Entry".CalcFields("Debit Amount", "Credit Amount", Amount);
                    TotalDebit += "Employee Ledger Entry"."Debit Amount";
                    TotalCredit += "Employee Ledger Entry"."Credit Amount";
                    RunningBalance -= "Employee Ledger Entry".Amount;
                    TotalRunningBal := RunningBalance;
                end;

            }

            trigger OnAfterGetRecord()
            begin
                CalcFields(Balance);
                Issued := 0;
                Surrendered := 0;

                EmpLedger.Reset();
                EmpLedger.SetRange("Employee No.", "No.");
                EmpLedger.SetFilter("Posting Date", '..%1', 0D);
                if EmpLedger.FindSet() then begin
                    OpeningBalance := 0;
                    repeat
                        EmpLedger.CalcFields(Amount, "Amount (LCY)");
                        OpeningBalance += EmpLedger."Amount (LCY)";
                    until EmpLedger.next() = 0;
                end;

                EmpLedger.Reset();
                EmpLedger.SetRange("Employee No.", "No.");
                EmpLedger.SetFilter("Posting Date", '%1..%2', 0D, EndDate);
                EmpLedger.SetRange(Reversed, false);
                if EmpLedger.FindSet() then begin
                    repeat
                        EmpLedger.CalcFields("Credit Amount", "Debit Amount", Amount);
                        Issued += Abs(EmpLedger."Credit Amount");
                        Surrendered += Abs(EmpLedger."Debit Amount");
                        Total += EmpLedger.Amount;
                        ClosingBalance += EmpLedger.Amount;
                    until EmpLedger.next() = 0;
                end;

                ClosingBalance := OpeningBalance + ClosingBalance;
                RunningBalance := OpeningBalance;
                TotalDebit := 0;
                TotalCredit := 0;
                TotalRunningBal := 0;
            end;

            trigger OnPreDataItem()
            var
                ImprestLimit: Record "Standing Imprest Limit";
                EmpNoFilter: Text;
            begin
                if CompanyInfo.Get() then
                    CompanyInfo.CalcFields(CompanyInfo.Picture);

                Company.Get();
                Company.CalcFields(Company.Picture);
                SetFilter("Date Filter", '%1..%2', 0D, EndDate);
                if (EndDate = 0D) then
                    error('You must input a date filter');

                EmpNoFilter := GetFilter("No.");
                if EmpNoFilter = '' then begin
                    ImprestLimit.Reset();
                    ImprestLimit.SetFilter("Financial Year", GetCurrentFY());
                    if ImprestLimit.FindSet() then begin
                        EmpNoFilter := '';
                        repeat
                            if EmpNoFilter = '' then
                                EmpNoFilter := ImprestLimit."Employee No"
                            else
                                EmpNoFilter := EmpNoFilter + '|' + ImprestLimit."Employee No";
                        until ImprestLimit.Next() = 0;
                        SetFilter("No.", EmpNoFilter);
                    end else
                        SetRange("No.", '');
                end;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                Group(Filters)
                {
                    ShowCaption = false;
                    field("Start Date"; StartDate)
                    {
                        ApplicationArea = Basic;
                        Visible = false;
                    }
                    field("End Date"; EndDate) { ApplicationArea = Basic; }
                }
            }
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
    end;

    var
        EmployeeLedgerEntry: Record "Employee Ledger Entry";
        CurrEmpLedger: Record "Employee Ledger Entry";
        EmpFilter: Text[250];
        EmpDateFilter: Text[30];
        EmpAmount: Decimal;
        EmpRemainAmount: Decimal;
        EmpBalanceLCY: Decimal;
        EmpEntryDueDate: Date;
        StartBalanceLCY: Decimal;
        StartBalAdjLCY: Decimal;
        Correction: Decimal;
        ApplicationRounding: Decimal;
        ExcludeBalanceOnly: Boolean;
        PrintAmountsInLCY: Boolean;
        PrintOnlyOnePerPage: Boolean;
        EmpLedgEntryExists: Boolean;
        AmountCaption: Text[30];
        RemainingAmtCaption: Text[30];
        EmpCurrencyCode: Code[10];
        CompanyInfo: Record "Company Information";
        MinBal: Decimal;
        UsersID: Record User;
        Totals: Decimal;
        TotalDebit: Decimal;
        TotalCredit: Decimal;
        TotalRunningBal: Decimal;


        Text000: label 'Period: %1';
        Employee_StatementCaptionLbl: label 'Employee Statement';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        All_amounts_are_in_LCYCaptionLbl: label 'All amounts are in LCY';
        EmpBalanceLCY__1_Control40CaptionLbl: label 'Balance (LCY)';
        Employee_No_CaptionLbl: label 'Employee No.';
        NamesCaptionLbl: label 'Names';
        Account_TypeCaptionLbl: label 'Account Type';
        Staff_No_CaptionLbl: label 'Staff No.';
        Adj__of_Opening_BalanceCaptionLbl: label 'Adj. of Opening Balance';
        Total_BalanceCaptionLbl: label 'Total Balance';
        Total_Balance_Before_PeriodCaptionLbl: label 'Total Balance Before Period';
        Available_BalanceCaptionLbl: label 'Available Balance';
        ContinuedCaptionLbl: label 'Continued';
        ContinuedCaption_Control46Lbl: label 'Continued';
        Company: Record "Company Information";
        ClosingBalAdjLCY: Decimal;
        TempString: Text;
        FromDate: Text;
        ToDate: Text;
        RunningBalance: Decimal;
        CurrentAmount: Decimal;
        DocumentTitle: Label 'EMPLOYEE STANDING IMPREST STATEMENT';
        Codefactory: Codeunit "Custom Function";
        OpeningBalance: Decimal;
        Issued: Decimal;
        Surrendered: Decimal;
        Total: Decimal;
        Emp: Record Employee;
        StartDate: Date;
        EndDate: Date;
        EmpLedger: Record "Employee Ledger Entry";
        DtlEmpLedger: Record "Detailed Employee Ledger Entry";
        SurrenderDueDate: Date;
        ClosingBalance: Decimal;
        StandingImprestRunningBal: Decimal;

    procedure DimensionName(DimensionNo: Integer; DimensionCode: Code[20]): Text
    var
        DimensionValues: Record "Dimension Value";
    begin
        DimensionValues.Reset();
        DimensionValues.SetRange("Global Dimension No.", DimensionNo);
        DimensionValues.SetRange(Code, DimensionCode);
        if DimensionValues.FindFirst() then
            exit(DimensionValues.Name);
    end;

    local procedure GetCurrentFY(): Code[20]
    var
        Setup: Record "Cash Management Setup";
    begin
        if Setup.Get() then
            exit(Setup."Current Financial Year");
        exit('');
    end;

    local procedure GetEmployeeLimit(EmpNo: Code[20]): Decimal
    var
        ImprestLimit: Record "Standing Imprest Limit";
    begin
        ImprestLimit.Reset();
        ImprestLimit.SetRange("Employee No", EmpNo);
        if ImprestLimit.FindFirst() then
            exit(ImprestLimit.Limit);
        exit(0);
    end;
}