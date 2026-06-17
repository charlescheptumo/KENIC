page 50349 "GL Entry Imprest Backfill"
{
    PageType = Card;
    UsageCategory = Tasks;
    ApplicationArea = All;
    Caption = 'GL Entry Imprest Backfill';
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Date Range';
                field(DateFrom; DateFrom)
                {
                    ApplicationArea = All;
                    Caption = 'Posting Date From';
                }
                field(DateTo; DateTo)
                {
                    ApplicationArea = All;
                    Caption = 'Posting Date To';
                }
            }
            group(ResultGroup)
            {
                Caption = 'Last Run';
                Visible = HasRun;
                field(LastUpdated; LastUpdated)
                {
                    ApplicationArea = All;
                    Caption = 'Entries Updated';
                    Editable = false;
                }
                field(LastSkipped; LastSkipped)
                {
                    ApplicationArea = All;
                    Caption = 'Entries Skipped';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(RunBackfill)
            {
                ApplicationArea = All;
                Caption = 'Run Backfill';
                Image = UpdateDescription;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    Backfill: Codeunit "GL Entry Imprest Backfill";
                begin
                    if not Confirm('Run GL Entry backfill from %1 to %2?', true, DateFrom, DateTo) then
                        exit;
                    Backfill.RunBackfill(DateFrom, DateTo);
                    HasRun := true;
                end;
            }

            action(ViewGLEntries)
            {
                ApplicationArea = All;
                Caption = 'View GL Entries';
                Image = Ledger;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    GLEntry: Record "G/L Entry";
                begin
                    GLEntry.SetRange("Posting Date", DateFrom, DateTo);
                    Page.Run(Page::"General Ledger Entries", GLEntry);
                end;
            }
        }
    }

    var
        DateFrom: Date;
        DateTo: Date;
        LastUpdated: Integer;
        LastSkipped: Integer;
        HasRun: Boolean;

    trigger OnOpenPage()
    begin
        DateFrom := DMY2Date(1, 3, 2026);
        DateTo := DMY2Date(31, 3, 2026);
    end;
}
