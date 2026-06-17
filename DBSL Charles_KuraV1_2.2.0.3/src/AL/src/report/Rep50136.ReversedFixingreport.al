namespace KICD.KICD;

using Microsoft.Finance.GeneralLedger.Ledger;

report 50201 "Reversed Imprests Report"
{
    ProcessingOnly = true;
    ApplicationArea = All;
    UsageCategory = Tasks;
    Caption = 'Reversed Imprests Report';

    dataset
    {
        dataitem(Payments; Payments)
        {
            DataItemTableView = where("Payment Type" = const(Imprest));

            trigger OnAfterGetRecord()
            var
                GLEntry: Record "G/L Entry";
            begin
                GLEntry.Reset();
                GLEntry.SetRange("Document No.", Payments."No.");
                GLEntry.SetRange(Reversed, true);

                if GLEntry.FindFirst() then
                    Counter += 1;
            end;

            trigger OnPostDataItem()
            begin
                Message('%1 reversed imprest(s) found in G/L Entries.', Counter);
            end;
        }
    }

    var
        Counter: Integer;
}