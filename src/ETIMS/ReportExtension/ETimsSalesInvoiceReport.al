/// <summary>
/// Report over Sales Invoice Header that exposes eTIMS submission fields (KRA QR code, CU invoice number, SCU ID, receipt signature, date/time) alongside standard sales invoice fields, for use by the eTIMS sales invoice RDLC/Word layout.
/// </summary>
report 50377 "ETims Sales Invoice Report"
{
    ApplicationArea = Basic;
    Caption = 'ETims Sales Invoice Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './src/ETIMS/ReportExtension/ETimsStandardSalesInvoice.rdl';
    WordLayout = './src/ETIMS/ReportExtension/ETimsStandardSalesInvoice.docx';

    dataset
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            column(No; "No.")
            {
            }
            column(KRA_QR_Code; "KRA QR Code")
            {

            }
            column(etimsCUInvoiceNumber_Header; "CU Invoice Number")
            {
            }
            column(etimsSCUID_Header; "SCU ID")
            {
            }
            column(etimsReceiptSignature_Header; "Receipt Signature")
            {
            }
            column(etimsDate_Header; EtimsDate)
            {
            }
            column(etimsTime_Header; EtimsTime)
            {
            }
            column(etimsInternalData_Header; "Internal Data")
            {
            }
            column(etimsCUInvoiceNumber_Original; "CU Invoice Number")
            {
            }
            column(AltVATRegistrationNo; "Alt. VAT Registration No.")
            {
            }
            column(AppliestoDocNo; "Applies-to Doc. No.")
            {
            }
            column(BalAccountNo; "Bal. Account No.")
            {
            }
            column(BilltoContactNo; "Bill-to Contact No.")
            {
            }
            column(BilltoCustomerNo; "Bill-to Customer No.")
            {
            }
            column(CampaignNo; "Campaign No.")
            {
            }
            column(CustLedgerEntryNo; "Cust. Ledger Entry No.")
            {
            }
            column(ExternalDocumentNo; "External Document No.")
            {
            }
            column(GRNNo; "GRN No.")
            {
            }
            column(NoPrinted; "No. Printed")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(OpportunityNo; "Opportunity No.")
            {
            }
            column(OrderNo; "Order No.")
            {
            }
            column(OrderNoSeries; "Order No. Series")
            {
            }
            column(PackageTrackingNo; "Package Tracking No.")
            {
            }
            column(PreAssignedNo; "Pre-Assigned No.")
            {
            }
            column(PreAssignedNoSeries; "Pre-Assigned No. Series")
            {
            }
            column(PrepaymentNoSeries; "Prepayment No. Series")
            {
            }
            column(PrepaymentOrderNo; "Prepayment Order No.")
            {
            }
            column(QuoteNo; "Quote No.")
            {
            }
            column(SelltoContactNo; "Sell-to Contact No.")
            {
            }
            column(SelltoCustomerNo; "Sell-to Customer No.")
            {
            }
            column(SelltoPhoneNo; "Sell-to Phone No.")
            {
            }
            column(ShiptoPhoneNo; "Ship-to Phone No.")
            {
            }
            column(VATRegistrationNo; "VAT Registration No.")
            {
            }
            trigger OnAfterGetRecord()
            begin
                CalcFields("KRA QR Code");
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
}
