page 50762 "Employee Mileage Claims"
{
    // Employee Mileage Reimbursement Form: open or pending approval.
    Caption = 'Employee Mileage Reimbursement';
    ApplicationArea = Basic;
    CardPageID = "Employee Mileage Claim";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = payments;
    SourceTableView = sorting("No.") order(descending) where("Payment Type" = const("Staff Claim"),
                            "Mileage Claim" = const(true),
                            Status = filter(Open | "Pending Approval"),
                            Posted = const(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Director/Employee ID';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Director/Employee Name';
                }
                field("Vehicle Reg. No."; Rec."Vehicle Reg. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Mileage Period From"; Rec."Mileage Period From")
                {
                    ApplicationArea = Basic;
                }
                field("Mileage Period To"; Rec."Mileage Period To")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Reimbursement';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(PrintForm)
            {
                ApplicationArea = Basic;
                Caption = 'Print Mileage Form';
                Image = Print;
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    MileageClaim: Record payments;
                begin
                    MileageClaim.SetRange("No.", Rec."No.");
                    Report.Run(Report::"Employee Mileage Reimbursement", true, false, MileageClaim);
                end;
            }
        }
    }
}
