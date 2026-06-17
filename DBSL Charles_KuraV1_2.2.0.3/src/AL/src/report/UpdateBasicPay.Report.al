namespace KICD.KICD;
using Microsoft.HumanResources.Employee;

report 50124 UpdateBasicPay
{
    ApplicationArea = All;
    Caption = 'UpdateBasicPay';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(Employee; Employee)
        {

            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                assing2.reset;
                assing2.setrange(assing2."Employee No", Employee."No.");
                assing2.SETRANGE(assing2.CODE, 'BS');
                assing2.SetRange(assing2."Pay Period", 'September');
                if assing2.findset then begin
                    assing3.reset;
                    assing3.setrange(assing3."Employee No", Employee."No.");
                    ASSING3.SETRANGE(assing3.CODE, 'BS');
                    assing3.SetRange(assing3."Pay Period", 'October');
                    if assing3.findset then begin
                        assing3.Amount := assing2.Amount;
                        assing3.Modify(true);
                    end;
                end;
            end;
        }
    }
    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }
    var
        basicpay: decimal;
        assing2: record "Assignment Matrix-X";
        assing3: record "Assignment Matrix-X";
}

