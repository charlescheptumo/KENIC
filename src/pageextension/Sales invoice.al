
pageextension 50346 "Sales Invoice NoDelete Ext" extends "Sales Invoice"
{
    trigger OnDeleteRecord(): Boolean
    begin
        // Prevent deletion of sales invoices
        Error('Deleting sales invoices is not allowed.');
        exit(false);
    end;
}