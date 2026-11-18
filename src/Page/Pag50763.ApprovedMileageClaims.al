page 50763 "Approved Mileage Claims"
{
    // Approved mileage forms. On approval each form becomes a Staff Claim (see "Staff Claim
    // No.", paid from Approved Staff Claims) and the form itself is closed.
    Caption = 'Approved Mileage Claims';
    ApplicationArea = Basic;
    CardPageID = "Employee Mileage Claim";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = payments;
    SourceTableView = sorting("No.") order(descending) where("Payment Type" = const("Staff Claim"),
                            "Mileage Claim" = const(true),
                            Status = filter(Closed),
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
                field("Staff Claim No."; Rec."Staff Claim No.")
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
            action(OpenStaffClaim)
            {
                ApplicationArea = Basic;
                Caption = 'Open Staff Claim';
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    StaffClaim: Record payments;
                begin
                    Rec.TestField("Staff Claim No.");
                    StaffClaim.Get(Rec."Staff Claim No.");
                    if StaffClaim.Posted then
                        Page.Run(Page::"Posted Staff Claim", StaffClaim)
                    else
                        Page.Run(Page::"Aprroved Staff Claim", StaffClaim);
                end;
            }
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
