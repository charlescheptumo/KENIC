// reportextension 60001 "Standard Sales Credit Memo" extends "Standard Sales - Credit Memo"
// {
//     RDLCLayout = './src/ETIMS/ReportExtension/Rep60001.StandardSalesCreditMemo.rdl';
//     WordLayout = './src/ETIMS/ReportExtension/Rep60001.StandardSalesCreditMemo.docx';
//     dataset
//     {
//         add(Header)
//         {
//             column(QRCode; QRCode)
//             {
//             }
//             column(AppliestoDocNo; "Applies-to Doc. No.")
//             {

//             }
//             // column(etimsCUInvoiceNumber_Header; "CU Invoice Number")
//             // {
//             // }
//             // column(etimsSCUID_Header; "SCU ID")
//             // {
//             // }
//             // column(etimsReceiptSignature_Header; "Receipt Signature")
//             // {
//             // }
//             // column(etimsDate_Header; EtimsDate)
//             // {
//             // }
//             // column(etimsTime_Header; EtimsTime)
//             // {
//             // }
//             // column(etimsInternalData_Header; "Internal Data")
//             // {
//             // }
//             // column(etimsCUInvoiceNumber_Original; "CUInvoiceNumber")
//             // {
//             // }
//             column(GrossUsDollarsAmount; GrossUsDollars)
//             {

//             }
//             column(GrossKES_Amount; GrossKES)
//             {
//             }
//             column(VATinUSD_Amount; VATinUSD)
//             {

//             }
//             column(VATinKES_Amount; VATinKES)
//             {

//             }
//             column(TotalKES_Topay; TotalKESTopay)
//             {

//             }
//             column(TotalUSD_Topay; TotalUSD_Topay)
//             {

//             }
//             column(CurrencyCode_Header; "Currency Code")
//             {
//             }
//             column(Exchange_Rate; ExchangeRate)
//             {

//             }
//             column(SystemCreatedAt_Header; SystemCreatedAt)
//             {
//             }
//             column(KESAccount_Header; KESAccount)
//             {
//             }
//             column(USDAccount_Header; USDAccount)
//             {
//             }
//             column(USDAccountName_Header; USDAccountName)
//             {
//             }
//             column(USDAccountBranch_Header; USDAccountBranch)
//             {
//             }
//             column(KESAccountName_Header; KESAccountName)
//             {
//             }
//             column(KESAccountBranch_Header; KESAccountBranch)
//             {
//             }

//         }

//         modify(Header)
//         {
//             trigger OnAfterAfterGetRecord()
//             begin
//                 GenerateQRCode();
//                 calculateUSDvsKES();
//             end;
//         }

//     }



//     trigger OnPostReport()
//     begin
//         // GenerateQRCode();
//     end;

//     local procedure GenerateQRCode()
//     var
//         BarcodeSymbology2D: Enum "Barcode Symbology 2D";
//         BarcodeFontProvider2D: Interface "Barcode Font Provider 2D";
//         BarcodeString: Text;
//         //CompInfo: Record "Company Information";
//         SIH: Record "Sales Invoice Header";
//     begin
//         BarcodeFontProvider2D := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
//         BarcodeSymbology2D := Enum::"Barcode Symbology 2D"::"QR-Code";
//         SIH.Reset();
//         SIH.SetFilter("No.", '=%1', Header."Applies-to Doc. No.");
//         if SIH.FindFirst() then begin
//             //CompInfo.Get;
//             BarcodeString := Header.QRCodeUrl;
//             QRCode := BarcodeFontProvider2D.EncodeFont(BarcodeString, BarcodeSymbology2D);
//             CUInvoiceNumber := SIH."CU Invoice Number";
//         end;
//     end;

//     procedure calculateUSDvsKES()
//     var
//         conversionRate: Decimal;
//     begin
//         GrossUsDollars := 0;
//         GrossKES := 0;
//         currency := Header."Currency Code";
//         if currency = 'USD' then begin
//             //get conversion rate
//             conversionRate := webservice.getPostedDocCurrencyDetails(Header."No.");
//             SalesInvLine.Reset();
//             SalesInvLine.SetRange("Document No.", Header."No.");
//             if SalesInvLine.FindSet() then
//                 repeat
//                     GrossUsDollars += SalesInvLine."Line Amount";
//                     amountIncludingVAT += SalesInvLine."Amount Including VAT";
//                 until SalesInvLine.Next() = 0;

//             VATinUSD := Round((amountIncludingVAT - GrossUsDollars), 0.01);
//             VATinKES := Round((VATinUSD * conversionRate), 0.01);
//             GrossKES := Round((GrossUsDollars * conversionRate), 0.01);
//             TotalKESTopay := GrossKES + VATinKES;
//             TotalUSD_Topay := amountIncludingVAT;
//             ExchangeRate := conversionRate;
//         end;

//     end;

//     var
//         QRCode: Text;
//         CUInvoiceNumber: Text;
//         SIH: Record "Sales Invoice Header";
//         CompInfo: Record "Company Information";
//         GrossUsDollars: Decimal;
//         GrossKES: Decimal;
//         VATinUSD: Decimal;
//         VATinKES: Decimal;
//         TotalKESTopay: Decimal;
//         TotalUSD_Topay: Decimal;
//         currency: Text;
//         amountIncludingVAT: Decimal;
//         webservice: Codeunit ETimsWebService;
//         SalesInvLine: Record "Sales Cr.Memo Line";
//         ExchangeRate: Decimal;
//         BankAccount: Record "Bank Account";
//         KESAccount: Text;
//         KESAccountName: Text;
//         KESAccountBranch: Text;
//         USDAccount: Text;
//         USDAccountName: Text;
//         USDAccountBranch: Text;
//         checkUSD: Text;
//         checkKES: Text;
// }
