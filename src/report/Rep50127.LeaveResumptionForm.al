#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006

report 50127 "Leave Resumption Form"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/LeaveResumptionForm.rdlc';
    Caption = 'Leave Resumption Form';
    PreviewMode = PrintLayout;
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("HR Leave Applications"; "HR Leave Applications")
        {
            column(CompanyInfo_Name; CompanyInfo.Name) { }
            column(CompanyInfo_Picture; CompanyInfo.Picture) { }
            column(CompanyInfo_Address; CompanyInfo.Address) { }
            column(CompanyInfo_PhoneNo; CompanyInfo."Phone No.") { }
            column(CompanyInfo_Email; CompanyInfo."E-Mail") { }
            column(ApplicationCode; "Application Code") { }
            column(EmployeeNo; "Employee No") { }
            column(EmployeeName; EmployeeName) { }
            column(EmployeePFNo; EmployeePFNo) { }
            column(LeaveType; "Leave Type") { }
            column(DaysApplied; "Days Applied") { }
            column(StartDate; Format("Start Date")) { }
            column(EndDate; Format("End Date")) { }
            column(ReturnDate; Format("Return Date")) { }
            column(ResumptionDate; Format(ResumptionDate)) { }
            column(DepartmentName; "Department Name") { }
            column(SectionName; "Section Name") { }
            column(Designation; Designation) { }
            column(RecallReason; RecallReason) { }
            column(RecallDaysRecalled; RecallDaysRecalled) { }
            column(RecallDateFrom; Format(RecallDateFrom)) { }
            column(RecallDateTo; Format(RecallDateTo)) { }
            column(TodayDate; Format(Today)) { }
            column(HasBeenRecalled; HasBeenRecalled) { }

            trigger OnPreDataItem()
            begin
                SetRange(Posted, true);
                //SetRange(Resumed, true);
                CompanyInfo.Get();
                CompanyInfo.CalcFields(Picture);
            end;

            trigger OnAfterGetRecord()
            var
                Employee: Record Employee;
                LeaveRecall: Record "Leave Recall";
            begin
                if Employee.Get("Employee No") then begin
                    EmployeeName := Employee.FullName();
                    EmployeePFNo := Employee."No.";
                end;

                HasBeenRecalled := false;
                LeaveRecall.Reset();
                LeaveRecall.SetRange("Application No", "Application Code");
                LeaveRecall.SetRange("Employee No", "Employee No");
                LeaveRecall.SetRange(Posted, true);
                if LeaveRecall.FindLast() then begin
                    HasBeenRecalled := true;
                    RecallReason := LeaveRecall."Reason for Recall";
                    RecallDaysRecalled := LeaveRecall."Days Recalled";
                    RecallDateFrom := LeaveRecall."Recall Date From";
                    RecallDateTo := LeaveRecall."Recall Date To";
                    ResumptionDate := RecallDateFrom;
                end else begin
                    Clear(RecallReason);
                    Clear(RecallDaysRecalled);
                    Clear(RecallDateFrom);
                    Clear(RecallDateTo);
                    ResumptionDate := "Return Date";
                end;
            end;
        }
    }

    var
        CompanyInfo: Record "Company Information";
        EmployeeName: Text[100];
        EmployeePFNo: Code[20];
        ResumptionDate: Date;
        RecallReason: Text[200];
        RecallDaysRecalled: Decimal;
        RecallDateFrom: Date;
        RecallDateTo: Date;
        HasBeenRecalled: Boolean;
}