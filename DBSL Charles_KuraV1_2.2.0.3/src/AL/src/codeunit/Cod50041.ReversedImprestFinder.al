namespace KICD.KICD;

using Microsoft.Finance.GeneralLedger.Ledger;

codeunit 50041 "Reversed Imprests Mgt"
{
    procedure RecalculateReversedImprests()
    var
        Payment: Record Payments;
        Counter: Integer;
    begin
        Payment.Reset();
        Payment.SetRange("Payment Type", Payment."Payment Type"::Imprest);

        if Payment.FindSet() then
            repeat
                Payment.CalcFields(Reversed);
                Counter += 1;
            until Payment.Next() = 0;

        Message('%1 imprest records recalculated.', Counter);
    end;

    procedure IsImprestReversed(DocumentNo: Code[20]): Boolean
    var
        GLEntry: Record "G/L Entry";
    begin
        GLEntry.Reset();
        GLEntry.SetRange("Document No.", DocumentNo);
        GLEntry.SetRange(Reversed, true);

        exit(GLEntry.FindFirst());
    end;
}