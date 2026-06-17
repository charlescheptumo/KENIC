reportextension 50000 "Calculate Inventory By Date" extends "Calculate Inventory"
{
    dataset
    {
        modify("Item Ledger Entry")
        {
            trigger OnAfterAfterGetRecord()
            begin
                if "Item Ledger Entry"."Posting Date" > PostingDate then
                    CurrReport.Skip();
            end;
        }
    }
}