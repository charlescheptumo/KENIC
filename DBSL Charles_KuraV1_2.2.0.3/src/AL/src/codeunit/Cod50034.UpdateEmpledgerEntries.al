namespace KICD.KICD;
using Microsoft.HumanResources.Payables;

codeunit 50034 "UpdateEmp ledger Entries"
{
    Permissions = tabledata "Detailed Employee Ledger Entry" = rimd,
   tabledata "Employee Ledger Entry" = rimd;

    trigger OnRun()
    begin
        DetailedEmployeeLedgerEntry.Reset();
        DetailedEmployeeLedgerEntry.SetRange("Entry No.", 1122);
        DetailedEmployeeLedgerEntry.SetRange("Document No.", 'BIMPREQ0004');
        if DetailedEmployeeLedgerEntry.FindFirst() then begin
            DetailedEmployeeLedgerEntry."Document No." := 'IMP1015';
            DetailedEmployeeLedgerEntry.Modify(true);
        end;
        EmployeeLedgerEntry.Reset();
        EmployeeLedgerEntry.SetRange("Entry No.", 3537);
        EmployeeLedgerEntry.SetRange("Document No.", 'BIMPREQ0004');
        if EmployeeLedgerEntry.FindFirst() then begin
            EmployeeLedgerEntry."Document No." := 'IMP1015';
            EmployeeLedgerEntry.Modify(true);

        end;
    end;

    var
        DetailedEmployeeLedgerEntry: Record "Detailed Employee Ledger Entry";
        EmployeeLedgerEntry: Record "Employee Ledger Entry";
}
