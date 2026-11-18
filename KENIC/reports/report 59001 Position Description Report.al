report 59931 "Position Description Report"
{
    Caption = 'Position / Job Description';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './KENIC/layout/Rep59001PositionDescription.rdlc';

    dataset
    {
        dataitem(Position; "Company Positions")
        {
            RequestFilterFields = "Position ID", Directorate, Department, "Position Category", Blocked;

            // Company Information
            column(CompanyInfo_Name; CompanyInfo.Name) { }
            column(CompanyInfo_Picture; CompanyInfo.Picture) { }
            column(CompanyInfo_Address; CompanyInfo.Address) { }
            column(CompanyInfo_Address2; CompanyInfo."Address 2") { }
            column(CompanyInfo_City; CompanyInfo.City) { }
            column(CompanyInfo_Phone; CompanyInfo."Phone No.") { }
            column(CompanyInfo_Email; CompanyInfo."E-Mail") { }

            // Position Header
            column(Position_ID; "Position ID") { }
            column(Job_Title; "Job Title") { }
            column(Job_Purpose; "Executive Summary/Job Purpose") { }
            column(Position_Category; Format("Position Category")) { }
            column(Seniority_Level; Format("Seniority Level")) { }
            column(Employment_Type; Format("Employment Type")) { }
            column(Effective_Date; Format("Effective Date", 0, '<Day,2>/<Month,2>/<Year4>')) { }
            column(Blocked; Blocked) { }

            // Organisation Structure
            column(Directorate_Code; Directorate) { }
            column(Directorate_Name; DirectorateName) { }
            column(Department_Code; Department) { }
            column(Department_Name; DepartmentName) { }
            column(Directly_Reports_To; "Directly Reports To") { }
            column(Directly_Reports_Desc; "Directly Reports des") { }
            column(Indirectly_Reports_To; "Indirectly Reports To") { }
            column(Indirectly_Reports_Desc; IndirectReportsToDesc) { }
            column(Designation_Group; "Designation Group") { }
            column(Job_Grade_ID; "Job Grade ID") { }
            column(Appointment_Authority; "Overall Appointment Authority") { }

            // Requirements
            column(Min_Academic_Qualification; "Minimum Academic Qualification") { }
            column(Min_Work_Experience; "Minimum Work Experience") { }
            column(Min_Mngmnt_Experience; "Minimum Mngmnt Experience") { }

            // Terms & Conditions
            column(Default_Terms_of_Service; "Default Terms of Service") { }
            column(Default_Probation_Period; Format("Default Probation Period")) { }
            column(Contract_Duration; Format("Contract Duration")) { }
            column(Default_Duty_Station; "Default Duty Station") { }
            column(Default_Work_Shift; "Default Work Shift") { }
            column(Work_Shift_Description; "Work Shift Description") { }
            column(Travel_Frequency; Format("Travel Frequency")) { }
            column(Additional_Responsibilities; "Additional Responsibilities") { }
            column(Loc_Relocation_Transfers; "Loc Relocation/Transfers") { }
            column(Int_Relocation_Transfers; "Int Relocation/Transfers") { }
            column(Qualifies_for_Overtime; "Qualifies for Overtime") { }

            // Establishment & Cost
            column(Approved_Establishment; "Approved Establishment") { }
            column(No_of_Active_Contracts; "No of Active Contracts") { }
            column(No_of_Terminated_Contracts; "No. of Terminated Contracts") { }
            column(Direct_Hire_Unit_Cost; "Direct Hire Unit Cost") { }
            column(Average_Monthly_Salary; "Average Monthly Salary (LCY)") { }
            column(Maximum_Monthly_Salary; "Maximum Monthly Salary (LCY)") { }

            // Key Responsibilities
            dataitem(Responsibility; "Positions Responsibility")
            {
                DataItemLink = "Position ID" = field("Position ID");
                DataItemTableView = sorting("Position ID", "Line No") where(Type = const(Responsibility));

                column(Resp_Line_No; "Line No") { }
                column(Resp_Category; Category) { }
                column(Resp_Description; Description) { }
            }

            // Job Dimensions
            dataitem(JobDimension; "Positions Responsibility")
            {
                DataItemLink = "Position ID" = field("Position ID");
                DataItemTableView = sorting("Position ID", "Line No") where(Type = const("Job Dimensions"));

                column(Dim_Line_No; "Line No") { }
                column(Dim_Category; Category) { }
                column(Dim_Description; Description) { }
            }

            // Work Conditions
            dataitem(WorkCondition; "Position Work Condition")
            {
                DataItemLink = "Position ID" = field("Position ID");
                DataItemTableView = sorting("Position ID", "Line No");

                column(WC_Line_No; "Line No") { }
                column(WC_Category; Format("Work Condition Category")) { }
                column(WC_Description; Description) { }
            }

            trigger OnAfterGetRecord()
            var
                ResponsibilityCenter: Record "Responsibility Center";
                ReportsToPosition: Record "Company Positions";
            begin
                DirectorateName := '';
                DepartmentName := '';
                IndirectReportsToDesc := '';

                if Directorate <> '' then
                    if ResponsibilityCenter.Get(Directorate) then
                        DirectorateName := ResponsibilityCenter.Name;

                if Department <> '' then
                    if ResponsibilityCenter.Get(Department) then
                        DepartmentName := ResponsibilityCenter.Name;

                if "Indirectly Reports To" <> '' then
                    if ReportsToPosition.Get("Indirectly Reports To") then
                        IndirectReportsToDesc := ReportsToPosition."Job Title";
            end;
        }
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        DirectorateName: Text[100];
        DepartmentName: Text[100];
        IndirectReportsToDesc: Text[250];
}
