/// <summary>
/// Codeunit Custom Reports (ID 50028).
/// </summary>
codeunit 50028 "Custom Reports"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', true, true)]
    local procedure SubstituteReport(ReportId: Integer; var NewReportId: Integer)
    begin
        Case ReportId of
            Report::"Purchase - Quote":
                NewReportId := Report::"Purchase Quote 2";
            Report::Order:
                //  NewReportId := Report::"Order 2";  
                NewReportId := Report::"Local Order";
            Report::"Standard Purchase - Order":
                NewReportId := Report::"Standard Purchase - Order 2";
            //NewReportId := Report::"Local Order";
            Report::"Purchase Document - Test":
                NewReportId := Report::"Purchase Document - Test 2";
            Report::"Standard Sales - Quote":
                NewReportId := Report::"Standard Sales - Quote 2";
            Report::"Standard Sales - Order Conf.":
                NewReportId := Report::"Standard Sales - Order Conf. 2";
            Report::"Standard Sales - Draft Invoice":
                NewReportId := Report::"Standard Sales - Draft Inv.";
            Report::"Sales Document - Test":
                NewReportId := Report::"Sales Document - Test 2";
            Report::"Vendor - Summary Aging":
                NewReportId := Report::"Vendor - Summary Aging 2";
            Report::"Bank Acc. Recon. - Test":
                NewReportId := Report::"Bank Acc. Recon. - Test 2";
            Report::"Bank Account Statement":
                NewReportId := Report::"Bank Account Statement 2";
            Report::"Vendor - Balance to Date":
                NewReportId := Report::"New Vendor - Balance to Date";
            Report::"Customer - Balance to Date":
                NewReportId := Report::"New Customer - Balance to Date";
            Report::Check:
                NewReportId := Report::CheckReport;
            Report::"Purchase - Invoice":
                NewReportId := Report::"Purchase-Invoice Ext";
            Report::"Standard Statement":
                NewReportId := Report::"New Customer Statement";
            Report::"Standard Sales - Pro Forma Inv":
                NewReportId := Report::StandardSalesProInvoice1;
            Report::"Phys. Inventory List":
                NewReportId := Report::"PhysInventoryList-Ext";
            Report::"Trial Balance":
                NewReportId := Report::"Trial Balances";
            Report::"Detail Trial Balance":
                NewReportId := Report::"General Ledger Listing";
            Report::"G/L Register":
                NewReportId := Report::"G/L Register Report";
        End;
    end;
}
