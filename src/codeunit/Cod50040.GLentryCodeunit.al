codeunit 50340 "GL Entry Imprest Backfill"
{
    Permissions = tabledata "G/L Entry" = rm;

    trigger OnRun()
    begin
        RunBackfill(0D, 0D);
    end;

    procedure RunBackfill(DateFrom: Date; DateTo: Date)
    var
        GLEntry: Record "G/L Entry";
        Payment: Record Payments;
        Updated: Integer;
        Skipped: Integer;
        IsSurrender: Boolean;
    begin
        GLEntry.Reset();

        if (DateFrom <> 0D) and (DateTo <> 0D) then
            GLEntry.SetRange("Posting Date", DateFrom, DateTo);

        if not GLEntry.FindSet(true) then begin
            Message('No GL Entries found for the selected period.');
            exit;
        end;

        repeat
            Payment.Reset();
            Payment.SetRange("No.", GLEntry."Document No.");

            if Payment.FindFirst() then begin
                IsSurrender := Payment.Type = 'SURRENDER';

                GLEntry.UpdateImprestFields(
                    Payment."Account No.",
                    Payment."Account Name",
                    Payment."Paying Bank Account",
                    Payment."Bank Name",
                    Payment."Destination Narration",
                    IsSurrender
                );

                Updated += 1;
            end else
                Skipped += 1;

        until GLEntry.Next() = 0;

        Message(
            'Done.\Updated: %1\Skipped (no match): %2',
            Updated,
            Skipped
        );
    end;
}