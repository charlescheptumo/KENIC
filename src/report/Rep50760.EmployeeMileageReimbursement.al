report 50760 "Employee Mileage Reimbursement"
{
    // Prints the Employee Mileage Reimbursement Form (laid out like KENIC's Excel form).
    Caption = 'Employee Mileage Reimbursement Form';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/EmployeeMileageReimbursement.rdlc';
    PreviewMode = PrintLayout;
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(MileageClaim; payments)
        {
            DataItemTableView = sorting("No.") where("Payment Type" = const("Staff Claim"), "Mileage Claim" = const(true));
            RequestFilterFields = "No.", "Account No.";

            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(ClaimNo; MileageClaim."No.")
            {
            }
            column(EmployeeName; MileageClaim."Account Name")
            {
            }
            column(EmployeeID; MileageClaim."Account No.")
            {
            }
            column(PeriodFrom; Format(MileageClaim."Mileage Period From"))
            {
            }
            column(PeriodTo; Format(MileageClaim."Mileage Period To"))
            {
            }
            column(VehicleModel; MileageClaim."Vehicle Model")
            {
            }
            column(EngineCC; MileageClaim."Vehicle Engine CC")
            {
            }
            column(VehicleRegNo; MileageClaim."Vehicle Reg. No.")
            {
            }
            column(MileageRate; MileageClaim."Mileage Rate")
            {
            }
            column(Purpose; MileageClaim."Payment Narration")
            {
            }
            column(TotalReimbursement; MileageClaim."Total Amount")
            {
            }
            column(ClaimDate; Format(MileageClaim.Date))
            {
            }
            column(ClaimStatus; Format(MileageClaim.Status))
            {
            }
            column(AuthorizedBy; AuthorizedBy)
            {
            }
            column(AuthorizedDate; AuthorizedDate)
            {
            }
            dataitem(Trip; "PV Lines")
            {
                DataItemLink = No = field("No.");
                DataItemTableView = sorting(No, "Line No");

                column(TripLineNo; Trip."Line No")
                {
                }
                column(TripDate; Format(Trip.Date))
                {
                }
                column(TripDescription; Trip.Description)
                {
                }
                column(StartLocation; Trip."Start Location")
                {
                }
                column(EndLocation; Trip."End Location")
                {
                }
                column(Kilometres; Trip.Kilometres)
                {
                }
                column(TripAmount; Trip.Amount)
                {
                }
            }

            trigger OnAfterGetRecord()
            var
                ApprovalEntry: Record "Approval Entry";
                User: Record User;
            begin
                MileageClaim.CalcFields("Total Amount");

                // "Authorized By": the last approver.
                AuthorizedBy := '';
                AuthorizedDate := '';
                ApprovalEntry.SetRange("Table ID", Database::payments);
                ApprovalEntry.SetRange("Document No.", MileageClaim."No.");
                ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Approved);
                if ApprovalEntry.FindLast() then begin
                    AuthorizedBy := ApprovalEntry."Approver ID";
                    User.SetRange("User Name", ApprovalEntry."Approver ID");
                    if User.FindFirst() then
                        if User."Full Name" <> '' then
                            AuthorizedBy := User."Full Name";
                    AuthorizedDate := Format(DT2Date(ApprovalEntry."Last Date-Time Modified"));
                end;
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
        AuthorizedBy: Text[100];
        AuthorizedDate: Text[30];
}
