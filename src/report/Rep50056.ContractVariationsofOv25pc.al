report 50056 "Contract Variations of Ov 25pc"
{
    ApplicationArea = All;
    Caption = 'Contract Variations of Ov 25pc';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Contract Variations of Ov 25pc.rdlc';

    dataset
    {
        dataitem(DataItem1; 70044)
        {
            column(image1; corec.Picture)
            {
            }
            column(name; corec.Name)
            {
            }

            trigger OnPreDataItem()
            begin
                corec.GET;
                corec.CALCFIELDS(corec.Picture);
            end;
        }
        dataitem("Cash Management  Setup"; 56006)
        {
            column(CurrentBudget_CashManagementSetup; "Cash Management  Setup"."Current Budget")
            {
            }
            column(CurrentBudgetStartDate_CashManagementSetup; "Cash Management  Setup"."Current Budget Start Date")
            {
            }
            column(CurrentBudgetEndDate_CashManagementSetup; "Cash Management  Setup"."Current Budget End Date")
            {
            }
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
        corec: Record 79;
}

