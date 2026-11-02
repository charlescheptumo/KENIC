page 50764 "Posted Mileage Claims"
{
    // Posted Staff Claims that were created from approved mileage forms.
    Caption = 'Posted Mileage Claims';
    ApplicationArea = Basic;
    CardPageID = "Posted Staff Claim";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = payments;
    SourceTableView = sorting("No.") order(descending) where("Payment Type" = const("Staff Claim"),
                            "Mileage Claim No." = filter(<> ''),
                            Posted = const(true));
    UsageCategory = History;

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
                field("Mileage Claim No."; Rec."Mileage Claim No.")
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
                    Rec.TestField("Mileage Claim No.");
                    MileageClaim.SetRange("No.", Rec."Mileage Claim No.");
                    Report.Run(Report::"Employee Mileage Reimbursement", true, false, MileageClaim);
                end;
            }
        }
    }
}
