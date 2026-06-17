report 50114 "Standing Imprest Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/StandingImprestSummary.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = sorting("No.") order(ascending);

            column(EmployeeNo; "No.") { }
            column(EmployeeName; "First Name" + ' ' + "Last Name") { }
            column(Limit; GetEmployeeLimit("No.")) { }
            column(OriginalIssueAmount; GetOriginalIssue("No.")) { }
            column(TotalInterimRetirement; GetInterimRetirement("No.")) { }
            column(TotalSurrendered; GetSurrender("No.")) { }
            column(CurrentBalance; GetOriginalIssue("No.") + GetInterimRetirement("No.") - GetSurrender("No.")) { }
            column(ReportDate; Today) { }
            column(CompanyLogo; CompanyInfo.Picture) { }
            column(CompanyName; CompanyInfo.Name) { }
            column(CompanyAddress; CompanyInfo.Address) { }
            column(CompanyAddress2; CompanyInfo."Address 2") { }
            column(CompanyPostCode; CompanyInfo."Post Code") { }
            column(CompanyCity; CompanyInfo.City) { }
            column(CompanyPhone; CompanyInfo."Phone No.") { }
            column(CompanyFax; CompanyInfo."Fax No.") { }
            column(CompanyEmail; CompanyInfo."E-Mail") { }
            column(CompanyWebsite; CompanyInfo."Home Page") { }

        }
    }

    requestpage
    {
        layout
        {
        }
        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        CompanyInfo: Record "Company Information";

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


    local procedure GetOriginalIssue(EmpNo: Code[20]): Decimal
    var
        DetEmpLedger: Record "Detailed Employee Ledger Entry";
    begin
        DetEmpLedger.Reset();
        DetEmpLedger.SetRange("Employee No.", EmpNo);
        DetEmpLedger.CalcSums(Amount);
        exit(DetEmpLedger.Amount);
    end;

    local procedure GetInterimRetirement(EmpNo: Code[20]): Decimal
    var
        Payments: Record Payments;
        Total: Decimal;
    begin
        Total := 0;
        Payments.Reset();
        Payments.SetRange("Payment Type", Payments."Payment Type"::"Standing Imprest");
        Payments.SetRange("Account No.", EmpNo);
        Payments.SetRange("Financial Year", GetCurrentFY());
        Payments.SetRange("Interim Standing Imprest", true);
        if Payments.FindSet() then
            repeat
                Total := Total + Payments."Total Amount";
            until Payments.Next() = 0;
        exit(Total);
    end;

    local procedure GetSurrender(EmpNo: Code[20]): Decimal
    var
        Payments: Record Payments;
        Total: Decimal;
    begin
        Total := 0;
        Payments.Reset();
        Payments.SetRange("Payment Type", Payments."Payment Type"::"Standing Imprest Surrender");
        Payments.SetRange("Account No.", EmpNo);
        Payments.SetRange("Financial Year", GetCurrentFY());
        if Payments.FindSet() then
            repeat
                Total := Total + Payments."Total Amount";
            until Payments.Next() = 0;
        exit(Total);
    end;

    local procedure GetCurrentFY(): Code[20]
    var
        Setup: Record "Cash Management Setup";
    begin
        if Setup.Get() then
            exit(Setup."Current Financial Year");
        exit('');
    end;
}