namespace KICD.KICD;
using Microsoft.HumanResources.Payables;

report 50120 "Emp Ledger Entry Doc No Fix"
{
    Caption = 'Emp Ledger Entry Doc No Fix';
    ApplicationArea = All;
    ProcessingOnly = true;
    AllowScheduling = true;
    UsageCategory = ReportsAndAnalysis;
    Permissions = tabledata "Employee Ledger Entry" = rimd,
                  tabledata "Detailed Employee Ledger Entry" = rimd;
    dataset
    {
        
        dataitem(BatchImprestVoucherLines; "Batch Imprest Voucher Lines")
        {
        RequestFilterFields = "No.";
        trigger OnAfterGetRecord()
        var
        EmpLedgEntry: Record "Employee Ledger Entry";
        DetEmpLedgEntry: Record "Detailed Employee Ledger Entry";
        begin
            if ("Account No." <> '') and ("Imprest Req. No." <> '') then
            begin
                EmpLedgEntry.Reset();
                EmpLedgEntry.SetRange("Employee No.","Account No.");
                EmpLedgEntry.SetRange("Document No.","No.");
                If EmpLedgEntry.FindFirst() then
                begin
                    if EmpLedgEntry."Document No." <> BatchImprestVoucherLines."Imprest Req. No." then
                    begin
                        EmpLedgEntry."Document No." := BatchImprestVoucherLines."Imprest Req. No.";
                        EmpLedgEntry.Modify(); 
                         Countimp += 1;
                        DetEmpLedgEntry.Reset();
                        DetEmpLedgEntry.SetRange("Employee No.","Account No.");
                        DetEmpLedgEntry.SetRange("Document No.","No.");
                        if DetEmpLedgEntry.FindFirst() then
                        if DetEmpLedgEntry."Document No." <> BatchImprestVoucherLines."Imprest Req. No." then
                        begin
                        DetEmpLedgEntry."Document No." := BatchImprestVoucherLines."Imprest Req. No.";
                        DetEmpLedgEntry.Modify();
                        end;
                                    
                    end;
                end;
            end;
            
        end;
        }
    }
    
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        Countimp := 0;
        
    end;
    trigger OnPostReport()
    var
    begin
       Message('%1 Employee Ledger Entries successfully updated.', Countimp);   
    end;
    var
    Countimp: Integer;

}
