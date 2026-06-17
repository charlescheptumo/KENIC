namespace KICD.KICD;

report 50125 "Delete AssignMat Payroll"
{
    ApplicationArea = All;
    Caption = 'Delete AssignMat Payroll';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(Assignmat; "Assignment Matrix-X")
        {
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Filter)
                {
                    field(PayPeriod; PayPeriod)
                    {
                        ApplicationArea = All;
                        Caption = 'Payroll Period to Delete';
                        TableRelation = "Payroll PeriodX";
                    }
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
    begin
        if PayPeriod = 0D then
            Error('Please specify the Payroll Period.');
    end;

    trigger OnPostReport()
    begin
        DeleteAssignMat();
    end;

    local procedure DeleteAssignMat()
    begin
        AssignmatRec.Reset();
        AssignmatRec.SetRange("Payroll Period", PayPeriod);
        //AssignmatRec.SetFilter("Employee No", '1552..1572');
        
        AssignmatRec.SetFilter("Employee No", '1552|1553|1554|1555|1556|1557|1558|1559|1560|1561|1562|1563|1564|1565|1566|1567|1568|1569|1570|1571|1572');
        if AssignmatRec.FindSet(true) then begin
            repeat
                AssignmatRec.Delete();
            until AssignmatRec.Next() = 0;
        end;

        Message('Assignment Matrix-X records for employees 1552–1572 deleted successfully.');
    end;

    var
        AssignmatRec: Record "Assignment Matrix-X";
        PayPeriod: Date;
}
