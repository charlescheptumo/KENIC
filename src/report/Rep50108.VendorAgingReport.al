namespace KICD.KICD;

using Microsoft.Purchases.Vendor;
using Microsoft.Inventory.Location;
using Microsoft.Utilities;
using Microsoft.Foundation.Address;
using System.Security.User;
using Microsoft.Foundation.Company;
using Microsoft.Purchases.Payables;

report 50108 VendorAgingReport
{
    ApplicationArea = All;
    Caption = 'VendorAgingReport';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(Vendor; Vendor)
        {
            column(CompanyPicture; CompanyInfo.Picture)
            {
            }
            column(Motto; CompanyInfo.Motto)
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
             column(STRSUBSTNO_Text001_FORMAT_StartDate__; StrSubstNo(Text001, Format(StartDate)))
            {
            }
            column(COMPANYNAME; COMPANYPROPERTY.DisplayName())
            {
            }
            column(Employee_TABLECAPTION__________EmpFilter; TableCaption + ': ' + EmpFilter)
            {
            }
            column(EmpFilter; EmpFilter)
            {
            }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code")
            {

            }
            column(Global_Dimension_1_Name; CustomFunction.DimensionName(1, "Global Dimension 1 Code"))
            {

            }
            column(EmpBalanceDueLCY_5_; EmpBalanceDueLCY[5])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_4_; EmpBalanceDueLCY[4])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_3_; EmpBalanceDueLCY[3])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_2_; EmpBalanceDueLCY[2])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_1_; EmpBalanceDueLCY[1])
            {
                AutoFormatType = 1;
            }
            column(Vendor__No__; "No.")
            {
            }
            column(Vendor_Name;Name)
            {
            }
            column(EmpBalanceDueLCY_5__Control25; EmpBalanceDueLCY[5])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_4__Control26; EmpBalanceDueLCY[4])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_3__Control27; EmpBalanceDueLCY[3])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_2__Control28; EmpBalanceDueLCY[2])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_1__Control29; EmpBalanceDueLCY[1])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_5__Control37; EmpBalanceDueLCY[5])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_4__Control38; EmpBalanceDueLCY[4])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_3__Control39; EmpBalanceDueLCY[3])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_2__Control40; EmpBalanceDueLCY[2])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_1__Control41; EmpBalanceDueLCY[1])
            {
                AutoFormatType = 1;
            }
            column(Employee___Summary_Aging_Simp_Caption; Employee___Summary_Aging_Simp_CaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(All_amounts_are_in_LCYCaption; All_amounts_are_in_LCYCaptionLbl)
            {
            }
            column(Employee__No__Caption; FieldCaption("No."))
            {
            }
            column(Employee_NameCaption; FieldCaption(Name))
            {
            }
            column(EmpBalanceDueLCY_5__Control25Caption; EmpBalanceDueLCY_5__Control25CaptionLbl)
            {
            }
            column(EmpBalanceDueLCY_4__Control26Caption; EmpBalanceDueLCY_4__Control26CaptionLbl)
            {
            }
            column(EmpBalanceDueLCY_3__Control27Caption; EmpBalanceDueLCY_3__Control27CaptionLbl)
            {
            }
            column(EmpBalanceDueLCY_2__Control28Caption; EmpBalanceDueLCY_2__Control28CaptionLbl)
            {
            }
            column(EmpBalanceDueLCY_1__Control29Caption; EmpBalanceDueLCY_1__Control29CaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(Balance; Balance)
            {
            }
           trigger OnAfterGetRecord()
            var
                FilteredEmployee: Record Vendor;
                ShouldSkipEmployee: Boolean;
            begin
                FilteredEmployee.CopyFilters(Vendor);
                FilteredEmployee.SetFilter("Date Filter", '..%1', StartDate);
                FilteredEmployee.SetRange("No.", "No.");
                ShouldSkipEmployee := FilteredEmployee.IsEmpty();
                Vendor.CalcFields(Balance);
                OnEmployeeOnAfterGetRecordOnAfterCalcShouldSkipEmployee(Vendor, FilteredEmployee, DtldEmpLedgEntry, EmpBalanceDueLCY, PrintEmp, ShouldSkipEmployee);
                if ShouldSkipEmployee then
                    CurrReport.Skip();

                PrintEmp := false;
                for i := 1 to 5 do begin
                    // DtldEmpLedgEntry.SetCurrentKey("No.", "Initial Entry Due Date", "Posting Date");
                    DtldEmpLedgEntry.SetCurrentKey("Vendor No.", "Posting Date");
                    DtldEmpLedgEntry.SetRange("Vendor No.", "No.");
                    DtldEmpLedgEntry.SetRange("Posting Date", 0D, StartDate);
                    // DtldEmpLedgEntry.SetRange("Initial Entry Due Date", PeriodStartDate[i], PeriodStartDate[i + 1] - 1);
                    DtldEmpLedgEntry.SetRange("Posting Date", PeriodStartDate[i], PeriodStartDate[i + 1] - 1);
                    OnAfterGetRecordOnAfterDtldEmpLedgEntrySetFilters(DtldEmpLedgEntry);
                    DtldEmpLedgEntry.CalcSums("Amount (LCY)");
                    EmpBalanceDueLCY[i] := DtldEmpLedgEntry."Amount (LCY)";
                    if EmpBalanceDueLCY[i] <> 0 then
                        PrintEmp := true;
                end;
                if not PrintEmp then
                    CurrReport.Skip();
            end;
            trigger OnPreDataItem()
            begin
                Clear(EmpBalanceDueLCY);
            end;
        }
        
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(Options)
                {
                     Caption = 'Options';
                    field(StartingDate; StartDate)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Starting Date';
                        ToolTip = 'Specifies the date from which the report or batch job processes information.';
                    }
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
        trigger OnOpenPage()
        var
        begin
        if StartDate = 0D then
           StartDate := WorkDate();    
        end;
    }
    trigger OnPreReport()
    var
     FormatDocument: Codeunit "Format Document";
    begin
        if CompanyInfo.get() then
            CompanyInfo.CalcFields(Picture);
        if UserSetup.Get(UserId) then
            FormatAddr.GetCompanyAddr(UserSetup."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);

        //EmpFilter := FormatDocument.GetRecordFiltersWithCaptions(Employee);
        PeriodStartDate[5] := StartDate;
        PeriodStartDate[6] := DMY2Date(31, 12, 9999);
        for i := 4 downto 2 do
            PeriodStartDate[i] := CalcDate('<-30D>', PeriodStartDate[i + 1]);
    end;
    var
    DtldEmpLedgEntry: Record "Detailed Vendor Ledg. Entry";
    StartDate: Date;
    PeriodStartDate: array[6] of Date;
    EmpBalanceDueLCY: array[5] of Decimal;
    PrintEmp: Boolean;
    i: Integer;
    Text001: Label 'As of %1';
    Employee___Summary_Aging_Simp_CaptionLbl: Label 'Employee - Summary Aging Simp.';
   CurrReport_PAGENOCaptionLbl: Label 'Page';
    All_amounts_are_in_LCYCaptionLbl: Label 'All amounts are in LCY';
    EmpBalanceDueLCY_5__Control25CaptionLbl: Label 'Not Due';
    EmpBalanceDueLCY_4__Control26CaptionLbl: Label '0-30 days';
    EmpBalanceDueLCY_3__Control27CaptionLbl: Label '31-60 days';
    EmpBalanceDueLCY_2__Control28CaptionLbl: Label '61-90 days';
    EmpBalanceDueLCY_1__Control29CaptionLbl: Label 'Over 90 days';
    TotalCaptionLbl: Label 'Total';
    CompanyInfo: Record "Company Information";
    UserSetup: Record "User Setup";
    RespCenter: Record "Responsibility Center";
    CompanyAddr: array[8] of Text[100];
    CustomFunction: Codeunit "Custom Function";
    FormatAddr: Codeunit "Format Address";

    protected var
    EmpFilter: Text;

    procedure InitializeRequest(StartingDate: Date)
    begin
        StartDate := StartingDate;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetRecordOnAfterDtldEmpLedgEntrySetFilters(var DetailedEmpLedgEntry: Record "Detailed Vendor Ledg. Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnEmployeeOnAfterGetRecordOnAfterCalcShouldSkipEmployee(Employee: Record Vendor; var FilteredEmployee: Record Vendor; var DetailedEmpLedgEntry: Record "Detailed Vendor Ledg. Entry"; var EmpBalanceDueLCY: array[5] of Decimal; var PrintEmp: Boolean; var ShouldSkipEmployee: Boolean)
    begin
    end;

}
