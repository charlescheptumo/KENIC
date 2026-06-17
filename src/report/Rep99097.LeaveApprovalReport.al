report 99097 "Leave Approval Report"
{
    Caption = 'Leave Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/LeaveReport.rdlc';
    ApplicationArea = All;

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = sorting("No.");
            column(EmpNo; "No.")
            {
            }
            column(EmpName; "First Name")
            {
            }
            column(EmpDepartment; "Department Code")
            {
            }
            column(EmpJobTitle; "Job Title")
            {
            }
            column(EmpTotalAllocation; EmpTotalAllocation)
            {
            }
            column(EmpDaysApplied; EmpDaysApplied)
            {
            }
            column(EmpLeaveBalance; EmpLeaveBalance)
            {
            }
            column(EmpBalanceStatus; EmpBalanceStatus)
            {
            }
            column(EmpForfeitedDays; EmpForfeitedDays)
            {
            }
            column(EmpCompassionateCount; EmpCompassionateCount)
            {
            }
            column(EmpTerminalCount; EmpTerminalCount)
            {
            }
            column(EmpMaternityCount; EmpMaternityCount)
            {
            }
            column(EmpPaternityCount; EmpPaternityCount)
            {
            }
            column(CompanyPicture; CompanyInfo.Picture)
            {
            }
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyAddress7; CompanyAddr[7])
            {
            }
            column(CompanyAddress8; CompanyAddr[8])
            {
            }

            dataitem(HRLeaveApplications; "HR Leave Applications")
            {
                DataItemLink = "Employee No" = field("No.");
                RequestFilterFields = "Application Date", "Leave Type", Status;
                column(App_ApplicationCode; "Application Code")
                {
                }
                column(App_LeaveType; "Leave Type")
                {
                }
                column(App_ApplicationDate; "Application Date")
                {
                }
                column(App_StartDate; "Start Date")
                {
                }
                column(App_Reliever_Name; "Reliever Name")
                {
                }
                column(App_EndDate; "End Date")
                {
                }
                column(App_DaysApplied; "Days Applied")
                {
                }
                column(App_ReturtDate; "Return Date")
                { }
                column(App_ApprovedDays; "Approved days")
                {
                }
                column(App_Status; Status)
                {
                }
                trigger OnAfterGetRecord()
                begin
                end;
            }

            trigger OnPreDataItem()
            var
                ExistApp: Boolean;
            begin
                if DepartmentFilter <> '' then
                    SetRange("Department Code", DepartmentFilter);

                HRLeaveApp.Reset();
                HRLeaveApp.SetRange(HRLeaveApp."Employee No", "No.");
                if FromDate <> 0D then
                    HRLeaveApp.SetFilter(HRLeaveApp."Application Date", '%1..%2', FromDate, ToDate);
                HRLeaveApp.SetRange(HRLeaveApp.Status, HRLeaveApp.Status::Released);
                ExistApp := HRLeaveApp.FindFirst();
                if not ExistApp then
                    CurrReport.SKIP();
            end;

            trigger OnAfterGetRecord()
            begin
                EmpTotalAllocation := GetEmployeeEntitlement("No.");
                EmpDaysApplied := GetTotalApplied("No.", FromDate, ToDate);
                EmpLeaveBalance := EmpTotalAllocation - EmpDaysApplied;
                if EmpLeaveBalance < 0 then
                    EmpLeaveBalance := 0;
                if EmpLeaveBalance < CarryForwardMax then
                    EmpForfeitedDays := 0
                else
                    EmpForfeitedDays := EmpLeaveBalance - CarryForwardMax;
                if EmpLeaveBalance = 0 then
                    EmpBalanceStatus := 'Fully Utilized'
                else if EmpDaysApplied = 0 then
                    EmpBalanceStatus := 'Never Applied'
                else if EmpForfeitedDays > 0 then
                    EmpBalanceStatus := 'Applied'
                else
                    EmpBalanceStatus := 'Applied';
                EmpCompassionateCount := GetLeaveTypeCount("No.", 'COMPASSIONATE', FromDate, ToDate);
                EmpTerminalCount := GetLeaveTypeCount("No.", 'TERMINAL', FromDate, ToDate);
                EmpMaternityCount := GetLeaveTypeCount("No.", 'MATERNITY', FromDate, ToDate);
                EmpPaternityCount := GetLeaveTypeCount("No.", 'PATERNITY', FromDate, ToDate);
                GTotalEmployees += 1;
                if EmpBalanceStatus = 'Fully Utilized' then
                    GEmployeesFullyUtilized += 1;
                if EmpBalanceStatus = 'Never Applied' then
                    GEmployeesNeverApplied += 1;
                if EmpBalanceStatus = 'Applied' then
                    GEmployeesForfeited += 1;
                GCompassionateCount += EmpCompassionateCount;
                GTerminalCount += EmpTerminalCount;
                GMaternityCount += EmpMaternityCount;
                GPaternityCount += EmpPaternityCount;

                // if "No." = '1541' then
                //     Message(
                //         'DEBUG Emp 1541:\nEntitlement: %1\nDays Applied: %2\nLeave Balance: %3\nForfeited: %4\nStatus: %5',
                //         EmpTotalAllocation,
                //         EmpDaysApplied,
                //         EmpLeaveBalance,
                //         EmpForfeitedDays,
                //         EmpBalanceStatus
                //     );
            end;
        }

        dataitem(ReportSummary; "Company Information")
        {
            column(TotalEmployees; GTotalEmployees)
            {
            }
            column(EmployeesFullyUtilized; GEmployeesFullyUtilized)
            {
            }
            column(EmployeesNeverApplied; GEmployeesNeverApplied)
            {
            }
            column(EmployeesForfeited; GEmployeesForfeited)
            {
            }
            column(CompassionateCount; GCompassionateCount)
            {
            }
            column(TerminalCount; GTerminalCount)
            {
            }
            column(MaternityCount; GMaternityCount)
            {
            }
            column(PaternityCount; GPaternityCount)
            {
            }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Filters)
                {
                    Caption = 'Filters';
                    field(DepartmentFilter; DepartmentFilter)
                    {
                        Caption = 'Department Code';
                        ApplicationArea = All;
                        TableRelation = "Responsibility Center".Code;
                    }
                    field(FromDate; FromDate)
                    {
                        Caption = 'From Date';
                        ApplicationArea = All;
                    }
                    field(ToDate; ToDate)
                    {
                        Caption = 'To Date';
                        ApplicationArea = All;
                    }
                }
            }
        }
    }

    trigger OnPreReport()
    begin
        CompanyInfo.get();
        CompanyInfo.CalcFields(Picture);
        FormatAddr.GetCompanyAddr('', RespCenter, CompanyInfo, CompanyAddr);
    end;

    trigger OnInitReport()
    begin
        CarryForwardMax := 15;
    end;

    var
        DepartmentFilter: Code[20];
        FromDate: Date;
        ToDate: Date;
        OnlyReleased: Boolean;
        CarryForwardMax: Integer;
        EmpTotalAllocation: Decimal;
        EmpDaysApplied: Decimal;
        EmpLeaveBalance: Decimal;
        EmpForfeitedDays: Decimal;
        EmpBalanceStatus: Text[50];
        EmpCompassionateCount: Integer;
        EmpTerminalCount: Integer;
        EmpMaternityCount: Integer;
        EmpPaternityCount: Integer;
        GTotalEmployees: Integer;
        GEmployeesFullyUtilized: Integer;
        GEmployeesNeverApplied: Integer;
        GEmployeesForfeited: Integer;
        GCompassionateCount: Integer;
        GTerminalCount: Integer;
        GMaternityCount: Integer;
        GPaternityCount: Integer;
        HRLeaveApp: Record "HR Leave Applications";
        HRLeaveLedger: Record "HR Leave Ledger Entries";
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RespCenter: Record "Responsibility Center";

    local procedure GetEmployeeEntitlement(EmployeeNo: Code[20]): Decimal
    var
        LeaveLedger: Record "HR Leave Ledger Entries";
        TotalEntitlement: Decimal;
    begin
        TotalEntitlement := 0;
        LeaveLedger.Reset();
        LeaveLedger.SetRange(LeaveLedger."Staff No.", EmployeeNo);
        LeaveLedger.SetRange(LeaveLedger."Leave Type", 'ANNUAL');
        if LeaveLedger.FindSet() then
            repeat
                TotalEntitlement += LeaveLedger."No. of days";
            until LeaveLedger.Next() = 0;

        // if EmployeeNo = '1541' then
        //     Message('DEBUG Entitlement for 1541: LeaveLedger total = %1', TotalEntitlement);

        if TotalEntitlement = 0 then
            TotalEntitlement := 30;

        exit(TotalEntitlement);
    end;

    local procedure GetTotalApplied(EmployeeNo: Code[20]; FromD: Date; ToD: Date): Decimal
    var
        SumDays: Decimal;
    begin
        SumDays := 0;
        HRLeaveApp.Reset();
        HRLeaveApp.SetRange(HRLeaveApp."Employee No", EmployeeNo);
        if FromD <> 0D then
            HRLeaveApp.SetFilter(HRLeaveApp."Application Date", '%1..%2', FromD, ToD);
        HRLeaveApp.SetRange(HRLeaveApp.Status, HRLeaveApp.Status::Released);
        if HRLeaveApp.FindSet() then
            repeat
                if HRLeaveApp."Approved days" > 0 then
                    SumDays += HRLeaveApp."Approved days"
                else
                    SumDays += HRLeaveApp."Days Applied";
            until HRLeaveApp.Next() = 0;
        exit(SumDays);
    end;

    local procedure GetLeaveTypeCount(EmployeeNo: Code[20]; LeaveTypeCode: Code[30]; FromD: Date; ToD: Date): Integer
    var
        CountLeaves: Integer;
    begin
        CountLeaves := 0;
        HRLeaveApp.Reset();
        HRLeaveApp.SetRange(HRLeaveApp."Employee No", EmployeeNo);
        HRLeaveApp.SetRange(HRLeaveApp."Leave Type", LeaveTypeCode);
        if FromD <> 0D then
            HRLeaveApp.SetFilter(HRLeaveApp."Application Date", '%1..%2', FromD, ToD);
        HRLeaveApp.SetRange(HRLeaveApp.Status, HRLeaveApp.Status::Released);
        if HRLeaveApp.FindSet() then
            repeat
                CountLeaves += 1;
            until HRLeaveApp.Next() = 0;
        exit(CountLeaves);
    end;
}