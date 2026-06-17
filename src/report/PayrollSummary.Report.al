#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
Report 69040 "Payroll Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayouts/Payroll Reconciliation Summary.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem(EarningsX; EarningsX)
        {
            PrintOnlyIfDetail = false;
            RequestFilterFields = "Pay Period Filter", "Posting Group Filter";
            column(ReportForNavId_1000000000; 1000000000) { }
            column(EarningsX_Code; EarningsX.Code) { }
            column(EarningsX_Description; EarningsX.Description) { }
            column(EarningsX_PostingGroupFilter; EarningsX."Posting Group Filter") { }
            column(ThisMonthVal; ThisMonthVal) { }
            column(LastMonthVal; LastMonthVal) { }
            column(Difference; Difference) { }
            column(Thismonth; Thismonth) { }
            column(Lastmonth; Lastmonth) { }
            column(SerialNo1; SerialNo) { }
            column(TotalEmployees; TotalEmployees) { }
            column(TotalEmployeesLastMonth; TotalEmployeesLastMonth) { }
            column(NetPayThisMonth; NetPayThisMonth) { }
            column(NetPayLastMonth; NetPayLastMonth) { }
            column(GrosspayThisMonth; GrosspayThisMonth) { }
            column(GrosspayLastMonth; GrosspayLastMonth) { }
            column(DisabilityLastMonth; DisabilityLastMonth) { }
            column(DisabilityThisMonth; DisabilityThisMonth) { }
            column(OwnerOccupierInterestThisMonth; OwnerOccupierInterestThisMonth) { }
            column(InsuranceThisMonth; InsuranceThisMonth) { }
            column(PersonalReliefThisMonth; PersonalReliefThisMonth) { }
            column(GratuityThisMonth; GratuityThisMonth) { }
            column(PersonalReliefLastMonth; PersonalReliefLastMonth) { }
            column(InsuranceLastMonth; InsuranceLastMonth) { }
            column(OwnerOccupierInterestLastMonth; OwnerOccupierInterestLastMonth) { }
            column(GratuityLastMonth; GratuityLastMonth) { }
            column(Difference2; Difference) { }
            column(iceaemployerthismonth; iceaemployerthismonth) { }
            column(Nssfemployerthismonth; Nssfemployerthismonth) { }
            column(housingemployerthismonth; housingemployerthismonth) { }
            column(SHIFRELIEF; SHIFRELIEF) { }
            column(TotalEarnings; TotalEarnings) { }
            column(EmpPostingGroup; EmpPostingGroup) { }
            column(TotalNet; TotalNet) { }

            dataitem("Integer"; "Integer")
            {
                DataItemTableView = sorting(Number);
                MaxIteration = 1;
                column(ReportForNavId_1000000027; 1000000027) { }
                column(CompanyInfoName; CompanyInfo.Name) { }
                column(CompanyInfoPicture; CompanyInfo.Picture) { }

                trigger OnPreDataItem()
                begin
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CompanyInfo.Get;
                CompanyInfo.CalcFields(Picture);

                if EarningsX."Non-Cash Benefit" = true then
                    CurrReport.Skip;

                EarningsX.SetRange("Pay Period Filter", Thismonth);
                if EmpPostingGroup <> '' then
                    EarningsX.SetRange("Posting Group Filter", EmpPostingGroup);
                EarningsX.CalcFields("Total Amount");
                ThisMonthVal := EarningsX."Total Amount";
                TotalEarnThisMonth := TotalEarnThisMonth + ThisMonthVal;
                TotalEarnings := TotalEarnThisMonth;

                EarningsX.SetRange("Pay Period Filter", Lastmonth);
                if EmpPostingGroup <> '' then
                    EarningsX.SetRange("Posting Group Filter", EmpPostingGroup);
                EarningsX.CalcFields("Total Amount");
                LastMonthVal := EarningsX."Total Amount";
                TotalEarnLastMonth := TotalEarnLastMonth + LastMonthVal;
                TotalEarnings1 := TotalEarnLastMonth;

                Difference := ThisMonthVal - LastMonthVal;
                SerialNo := SerialNo + 1;
            end;

            trigger OnPreDataItem()
            begin
                EmpPostingGroup := GetRangeMin("Posting Group Filter");
                Thismonth := GetRangeMin("Pay Period Filter");
                Lastmonth := CalcDate('-1M', Thismonth);

                if EmpPostingGroup <> '' then
                    SetRange("Posting Group Filter", EmpPostingGroup);
                if Thismonth <> 0D then
                    SetRange("Pay Period Filter", Thismonth);

                Employee1.SetRange("Employee Posting Group", EmpPostingGroup);
                Assignmat.SetRange("Posting Group Filter", EmpPostingGroup);
                Earn.SetRange("Posting Group Filter", EmpPostingGroup);

                TotalEmployees := 0;
                TotalEmployeesLastMonth := 0;
                Employee1.Reset;
                Employee1.SetRange(Employee1."Pay Period Filter", Thismonth);
                Employee1.SetRange(Status, Employee1.Status::Active);
                Employee1.SetRange("Employee Posting Group", EmpPostingGroup);
                if Employee1.FindFirst then begin
                    repeat
                        Employee1.CalcFields(Employee1."Total Allowances1", Employee1."Total Deductions");
                        if Employee1."Total Allowances1" > 0 then
                            TotalEmployees := TotalEmployees + 1;
                    until Employee1.Next = 0;
                end;

                Employee1.Reset;
                Employee1.SetRange(Employee1."Pay Period Filter", Lastmonth);
                Employee1.SetRange(Status, Employee1.Status::Active);
                Employee1.SetRange("Employee Posting Group", EmpPostingGroup);
                if Employee1.FindFirst then begin
                    repeat
                        Employee1.CalcFields(Employee1."Total Allowances1", Employee1."Total Deductions");
                        if Employee1."Total Allowances1" > 0 then
                            TotalEmployeesLastMonth := TotalEmployeesLastMonth + 1;
                    until Employee1.Next = 0;
                end;

                NetPayThisMonth := 0;
                NetPayLastMonth := 0;
                Difference := 0;
                DisabilityThisMonth := 0;
                DisabilityLastMonth := 0;
                GratuityThisMonth := 0;
                GratuityLastMonth := 0;
                InsuranceThisMonth := 0;
                InsuranceLastMonth := 0;
                OwnerOccupierInterestLastMonth := 0;
                OwnerOccupierInterestThisMonth := 0;
                PersonalReliefThisMonth := 0;
                PersonalReliefLastMonth := 0;
                CompanyInfo.Get;
                CompanyInfo.CalcFields(Picture);

                Employee1.Reset;
                Employee1.SetRange(Employee1."Pay Period Filter", Thismonth);
                Employee1.SetRange(Status, Employee1.Status::Active);
                Employee1.SetRange(Employee1."Employee Posting Group", EmpPostingGroup);
                if Employee1.FindFirst then begin
                    repeat
                        Employee1.CalcFields(Employee1."Total Allowances1", Employee1."Total Deductions", Employee1."Total Gratuity Amount", Employee1."Relief Amount", Employee1."Owner Occupier");
                        NetPayThisMonth := NetPayThisMonth + Employee1."Total Allowances1" + Employee1."Total Deductions";
                    until Employee1.Next = 0;
                end;

                Employee1.Reset;
                Employee1.SetRange(Employee1."Pay Period Filter", Lastmonth);
                Employee1.SetRange(Status, Employee1.Status::Active);
                Employee1.SetRange("Employee Posting Group", EmpPostingGroup);
                if Employee1.FindFirst then begin
                    repeat
                        Employee1.CalcFields(Employee1."Total Allowances1", Employee1."Total Deductions", Employee1."Total Gratuity Amount", Employee1."Relief Amount", Employee1."Owner Occupier");
                        NetPayLastMonth := NetPayLastMonth + Employee1."Total Allowances1" + Employee1."Total Deductions";
                    until Employee1.Next = 0;
                end;

                Difference := NetPayThisMonth - NetPayLastMonth;

                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Tax Relief");
                Earn.SetRange(Earn."Calculation Method", Earn."Calculation Method"::"Flat amount");
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        Assignmat.SetRange(Code, Earn.Code);
                        Assignmat.SetRange(Assignmat."Posting Group Filter", EmpPostingGroup);
                        if Assignmat.Find('-') then begin
                            repeat
                                PersonalReliefThisMonth := PersonalReliefThisMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Tax Relief");
                Earn.SetRange(Earn."Calculation Method", Earn."Calculation Method"::"Flat amount");
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Lastmonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        Assignmat.SetRange(Code, Earn.Code);
                        Assignmat.SetRange(Assignmat."Posting Group Filter", EmpPostingGroup);
                        if Assignmat.Find('-') then begin
                            repeat
                                PersonalReliefLastMonth := PersonalReliefLastMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::Gratuity);
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        Assignmat.SetRange(Code, Earn.Code);
                        Assignmat.SetRange("Posting Group Filter", EmpPostingGroup);
                        if Assignmat.Find('-') then begin
                            repeat
                                if IsEmployeeActive(Assignmat."Employee No", Thismonth) then
                                    GratuityThisMonth := GratuityThisMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::Gratuity);
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Lastmonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        Assignmat.SetRange(Code, Earn.Code);
                        Assignmat.SetRange("Posting Group Filter", EmpPostingGroup);
                        if Assignmat.Find('-') then begin
                            repeat
                                if IsEmployeeActive(Assignmat."Employee No", Lastmonth) then
                                    GratuityLastMonth := GratuityLastMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Insurance Relief");
                EarningsX.SetRange(EarningsX."Posting Group Filter", EmpPostingGroup);
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        Assignmat.SetRange("Posting Group Filter", EmpPostingGroup);
                        Assignmat.SetRange(Code, Earn.Code);
                        if Assignmat.Find('-') then begin
                            repeat
                                if IsEmployeeActive(Assignmat."Employee No", Thismonth) then
                                    InsuranceThisMonth := InsuranceThisMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Insurance Relief");
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Lastmonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        Assignmat.SetRange("Posting Group Filter", EmpPostingGroup);
                        Assignmat.SetRange(Code, Earn.Code);
                        if Assignmat.Find('-') then begin
                            repeat
                                if IsEmployeeActive(Assignmat."Employee No", Lastmonth) then
                                    InsuranceLastMonth := InsuranceLastMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Owner Occupier");
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        Assignmat.SetRange(Code, Earn.Code);
                        Assignmat.SetRange("Posting Group Filter", EmpPostingGroup);
                        if Assignmat.Find('-') then begin
                            repeat
                                if IsEmployeeActive(Assignmat."Employee No", Thismonth) then
                                    OwnerOccupierInterestThisMonth := OwnerOccupierInterestThisMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Owner Occupier");
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Lastmonth);
                        Assignmat.SetRange(Code, Earn.Code);
                        Assignmat.SetRange("Posting Group Filter", EmpPostingGroup);
                        if Assignmat.Find('-') then begin
                            repeat
                                if IsEmployeeActive(Assignmat."Employee No", Lastmonth) then
                                    OwnerOccupierInterestLastMonth := OwnerOccupierInterestLastMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"PWD Relief");
                Earn.SetRange(Earn."Non-Cash Benefit", true);
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        Assignmat.SetRange(Code, Earn.Code);
                        Assignmat.SetRange("Posting Group Filter", EmpPostingGroup);
                        if Assignmat.Find('-') then begin
                            repeat
                                if IsEmployeeActive(Assignmat."Employee No", Thismonth) then
                                    DisabilityThisMonth := DisabilityThisMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"PWD Relief");
                Earn.SetRange(Earn."Non-Cash Benefit", true);
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Lastmonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        Assignmat.SetRange(Code, Earn.Code);
                        Assignmat.SetRange("Posting Group Filter", EmpPostingGroup);
                        if Assignmat.Find('-') then begin
                            repeat
                                if IsEmployeeActive(Assignmat."Employee No", Lastmonth) then
                                    DisabilityLastMonth := DisabilityLastMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Normal Earning");
                Earn.SetRange(Earn."Non-Cash Benefit", false);
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        Assignmat.SetRange(Code, Earn.Code);
                        Assignmat.SetRange("Posting Group Filter", EmpPostingGroup);
                        if Assignmat.Find('-') then begin
                            repeat
                                if IsEmployeeActive(Assignmat."Employee No", Thismonth) then
                                    GrosspayThisMonth := GrosspayThisMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Normal Earning");
                Earn.SetRange(Earn."Non-Cash Benefit", false);
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Lastmonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        Assignmat.SetRange(Code, Earn.Code);
                        Assignmat.SetRange("Posting Group Filter", EmpPostingGroup);
                        if Assignmat.Find('-') then begin
                            repeat
                                if IsEmployeeActive(Assignmat."Employee No", Lastmonth) then
                                    GrosspayLastMonth := GrosspayLastMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                Assignmat.Reset;
                Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                Assignmat.SetRange("Posting Group Filter", EmpPostingGroup);
                Assignmat.SetRange(Code, 'AHL');
                if Assignmat.Findset then begin
                    repeat
                        housingemployerthismonth := housingemployerthismonth + Assignmat."Employer Amount";
                    until Assignmat.Next = 0;
                end;

                Assignmat.Reset;
                Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                Assignmat.SetRange(Type, Assignmat.Type::Deduction);
                Assignmat.SetRange(Code, 'D056');
                Assignmat.SetRange("Posting Group Filter", EmpPostingGroup);
                if Assignmat.Findset then begin
                    repeat
                        if IsEmployeeActive(Assignmat."Employee No", Thismonth) then
                            iceaemployerTHISmonth := iceaemployerTHISmonth + Assignmat."Employer Amount";
                    until Assignmat.Next = 0;
                end;

                if EmpPostingGroup <> 'AP' then begin
                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                    Assignmat.SetRange(Type, Assignmat.Type::Deduction);
                    Assignmat.SetRange("Posting Group Filter", EmpPostingGroup);
                    Assignmat.SetFilter(Code, '%1|%2', 'NSSF I', 'NSSF II');
                    if Assignmat.Findset then begin
                        repeat
                            Nssfemployerthismonth := Nssfemployerthismonth + PayrollRounding(Assignmat."Employer Amount");
                        until Assignmat.Next = 0;
                    end;
                end;
            end;
        }

        dataitem(DeductionsX; DeductionsX)
        {
            DataItemTableView = where("Is Personal Insurance" = const(false));
            PrintOnlyIfDetail = false;
            column(ReportForNavId_1000000002; 1000000002) { }
            column(DeductionsX_Code; DeductionsX.Code) { }
            column(DeductionsX_Description; DeductionsX.Description) { }
            column(ThisMonthVal1; ThisMonthVal) { }
            column(LastMonthVal1; LastMonthVal) { }
            column(Difference1; Difference) { }
            column(SerialNo2; SerialNo2) { }

            trigger OnAfterGetRecord()
            begin
                LastMonthVal := 0;
                ThisMonthVal := 0;
                Difference := 0;

                if (DeductionsX.Code = 'NSSF I') or (DeductionsX.Code = 'NSSF II') then begin
                    if EmpPostingGroup <> 'AP' then begin
                        Assignmat.Reset;
                        Assignmat.SetRange(Type, Assignmat.Type::Deduction);
                        Assignmat.SetRange(Code, DeductionsX.Code);
                        Assignmat.SetRange("Payroll Period", Thismonth);
                        if EmpPostingGroup <> '' then
                            Assignmat.SetRange("Posting Group Filter", EmpPostingGroup);
                        if Assignmat.FindSet then begin
                            repeat
                                ThisMonthVal := ThisMonthVal + Abs(Assignmat.Amount);
                            until Assignmat.Next = 0;
                        end;

                        Assignmat.Reset;
                        Assignmat.SetRange(Type, Assignmat.Type::Deduction);
                        Assignmat.SetRange(Code, DeductionsX.Code);
                        Assignmat.SetRange("Payroll Period", Lastmonth);
                        if EmpPostingGroup <> '' then
                            Assignmat.SetRange("Posting Group Filter", EmpPostingGroup);
                        if Assignmat.FindSet then begin
                            repeat
                                LastMonthVal := LastMonthVal + Abs(Assignmat.Amount);
                            until Assignmat.Next = 0;
                        end;
                    end;
                end else begin
                    Assignmat.Reset;
                    Assignmat.SetRange(Type, Assignmat.Type::Deduction);
                    Assignmat.SetRange(Code, DeductionsX.Code);
                    Assignmat.SetRange("Payroll Period", Thismonth);
                    if EmpPostingGroup <> '' then
                        Assignmat.SetRange("Posting Group Filter", EmpPostingGroup);
                    if Assignmat.FindSet then begin
                        repeat
                            ThisMonthVal := ThisMonthVal + Abs(Assignmat.Amount);
                        until Assignmat.Next = 0;
                    end;

                    Assignmat.Reset;
                    Assignmat.SetRange(Type, Assignmat.Type::Deduction);
                    Assignmat.SetRange(Code, DeductionsX.Code);
                    Assignmat.SetRange("Payroll Period", Lastmonth);
                    if EmpPostingGroup <> '' then
                        Assignmat.SetRange("Posting Group Filter", EmpPostingGroup);
                    if Assignmat.FindSet then begin
                        repeat
                            LastMonthVal := LastMonthVal + Abs(Assignmat.Amount);
                        until Assignmat.Next = 0;
                    end;
                end;

                TotalDeductions := TotalDedThisMonth + ThisMonthVal;
                TotalDedThisMonth := TotalDedThisMonth + ThisMonthVal;
                TotalDedLastMonth := TotalDedLastMonth + LastMonthVal;
                Totaldeductions1 := TotalDedLastMonth + LastMonthVal;
                Difference := ThisMonthVal - LastMonthVal;
                SerialNo2 := SerialNo2 + 1;
            end;

            trigger OnPostDataItem()
            begin
            end;

            trigger OnPreDataItem()
            begin
                DeductionsX.Reset;
                if EmpPostingGroup <> '' then
                    DeductionsX.SetRange("Posting Group Filter", EmpPostingGroup);
                if Thismonth <> 0D then
                    DeductionsX.SetRange("Pay Period Filter", Thismonth);
            end;
        }
    }

    requestpage
    {
        layout { }
        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    local procedure IsEmployeeActive(EmployeeNo: Code[20]; PayPeriod: Date): Boolean
    var
        Employee: Record Employee;
    begin
        Employee.Reset();
        Employee.SetRange("No.", EmployeeNo);
        Employee.SetRange("Pay Period Filter", PayPeriod);
        Employee.SetRange(Status, Employee.Status::Active);
        exit(Employee.FindFirst());
    end;

    trigger OnPostReport()
    begin
        TotalNet := TotalEarnings - TotalDeductions;
    end;

    var
        TotalNet: decimal;
        EmpName: Text[230];
        Emp: Record Employee;
        Assignmat: Record "Assignment Matrix-X";
        Thismonth: Date;
        Lastmonth: Date;
        LastMonthVal: Decimal;
        Difference: Decimal;
        PostingGrp: Code[100];
        ThisMonthVal: Decimal;
        Thismonth1: Date;
        Lastmonth1: Date;
        LastMonthVal1: Decimal;
        Difference1: Decimal;
        ThisMonthVal1: Decimal;
        EmpName1: Text;
        NetPayThisMonth: Decimal;
        NetPayLastMonth: Decimal;
        CompanyInfo: Record "Company Information";
        SerialNo: Integer;
        netpaytotal: decimal;
        EarningsTotal: decimal;
        DeductionsTotal: decimal;
        iceaemployerthismonth: decimal;
        iceaemployerlastmonth: decimal;
        housingemployerthismonth: decimal;
        housingemployerlastmonth: decimal;
        Nssfemployerthismonth: decimal;
        Nssfemployerlastmonth: decimal;
        SerialNo2: Integer;
        SerialNo3: Integer;
        Earn: Record EarningsX;
        TotalEarnThisMonth: Decimal;
        TotalDedThisMonth: Decimal;
        TotalEarnLastMonth: Decimal;
        TotalDedLastMonth: Decimal;
        Ded: Record DeductionsX;
        EarningFilter: Text[200];
        TotalEmployees: Integer;
        TotalEmployeesLastMonth: Integer;
        Employee1: Record Employee;
        DisabilityThisMonth: Decimal;
        DisabilityLastMonth: Decimal;
        GratuityThisMonth: Decimal;
        GratuityLastMonth: Decimal;
        InsuranceThisMonth: Decimal;
        InsuranceLastMonth: Decimal;
        GrosspayThisMonth: Decimal;
        GrosspayLastMonth: Decimal;
        OwnerOccupierInterestLastMonth: Decimal;
        OwnerOccupierInterestThisMonth: Decimal;
        PersonalReliefThisMonth: Decimal;
        PersonalReliefLastMonth: Decimal;
        TotalDeductions: Decimal;
        Totaldeductions1: Decimal;
        TotalEarnings: decimal;
        TotalEarnings1: decimal;
        EmpPostingGroup: Code[20];
        SHIFRELIEF: Decimal;

    procedure PayrollRounding(Amount: Decimal): Decimal
    begin
        exit(Round(Amount, 1));
    end;
}