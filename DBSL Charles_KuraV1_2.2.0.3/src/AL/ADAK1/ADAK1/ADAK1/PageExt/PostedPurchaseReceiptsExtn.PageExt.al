pageextension 50200 PostedPurchaseReceiptsExtn143 extends "Posted Purchase Receipts"
{


    actionS
    {
        addafter("&Print")
        {
            action("Print GRN")
            {
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = Suite;
                ToolTip = 'Executes the Print GRN action.';

                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetRange("No.", Rec."No.");
                    REPORT.Run(REPORT::"Good Receive Note_PROC", true, true, Rec);
                    Rec.Reset();
                end;
            }
        }
    }


}
