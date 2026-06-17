report 50007 "ITax Generator"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Monthly PAYE Export.rdlc';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(Employee; Employee)
        {
            
            DataItemTableView = sorting("Employee No Sort Key") order(ascending);

            RequestFilterFields = "Pay Period Filter";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(No_Employee; Employee."No.")
            {
            }
            column(Employee_Name; Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name")
            {
            }
            column(PIN_Employee; Employee."P.I.N")
            {
            }
            column(TaxableIncome_Employee; Employee."Taxable Income")
            {
            }
            column(CummPAYE_Employee; Abs(Employee."Cumm. PAYE"))
            {
            }
            column(DateSpecified; UpperCase(Format(DateSpecified, 0, '<Month Text> <year4>')))
            {
            }
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }
            column(BasicSalary_Employee; Employee."Basic")
            {
            }
            column(Disabled; Employee.Disabled)
            {
            }
            column(Exemptions; Employee."Disability No.")
            {
            }
            column(Car_benefit; CarBenefit)
            {
            }
            column(StaffMeals; StaffMeals)
            {
            }
            column(HouseAllowance_Employee; Employee."House Allowance1")
            {
            }
            column(TransportAllowance_Employee; Employee."Transport Allowance")
            {
            }
            column(IDNumber_Employee; Employee."ID Number")
            {
            }
            column(NSSFNo_Employee; Employee."NSSF No.")
            {
            }
            column(SHANumber_Employee; Employee."NHIF No.")
            {
            }
            trigger OnAfterGetRecord()
            begin

                CfMpr := 0;


                /*

                 IF EmpBank.GET("Employee's Bank","Bank Branch") THEN              Tax Deductible Amount
                    BankName:=EmpBank.Name;

                */

                Employee.CalcFields(Employee."Taxable Allowance", Employee."Tax Deductible Amount", Employee."Cumm. PAYE", Employee."Paye Arrears");
                Employee.CalcFields(Employee."Total Allowances", Employee."Total Deductions", Employee."Taxable Income");
                Employee.CalcFields(Employee."Benefits-Non Cash", Employee."Total Savings", Employee."Retirement Contribution", Employee."Basic", Employee."House Allowance1",
                Employee."Transport Allowance");

                Employee.CalcFields(Employee."Leave Allowance", Employee."Overtime Allowance", Employee."Directors Fees", Employee."Lump Sum", Employee."Other Allowance",
               Employee."Non Cash Benefit", Employee.MPR, Employee."Insurance Relief");

                BasicSalaryAmt := 0;
                HouseAllowanceAmt := 0;
                TransportAllowanceAmt := 0;
                CarBenefit := 0;
                StaffMeals := 0;
                NSSFAmt1 := 0;
                NSSFAmt2 := 0;
                PensionAmt := 0;
                AHLAmt := 0;
                SHAAmt := 0;

                AssignMatrixBS.Reset;
                AssignMatrixBS.SetRange("Employee No", Employee."No.");
                AssignMatrixBS.SetRange("Payroll Period", DateSpecified);
                AssignMatrixBS.SetRange(Code, 'BS');
                AssignMatrixBS.SetRange(Type, AssignMatrixBS.Type::Payment);
                if AssignMatrixBS.FindFirst then
                    BasicSalaryAmt := Abs(AssignMatrixBS.Amount);

                AssignMatrixHouse.Reset;
                AssignMatrixHouse.SetRange("Employee No", Employee."No.");
                AssignMatrixHouse.SetRange("Payroll Period", DateSpecified);
                AssignMatrixHouse.SetRange(Code, 'HOUSE');
                AssignMatrixHouse.SetRange(Type, AssignMatrixHouse.Type::Payment);
                if AssignMatrixHouse.FindFirst then
                    HouseAllowanceAmt := Abs(AssignMatrixHouse.Amount);

                AssignMatrixTransport.Reset;
                AssignMatrixTransport.SetRange("Employee No", Employee."No.");
                AssignMatrixTransport.SetRange("Payroll Period", DateSpecified);
                AssignMatrixTransport.SetRange(Code, 'COMMUTER');
                AssignMatrixTransport.SetRange(Type, AssignMatrixTransport.Type::Payment);
                if AssignMatrixTransport.FindFirst then
                    TransportAllowanceAmt := Abs(AssignMatrixTransport.Amount);

                AssignMatrixCar.Reset;
                AssignMatrixCar.SetRange("Employee No", Employee."No.");
                AssignMatrixCar.SetRange("Payroll Period", DateSpecified);
                AssignMatrixCar.SetRange(Code, 'CAR');
                AssignMatrixCar.SetRange(Type, AssignMatrixCar.Type::Payment);
                if AssignMatrixCar.FindFirst then
                    CarBenefit := Abs(AssignMatrixCar.Amount);

                AssignMatrixMeals.Reset;
                AssignMatrixMeals.SetRange("Employee No", Employee."No.");
                AssignMatrixMeals.SetRange("Payroll Period", DateSpecified);
                AssignMatrixMeals.SetRange(Code, 'MEALS');
                AssignMatrixMeals.SetRange(Type, AssignMatrixMeals.Type::Payment);
                if AssignMatrixMeals.FindFirst then
                    StaffMeals := Abs(AssignMatrixMeals.Amount);

                AssignMatrixNSSF.Reset;
                AssignMatrixNSSF.SetRange("Employee No", Employee."No.");
                AssignMatrixNSSF.SetRange("Payroll Period", DateSpecified);
                AssignMatrixNSSF.SetRange(Code, 'NSSF I');
                AssignMatrixNSSF.SetRange(Type, AssignMatrixNSSF.Type::Deduction);
                if AssignMatrixNSSF.FindFirst then
                    NSSFAmt1 := Abs(AssignMatrixNSSF.Amount);

                AssignMatrixNSSF.Reset;
                AssignMatrixNSSF.SetRange("Employee No", Employee."No.");
                AssignMatrixNSSF.SetRange("Payroll Period", DateSpecified);
                AssignMatrixNSSF.SetRange(Code, 'NSSF II');
                AssignMatrixNSSF.SetRange(Type, AssignMatrixNSSF.Type::Deduction);
                if AssignMatrixNSSF.FindFirst then
                    NSSFAmt2 := Abs(AssignMatrixNSSF.Amount);

                AssignMatrixPension.Reset;
                AssignMatrixPension.SetRange("Employee No", Employee."No.");
                AssignMatrixPension.SetRange("Payroll Period", DateSpecified);
                AssignMatrixPension.SetRange(Code, 'PENSION');
                AssignMatrixPension.SetRange(Type, AssignMatrixPension.Type::Deduction);
                if AssignMatrixPension.FindFirst then
                    PensionAmt := Abs(AssignMatrixPension.Amount);

                AssignMatrixAHL.Reset;
                AssignMatrixAHL.SetRange("Employee No", Employee."No.");
                AssignMatrixAHL.SetRange("Payroll Period", DateSpecified);
                AssignMatrixAHL.SetRange(Code, 'AHL');
                AssignMatrixAHL.SetRange(Type, AssignMatrixAHL.Type::Deduction);
                if AssignMatrixAHL.FindFirst then
                    AHLAmt := Abs(AssignMatrixAHL.Amount);

                AssignMatrixSHA.Reset;
                AssignMatrixSHA.SetRange("Employee No", Employee."No.");
                AssignMatrixSHA.SetRange("Payroll Period", DateSpecified);
                AssignMatrixSHA.SetRange(Code, 'SHIF');
                AssignMatrixSHA.SetRange(Type, AssignMatrixSHA.Type::Deduction);
                if AssignMatrixSHA.FindFirst then
                    SHAAmt := Abs(AssignMatrixSHA.Amount);

                AssignMatrixSHA.Reset;
                AssignMatrixSHA.SetRange("Employee No", Employee."No.");
                AssignMatrixSHA.SetRange("Payroll Period", DateSpecified);
                AssignMatrixSHA.SetRange(Code, 'SHIF');
                AssignMatrixSHA.SetRange(Type, AssignMatrixSHA.Type::Deduction);
                if AssignMatrixSHA.FindFirst then
                    SHIFRelief := Abs(AssignMatrixSHA.Amount);


                if (Employee."Cumm. PAYE" = 0) and (BasicSalaryAmt = 0) then begin
                    CurrReport.Skip;
                end;

                TotalPaye := TotalPaye + Employee."Cumm. PAYE";
                TotalTaxable := TotalTaxable + Employee."Taxable Income";
                RecordNo := RecordNo + 1;
                Counter := Counter + 1;
                if PrintToExcel then
                    MakeExcelDataBody;

                if Counter > 1 then
                    Clear(CompInfo.Picture);

            end;

            trigger OnPostDataItem()
            begin

                if PrintToExcel then begin
                    MakeExcelFooter;
                    CreateExcelbook;
                end;
            end;

            trigger OnPreDataItem()
            begin



                CompInfo.Get;
                CoName := CompInfo.Name;
                CompInfo.CalcFields(Picture);
                if BeginDate = DateSpecified then
                    //Employee.SETRANGE(Status,Employee.Status::Active);
                    NoOfRecords := Count;
                DeptFilter := '';
                ProjFilter := '';
                SecLocFilter := '';
                NoFilter := '';
                if Employee.GetFilter("Global Dimension 1 Code") <> '' then
                    DeptFilter := 'Dept ' + Employee.GetFilter("Global Dimension 1 Code");
                if Employee.GetFilter("No.") <> '' then
                    NoFilter := 'No ' + Employee.GetFilter("No.");
                if Employee.GetFilter("Global Dimension 2 Code") <> '' then
                    ProjFilter := 'Proj ' + Employee.GetFilter("Global Dimension 2 Code");
                if Employee.GetFilter(Branch) <> '' then
                    SecLocFilter := 'Sec/Loc ' + Employee.GetFilter(Branch);

                SortBy := NoFilter + DeptFilter + ProjFilter + SecLocFilter;
                /*CUser:=USERID;
                GetGroup.GetUserGroup(CUser,GroupCode);
                SETRANGE(Employee."Posting Group",GroupCode);*/
                //

                MakeExcelHeader;

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(PrintToExcel; PrintToExcel)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print To Excel?';
                    ToolTip = 'Specifies the value of the Print To Excel? field.';
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
        MonthlyPaye = 'MONTHLY PAYE REPORT';
        Period = 'PERIOD';
        PageCaption = 'Page';

    }

    trigger OnPreReport()
    begin
        DateSpecified := Employee.GetRangeMin("Pay Period Filter");
    end;

    var
        Addr: array[10, 30] of Text[250];
        NoOfRecords: Integer;
        RecordNo: Integer;
        NoOfColumns: Integer;
        ColumnNo: Integer;
        ASSIGN: RECORD 69009;
        i: Integer;
        Transactions: Record "Assignment Matrix-X";
        AmountRemaining: Decimal;
        IncomeTax: Decimal;
        PayPeriod: Record "Payroll PeriodX";
        PayPeriodtext: Text[30];
        BeginDate: Date;
        EMPL: DECIMAL;
        DateSpecified: Date;
        EndDate: Date;
        EmpBank: Record "Employee Bank AccountX";
        BankName: Text[30];
        BasicSalary: Decimal;
        TaxableAmt: Decimal;
        RightBracket: Boolean;
        NetPay: Decimal;
        PayPeriodRec: Record "Employee Bank AccountX";
        PayDeduct: Record "Assignment Matrix-X";
        EmpRec: Record Employee;
        EmpNo: Code[10];
        TaxableAmount: Decimal;
        PAYE: Decimal;
        ArrEarnings: array[10, 50] of Text[250];
        ArrDeductions: array[10, 50] of Text[250];
        Index: Integer;
        Index1: Integer;
        j: Integer;
        ArrEarningsAmt: array[10, 50] of Text[250];
        ArrDeductionsAmt: array[10, 50] of Text[250];
        Year: Integer;
        EmpArray: array[10, 15] of Decimal;
        HoldDate: Date;
        DenomArray: array[3, 11] of Text[50];
        NoOfUnitsArray: array[3, 11] of Integer;
        AmountArray: array[3, 11] of Decimal;
        PayModeArray: array[3] of Text[30];
        HoursArray: array[10, 50] of Decimal;
        CompRec: Record "Human Resources Setup";
        HseLimit: Decimal;
        ExcessRetirement: Decimal;
        CfMpr: Decimal;
        relief: Decimal;
        CompInfo: Record "Company Information";
        CoName: Text[80];
        TotalTaxable: Decimal;
        TotalPaye: Decimal;
        TaxCode: Code[10];
        SortBy: Text[30];
        NoFilter: Text[40];
        DeptFilter: Text[30];
        ProjFilter: Text[30];
        SecLocFilter: Text[30];
        GrossPay: Decimal;
        RetireCont: Decimal;

        pension: decimal;
        nssf: decimal;
        retirecontribution: Decimal;
        TotalBenefits: Decimal;
        TaxablePay: Decimal;
        TotalQuarters: Decimal;
        GroupCode: Code[20];
        CUser: Code[20];
        ExcelBuf: Record "Excel Buffer" temporary;
        PrintToExcel: Boolean;
        Counter: Integer;
        Text002: label 'PAYE';
        Text001: label 'GMKH';
        AssignMatrixBS: Record "Assignment Matrix-X";
        AssignMatrixHouse: Record "Assignment Matrix-X";
        AssignMatrixTransport: Record "Assignment Matrix-X";
        AssignMatrixCar: Record "Assignment Matrix-X";
        AssignMatrixMeals: Record "Assignment Matrix-X";
        AssignMatrixNSSF: Record "Assignment Matrix-X";
        AssignMatrixPension: Record "Assignment Matrix-X";
        AssignMatrixAHL: Record "Assignment Matrix-X";
        AssignMatrixSHA: Record "Assignment Matrix-X";
        BasicSalaryAmt: Decimal;
        HouseAllowanceAmt: Decimal;
        TransportAllowanceAmt: Decimal;
        CarBenefit: Decimal;
        StaffMeals: Decimal;
        NSSFAmt1: Decimal;
        NSSFAmt2: Decimal;
        PensionAmt: Decimal;
        AHLAmt: Decimal;
        SHAAmt: Decimal;
        SHIFRelief: Decimal;


    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record BracketsX;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
        AmountRemaining := TaxableAmount;
        AmountRemaining := ROUND(AmountRemaining, 0.01);
        EndTax := false;

        TaxTable.SetRange("Table Code", TaxCode);

        if TaxTable.Find('-') then begin
            repeat
                if AmountRemaining <= 0 then
                    EndTax := true
                else begin
                    if ROUND((TaxableAmount), 0.01) > TaxTable."Upper Limit" then
                        Tax := TaxTable."Taxable Amount" * TaxTable.Percentage / 100
                    else begin
                        Tax := AmountRemaining * TaxTable.Percentage / 100;
                        TotalTax := TotalTax + Tax;
                        EndTax := true;
                    end;
                    if not EndTax then begin
                        AmountRemaining := AmountRemaining - TaxTable."Taxable Amount";
                        TotalTax := TotalTax + Tax;
                    end;
                end;
            until (TaxTable.Next = 0) or EndTax = true;
        end;
        TotalTax := TotalTax;
        TotalTax := PayrollRounding(TotalTax);
        IncomeTax := -TotalTax;
        if not Employee."Pays tax?" then
            IncomeTax := 0;
    end;


    procedure GetPayPeriod()
    begin
        PayPeriod.SetRange(PayPeriod."Close Pay", false);
        if PayPeriod.Find('-') then begin
            PayPeriodtext := PayPeriod.Name;
            BeginDate := PayPeriod."Starting Date";
        end;
    end;


    procedure PayrollRounding(var Amount: Decimal) PayrollRounding: Decimal
    var
        HRsetup: Record "Human Resources Setup";
    begin

        HRsetup.Get;
        if HRsetup."Payroll Rounding Precision" = 0 then
            Error('You must specify the rounding precision under HR setup');

        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Nearest then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '=');

        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Up then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '>');

        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Down then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '<');
    end;


    procedure CreateExcelbook()
    begin
        /*
        ExcelBuf.CreateBook('iTAX',Text002);
        //ExcelBuf.CreateSheet(Text002,Text001,COMPANYNAME,USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');
        */
        //cc
        // ExcelBuf.CreateBook('C:\DATA.xlsx', 'Location Inv Value');
        // ExcelBuf.WriteSheet('Location Inv Value', COMPANYNAME, UserId);
        // ExcelBuf.CloseBook();
        // ExcelBuf.OpenExcel();
        ExcelBuf.CreateNewBook('ITax Report');
        ExcelBuf.WriteSheet('ITax Report', COMPANYNAME, UserId);
        ExcelBuf.CloseBook();
        ExcelBuf.SetFriendlyFilename(StrSubstNo('ITaxReport_%1_%2', CurrentDateTime, UserId));
        ExcelBuf.OpenExcel();

        //commented 23082023
        // ExcelBuf.CreateBookAndOpenExcel('D:\iTAX.xlsx', Text002, Text001, COMPANYNAME, UserId);
        //   Error('');

    end;


    procedure MakeExcelDataBody()
    var
        BlankFiller: Text[250];
        TotalCashPay: Decimal;
        TotalGrossPay: Decimal;
        TaxablePAYE: Decimal;
    begin
        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');

        TotalCashPay := BasicSalaryAmt + HouseAllowanceAmt + TransportAllowanceAmt;
        TotalGrossPay := TotalCashPay + CarBenefit + StaffMeals;
        TaxablePAYE := Abs(Employee."Cumm. PAYE") + Abs(Employee."Paye Arrears");

        ExcelBuf.NewRow;

        ExcelBuf.AddColumn(Employee."P.I.N", false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn(Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name", false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn('Resident', false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn('Primary Employee', false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn(Format(Employee.Disabled), false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn(Employee."Disability No.", false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn(TotalCashPay, false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn(CarBenefit, false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn(StaffMeals, false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn(Employee."Non Cash Benefit", false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn('Benefit not given', false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn(TotalGrossPay, false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn(SHAAmt, false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn(NSSFAmt1 + NSSFAmt2, false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn(PensionAmt, false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn(AHLAmt, false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn(Employee."Taxable Income", false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn(2400, false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn(Employee."Insurance Relief" + SHIFRelief, false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn('', false, '', false, false, false, '@', 1);
        ExcelBuf.AddColumn(TaxablePAYE, false, '', false, false, false, '@', 1);

        //ExcelBuf.AddColumn(EmpTotal,FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(Id,FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('CONTRIBUTIONS',FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(ABS("Assignment Matrix-X".Amount),FALSE,'',FALSE,FALSE,FALSE,'@');
    end;


    procedure MakeExcelHeader()
    var
        BlankFiller: Text[250];
    begin
        /*
        BlankFiller := PADSTR(' ',MAXSTRLEN(BlankFiller),' ');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('MONTHLY P.A.Y.E ',FALSE,'',TRUE,FALSE,FALSE,'@');
        
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('EMPLOYER PIN:'+Company."VAT Registration No.",FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('EMPLOYER NAME:'+UPPERCASE(COMPANYNAME),FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('MONTH:'+
        UPPERCASE(FORMAT(DateSpecified,0,'<month text> <year4>')),FALSE,'',TRUE,FALSE,FALSE,'@');
        ExcelBuf.NewRow;
        
        */

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('PIN OF EMPLOYEE', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('NAME OF EMPLOYEE', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('RESIDENT STATUS', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('TYPE OF EMPLOYEE', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('PERSONS WITH DISABILITY (PWD)', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('EXEMPTION CERTIFICATE NUMBER', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('TOTAL CASH PAY', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('VALUE OF CAR BENEFIT', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('VALUE OF MEALS', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('NON CASH BENEFIT', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('TYPE OF HOUSING', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('HOUSING BENEFIT', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('OTHER BENEFITS', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('TOTAL GROSS PAY', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('SHA/SHIF', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('NSSF CONTRIBUTION', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('OTHER PENSION CONTRIBUTION', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('POST RETIREMENT MEDICAL FUNDS', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('MORTGAGE INTEREST', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('AFFORDABLE HOUSING LEVY', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('TAXABLE PAY', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('MONTHLY PERSONAL RELIEF', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('AMOUNT OF INSURANCE RELIEF', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('PAYE TAX KSH', false, '', true, false, false, '@', 1);
        ExcelBuf.AddColumn('SELF ASSESSED PAYE TAX KSH', false, '', true, false, false, '@', 1);

        //ExcelBuf.AddColumn('PAYE AMOUNT',FALSE,'',TRUE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('I.D NO',FALSE,'',TRUE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('REMARKS',FALSE,'',TRUE,FALSE,FALSE,'@');

    end;


    procedure MakeExcelFooter()
    var
        BlankFiller: Text[250];
    begin
        BlankFiller := PadStr(' ', MaxStrLen(BlankFiller), ' ');
        /*
        ExcelBuf.NewRow;
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('Employees :'+FORMAT(Counter),FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(EmployeeTotal+EmployerTotal,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(TotalTaxable,FALSE,'',FALSE,FALSE,FALSE,'@');
        ExcelBuf.AddColumn(ABS(TotalPaye),FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(TotalVoluntary,FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(EmployeeTotal+EmployerTotal+TotalVoluntary,FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'@');
        //ExcelBuf.AddColumn(SumTotal,FALSE,'',FALSE,FALSE,FALSE,'');
        */

    end;
}



// {
//     Caption = 'ITax Generator';
//     dataset
//     {
//         dataitem(AssignmentMatrixX; "Assignment Matrix-X")
//         {
//             RequestFilterFields = "Payroll Period";
//             column(c; c) { }
//             column(d; d) { }
//             column(e; e) { }
//             column(f; f) { }
//             column(g; g) { }
//             column(h; h) { }
//             column(i; i) { }
//             column(j; j) { }
//             column(j1; j1) { }
//             column(j2; j2) { }
//             column(k; k) { }
//             column(l; l) { }
//             column(m; m) { }
//             column(n; n) { }
//             column(o; o) { }
//             column(p; p) { }
//             column(q; q) { }
//             column(r; r) { }
//             column(s; s) { }
//             column(s1; s1) { }
//             column(t; t) { }
//             column(u; u) { }
//             column(u1; u1) { }
//             column(v; v) { }
//             column(w; w) { }
//             column(x; x) { }
//             column(x1; x1) { }
//             column(x2; x2) { }
//             column(y; y) { }
//             column(PAYE; PAYE) { }
//             dataitem(Employee; Employee)
//             {
//                 DataItemLinkReference = AssignmentMatrixX;
//                 DataItemLink = "No." = field("Employee No");

//                 column(PINNumber_Employee; "PIN Number")
//                 {
//                 }
//                 column(EmployeeName; EmployeeName)
//                 {

//                 }
//                 column(GrossPay; "Total Allowances")
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     EmployeeName := '';
//                     EmployeeName := Employee.FullName();
//                 end;
//             }
//         }
//     }
//     requestpage
//     {
//         layout
//         {
//             area(content)
//             {
//                 group(GroupName)
//                 {
//                 }
//             }
//         }
//         actions
//         {
//             area(processing)
//             {
//             }
//         }
//     }
//     var
//         EmployeeName: Text[100];
//         a: Label 'Resident';
//         b: Label 'Primary Employee';
//         c: Decimal;
//         d: Decimal;
//         e: Decimal;
//         f: Decimal;
//         g: Decimal;
//         h: Decimal;
//         i: Decimal;
//         j: Decimal;
//         j1: Decimal;
//         j2: Decimal;
//         k: Decimal;
//         l: Decimal;
//         m: Decimal;
//         n: Decimal;
//         o: Decimal;
//         p: Decimal;
//         q: Decimal;
//         r: Decimal;
//         s: Decimal;
//         s1: Decimal;
//         t: Decimal;
//         u: Decimal;
//         u1: Decimal;
//         v: Decimal;
//         w: Decimal;
//         x: Decimal;
//         x1: Decimal;
//         x2: Decimal;
//         y: Decimal;
//         PAYE: Decimal;

// }