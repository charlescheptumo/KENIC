namespace KENIC.KENIC;

page 50368 "Transaction Posting Log"
{
    ApplicationArea = All;
    Caption = 'Transaction Posting Log';
    PageType = List;
    SourceTable = "Transaction Posting Log";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }

                field("Source Table"; Rec."Source Table")
                {
                    ApplicationArea = All;
                }

                field("Source Record ID"; Rec."Source Record ID")
                {
                    ApplicationArea = All;
                }

                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }

                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }

                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }

                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }

                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                }

                field("Error Description"; Rec."Error Description")
                {
                    ApplicationArea = All;
                }

                field("Log DateTime"; Rec."Log DateTime")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ClearLog)
            {
                ApplicationArea = All;
                Caption = 'Clear Log';
                Image = Delete;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = false;
                ToolTip = 'Deletes all transaction posting log entries.';

                trigger OnAction()
                var
                    PostingLog: Record "Transaction Posting Log";
                begin
                    if not Confirm(
                        'Are you sure you want to delete all transaction posting log entries?')
                    then
                        exit;

                    PostingLog.DeleteAll(true);

                    CurrPage.Update(false);

                    Message('Transaction posting log has been cleared.');
                end;
            }
        }
    }
}