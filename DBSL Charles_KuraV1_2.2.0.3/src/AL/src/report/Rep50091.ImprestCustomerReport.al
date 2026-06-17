namespace KICD.KICD;

using Microsoft.HumanResources.Employee;
using Microsoft.Sales.Customer;

report 50091 "Imprest Customer Report"
{
    ApplicationArea = All;
    Caption = 'Imprest Customer Report';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(Employee; Employee)
        {
            trigger OnAfterGetRecord()
            var
            CustRec: Record Customer;
            CashMgtSetup: Record "Cash Management Setup";
            begin
            if not CustRec.Get(Employee."No.") then begin
            CashMgtSetup.Get;
            //CashMgtSetup.TestField("Imprest Posting Group");
            CustRec."No." := Employee."No."; 
            CustRec.Name := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name"; 
            //CustRec."Customer Posting Group" := CashMgtSetup."Imprest Posting Group"; 
            CustRec.Insert;
        end 
                
            end;   
        }
    }
    
    }

