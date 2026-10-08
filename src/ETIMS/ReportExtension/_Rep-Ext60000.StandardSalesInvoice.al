reportextension 60000 "Standard Sales - Invoice" extends "Standard Sales - Invoice"
{
    RDLCLayout = './src/ETIMS/ReportExtension/Rep-Ext60000.StandardSalesInvoice.rdl';
    WordLayout = './src/ETIMS/ReportExtension/Rep-Ext60000.StandardSalesInvoice.docx';
    dataset
    {
        add(Header)
        {
            column(QRCode; QRCode)
            {
            }
            column(AppliestoDocNo; "Applies-to Doc. No.")
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
            column(etimsCUInvoiceNumber_Original; "CUInvoiceNumber")
            {
            }
            column(GrossUsDollarsAmount; GrossUsDollars)
            {

            }
            column(GrossKES_Amount; GrossKES)
            {
            }
            column(VATinUSD_Amount; VATinUSD)
            {

            }
            column(VATinKES_Amount; VATinKES)
            {

            }
            column(TotalKES_Topay; TotalKESTopay)
            {

            }
            column(TotalUSD_Topay; TotalUSD_Topay)
            {

            }
            column(CurrencyCode_Header; "Currency Code")
            {
            }
            column(Exchange_Rate; ExchangeRate)
            {

            }
            column(SystemCreatedAt_Header; SystemCreatedAt)
            {
            }
            column(KESAccount_Header; KESAccount)
            {
            }
            column(USDAccount_Header; USDAccount)
            {
            }
            column(USDAccountName_Header; USDAccountName)
            {
            }
            column(USDAccountBranch_Header; USDAccountBranch)
            {
            }
            column(KESAccountName_Header; KESAccountName)
            {
            }
            column(KESAccountBranch_Header; KESAccountBranch)
            {
            }

        }

        modify(Header)
        {
            trigger OnAfterAfterGetRecord()
            begin
                GenerateQRCode();
                calculateUSDvsKES();
            end;
        }
    }

    local procedure GenerateQRCode()
    var
        BarcodeSymbology2D: Enum "Barcode Symbology 2D";
        BarcodeFontProvider2D: Interface "Barcode Font Provider 2D";
        BarcodeString: Text;
    begin
        CompInfo.Get();
        BarcodeFontProvider2D := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
        BarcodeSymbology2D := Enum::"Barcode Symbology 2D"::"QR-Code";
        BarcodeString := 'https://etims.kra.go.ke/common/link/etims/receipt/indexEtimsReceiptData?Data=' + CompInfo."Company Tin" + CompInfo."Branch ID" + Header."Receipt Signature";
        QRCode := BarcodeFontProvider2D.EncodeFont(BarcodeString, BarcodeSymbology2D);

        /* BankAccount.Reset();
        BankAccount.SetFilter("Currency Code", '=%1', 'USD');
        BankAccount.SetFilter("Show on Report", '=%1', true);
        if BankAccount.FindFirst() then begin
            USDAccount := BankAccount."Bank Account No.";
            USDAccountName := BankAccount.Name;
            USDAccountBranch := BankAccount."Bank Branch Name";
        end;

        BankAccount.Reset();
        Clear(BankAccount);
        BankAccount.SetFilter("Currency Code", '=%1|=%2', 'KES', '');
        BankAccount.SetFilter("Show on Report", '=%1', true);
        if BankAccount.FindFirst() then begin
            KESAccount := BankAccount."Bank Account No.";
            KESAccountName := BankAccount.Name;
            KESAccountBranch := BankAccount."Bank Branch Name";
        end */


    end;

    procedure calculateUSDvsKES()
    var
        conversionRate: Decimal;
    begin
        GrossUsDollars := 0;
        GrossKES := 0;
        currency := Header."Currency Code";
        if currency = 'USD' then begin
            //get conversion rate
            conversionRate := webservice.getPostedDocCurrencyDetails(Header."No.");
            SalesInvLine.Reset();
            SalesInvLine.SetRange("Document No.", Header."No.");
            if SalesInvLine.FindSet() then
                repeat
                    GrossUsDollars += SalesInvLine."Line Amount";
                    amountIncludingVAT += SalesInvLine."Amount Including VAT";
                until SalesInvLine.Next() = 0;

            VATinUSD := Round((amountIncludingVAT - GrossUsDollars), 0.01);
            VATinKES := Round((VATinUSD * conversionRate), 0.01);
            GrossKES := Round((GrossUsDollars * conversionRate), 0.01);
            TotalKESTopay := GrossKES + VATinKES;
            TotalUSD_Topay := amountIncludingVAT;
            ExchangeRate := conversionRate;
        end;

    end;

    var
        QRCode: Text;
        CUInvoiceNumber: Text;
        SIH: Record "Sales Invoice Header";
        CompInfo: Record "Company Information";
        GrossUsDollars: Decimal;
        GrossKES: Decimal;
        VATinUSD: Decimal;
        VATinKES: Decimal;
        TotalKESTopay: Decimal;
        TotalUSD_Topay: Decimal;
        currency: Text;
        amountIncludingVAT: Decimal;
        webservice: Codeunit ETimsWebService;
        SalesInvLine: Record "Sales Invoice Line";
        ExchangeRate: Decimal;
        BankAccount: Record "Bank Account";
        KESAccount: Text;
        KESAccountName: Text;
        KESAccountBranch: Text;
        USDAccount: Text;
        USDAccountName: Text;
        USDAccountBranch: Text;
        checkUSD: Text;
        checkKES: Text;
}