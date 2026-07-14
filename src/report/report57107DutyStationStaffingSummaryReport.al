namespace ADAK.ADAK;

using Microsoft.Foundation.Company;
using Microsoft.HumanResources.Employee; 

report 57107 "Duty Station Staffing Summary"
{
    ApplicationArea = All;
    Caption = 'Duty Station Staffing Summary Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './ADAK PHASE 2/Layouts/Duty Station Staffing Summary Report.rdlc';

    dataset
    {
        dataitem(CompanyInfos; "Company Information")
        {
            DataItemTableView = sorting("Primary Key");
            
            column(CompanyName; Name) { }
            column(CompanyAddress; Address) { }
            column(CompanyAddress2; "Address 2") { }
            column(CompanyLogo; Picture) { }
            column(CompanyMotto; Motto) { }
            column(CompanyEmail; "E-Mail") { }
            column(CompanyHomePage; "Home Page") { }
            column(CompanyPhone; "Phone No.") { }

            trigger OnAfterGetRecord()
            begin
                CompanyInfos.CalcFields(Picture);
            end;
        }
        dataitem(Summary; "Duty Station")
        {
            DataItemTableView = sorting(Code);

            column(TotalEstablishment; TotalEstablishment) { }
            column(TotalActiveStaff; TotalActiveStaff) { }
            column(ActiveStaffMale; ActiveStaffMale) { }
            column(ActiveStaffFemale; ActiveStaffFemale) { }
            column(ActiveStaffMalePercent; ActiveStaffMalePercent) { }
            column(ActiveStaffFemalePercent; ActiveStaffFemalePercent) { }
            column(ExitedStaffCount; ExitedStaffCount) { }
            column(OverallRetentionRate; OverallRetentionRate) { }

            trigger OnPreDataItem()
            var
                EmpRec: Record "Employee";
                StationCalc: Record "Duty Station";
            begin
                IsSummaryCalculated := false;

                // Execute heavy calculations exactly once before rows are processed
                EmpRec.Reset();
                EmpRec.SetRange(Status, EmpRec.Status::Active);
                TotalActiveStaff := EmpRec.Count();

                EmpRec.SetRange(Gender, EmpRec.Gender::Male);
                ActiveStaffMale := EmpRec.Count();

                EmpRec.SetRange(Gender, EmpRec.Gender::Female);
                ActiveStaffFemale := EmpRec.Count();

                EmpRec.Reset();
                EmpRec.SetRange(Status, EmpRec.Status::Terminated);
                ExitedStaffCount := EmpRec.Count();

                TotalEstablishment := 0;
                StationCalc.Reset();
                StationCalc.SetRange(Blocked, false);
                if StationCalc.FindSet() then
                    repeat
                        TotalEstablishment += StationCalc."Approved Establishment";
                    until StationCalc.Next() = 0;

                if TotalActiveStaff > 0 then begin
                    ActiveStaffMalePercent := (ActiveStaffMale / TotalActiveStaff) * 100;
                    ActiveStaffFemalePercent := (ActiveStaffFemale / TotalActiveStaff) * 100;
                end else begin
                    ActiveStaffMalePercent := 0;
                    ActiveStaffFemalePercent := 0;
                end;

                if (TotalActiveStaff + ExitedStaffCount) > 0 then
                    OverallRetentionRate := (TotalActiveStaff / (TotalActiveStaff + ExitedStaffCount)) * 100
                else
                    OverallRetentionRate := 0;
            end;

            trigger OnAfterGetRecord()
            begin
                // Stop subsequent rows immediately before running code or writing duplicates
                if IsSummaryCalculated then
                    CurrReport.Skip();

                IsSummaryCalculated := true;
            end;
        }

        dataitem(DutyStation; "Duty Station")
        {
            DataItemTableView = sorting(Code) where(Blocked = const(false));

            column(StationCode; Code) { }
            column(StationDescription; Description) { }
            column(RegionID; "Region ID") { }
            column(BudgetedEst; "Approved Establishment") { }
            column(ActiveFTE; "No. of Active Employees") { }
            column(Vacancies; Vacancies) { }
            column(FilledUpPercent; FilledUpPercent) { }
            column(MaleCount; MaleCount) { }
            column(FemaleCount; FemaleCount) { }
            column(ExitedStaff; ExitedStaff) { }
            column(RetentionPercent; RetentionPercent) { }

            trigger OnAfterGetRecord()
            var
                EmpRec: Record "Employee";
            begin
                MaleCount := 0;
                FemaleCount := 0;
                ExitedStaff := 0;

                DutyStation.CalcFields("No. of Active Employees");

                EmpRec.Reset();
                EmpRec.SetRange("Current Duty Station", DutyStation.Code); 
                EmpRec.SetRange(Status, EmpRec.Status::Active);
                
                EmpRec.SetRange(Gender, EmpRec.Gender::Male);
                MaleCount := EmpRec.Count();

                EmpRec.SetRange(Gender, EmpRec.Gender::Female);
                FemaleCount := EmpRec.Count();

                EmpRec.Reset();
                EmpRec.SetRange("Current Duty Station", DutyStation.Code); 
                EmpRec.SetRange(Status, EmpRec.Status::Terminated);
                ExitedStaff := EmpRec.Count();

                if DutyStation."Approved Establishment" > DutyStation."No. of Active Employees" then
                    Vacancies := DutyStation."Approved Establishment" - DutyStation."No. of Active Employees"
                else
                    Vacancies := 0;

                if DutyStation."Approved Establishment" > 0 then
                    FilledUpPercent := (DutyStation."No. of Active Employees" / DutyStation."Approved Establishment") * 100
                else
                    FilledUpPercent := 0;

                if (DutyStation."No. of Active Employees" + ExitedStaff) > 0 then
                    RetentionPercent := (DutyStation."No. of Active Employees" / (DutyStation."No. of Active Employees" + ExitedStaff)) * 100
                else
                    RetentionPercent := 0;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName) { }
            }
        }
        actions
        {
            area(Processing) { }
        }
    }

    var
        CompanyInfo: Record "Company Information";
        IsSummaryCalculated: Boolean;
        TotalEstablishment: Integer;
        TotalActiveStaff: Integer;
        ActiveStaffMale: Integer;
        ActiveStaffFemale: Integer;
        ActiveStaffMalePercent: Decimal;
        ActiveStaffFemalePercent: Decimal;
        ExitedStaffCount: Integer;
        OverallRetentionRate: Decimal;
        MaleCount: Integer;
        FemaleCount: Integer;
        ExitedStaff: Integer;
        Vacancies: Integer;
        FilledUpPercent: Decimal;
        RetentionPercent: Decimal;
}