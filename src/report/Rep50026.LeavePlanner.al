report 50026 "Leave Planner"
{
    ApplicationArea = All;
    Caption = 'Leave Planner';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/LeavePlan.rdl';
    dataset
    {
        dataitem(HRLeavePlannerHeader; "HR Leave Planner Header")
        {
            RequestFilterFields = "Shortcut Dimension 3 Code", "Leave Period";
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
            column(ApplicationCode; "Application Code")
            {
            }
            column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
            {
            }
            column(Leave_Period; "Leave Period")
            {

            }
            dataitem("HR Leave Planner Lines"; "HR Leave Planner Lines")
            {
                column(Employee_No; "Employee No")
                {

                }
                column(Employee_Name; "Employee Name")
                {

                }
                column(Leave_Type; "Leave Type")
                {

                }
                column(Reliever; Reliever)
                {

                }
                column(Reliever_Name; "Reliever Name")
                {

                }
                dataitem("Leave Plan Detailed Lines"; "Leave Plan Detailed Lines")
                {
                    column(Start_Date; "Start Date")
                    {

                    }
                    column(End_Date; "End Date")
                    {

                    }
                    column(Days_Applied; "Days Applied")
                    {

                    }

                }
            }
            trigger OnAfterGetRecord()
            begin
                if CompanyInfo.get() then
                    CompanyInfo.CalcFields(Picture);
                if UserSetup.Get() then
                    FormatAddr.GetCompanyAddr(UserSetup."Region Code", RespCenter, CompanyInfo, CompanyAddr)
                else
                    FormatAddr.Company(CompanyAddr, CompanyInfo);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var

    var
        ResponsibilityCenter: Record "Responsibility Center";
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RespCenter: Record "Responsibility Center";
        UserSetup: Record "User Setup";
}
