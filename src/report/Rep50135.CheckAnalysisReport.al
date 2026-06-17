// namespace KICD.KICD;
// using Microsoft.Foundation.Company;
// using Microsoft.Purchases.Payables;
// using Microsoft.Purchases.Vendor;
// using Microsoft.Finance.GeneralLedger.Setup;
 
report 50135 "Check Analysis Report"
{
    ApplicationArea = All;
    Caption = 'Check Analysis Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/CheckAnalysisReport.rdlc';
 
    dataset
    {
 
        dataitem("Batch Check Voucher"; "Batch Check Voucher")
        {
            RequestFilterFields = "Check No", "Physical Check No", "No.", Date, Amount;
            column(BCVNo_; "No.")
            {
 
            }
            column(BCVCheck_No; "Check No")
            {
 
            }
            column(BCVPhysical_Check_No; "Physical Check No")
            {
 
            }
 
 
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(CompanyPhone; CompanyInfo."Phone No.")
            {
            }
            column(CompanyPicture; CompanyInfo.Picture)
            {
            }
            column(PrintedBy; UserId)
            {
            }
            column(PrintedDate; Today)
            {
            }
 
 
            trigger onPredataitem()
            begin
 
                Companyinfo.Get();
                CompanyInfo.CalcFields(CompanyInfo.Picture);
            end;
 
 
        }
 
        dataitem(batchCheckLine; "Batch Check Lines")
        {
            //dataitemlink = "Document No" = field("Batch Check Voucher"."No.");
            column(BCLPvNo; "PV No")
            {
 
            }
            column(BCLVendName; BCLVendName)
            {
 
            }
            column(PurchAmount; invAmount)
            {
 
            }
            column(InvoiceNo; InvoiceNo)
            {
 
            }
            column(PostingDate; invDate)
            {
            }
            column(pvAmount; pvAmount)
            {
 
            }
            column(TaxRate; TaxRate)
            {
            }
 
            column(TaxAmount; TaxAmount)
            {
            }
 
            column(KRAPIN; KRAPIN)
            {
            }
            column(VendorAddress; VendorAddress)
            {
            }
            column(VendorEmail; VendorEmail)
            {
            }
            column(VendorPhone; VendorPhone)
            {
            }
            column(invDate; invDate)
            {
            }
 
            trigger onPredataitem()
            begin
                Setrange("Document No", "Batch Check Voucher"."No.");
 
            end;
 
 
            trigger OnAfterGetRecord()
            begin
 
                BCLVendName := '';
                VendorName := '';
                KRAPIN := '';
                VendorAddress := '';
                VendorEmail := '';
                VendorPhone := '';
                TaxRate := 0;
                TaxAmount := 0;
                PurchAmount := 0;
                InvoiceNo := '';
                invAmount := 0;
                pvAmount := 0;
 
 
                PvHeader.Reset();
                PvHeader.SetRange(PvHeader."No.", batchCheckLine."PV No");
                if PvHeader.FindFirst() then begin
 
                    pvHeader.calcfields(pvHeader."Total Amount");
                    pvAmount := PvHeader."Total Amount";
 
                    pvLines.Reset();
                    pvLines.SetRange(pvLines.No, PvHeader."No.");
                    if pvLines.FindFirst() then begin
 
                        //VAT W/HELD
                        if batchCheckLine."Net Amount" = pvlines."VAT Withheld Amount" then begin
 
                            taxRate := pvlines."VAT Six % Rate";
                            taxAmount := pvlines."VAT Withheld Amount";
 
                        end else begin
 
                            //VAT
                            if batchCheckLine."Net Amount" = pvlines."VAT Amount" then begin
                                taxRate := pvlines."VAT Rate";
                                taxAmount := pvlines."VAT Amount";
 
                            end else begin
 
 
                                //WTAX
                                if batchCheckLine."Net Amount" = pvlines."W/Tax Amount" then begin
                                    taxRate := pvlines."W/Tax Rate";
                                    taxAmount := pvlines."W/Tax Amount";
 
                                end else begin
 
 
                                    //PPRA
                                    if batchCheckLine."Net Amount" = pvlines."PCBL Charge" then begin
                                        taxRate := pvlines."PPRA Percentage Amount";
                                        taxAmount := pvlines."PCBL Charge";
 
                                    end else begin
 
 
                                        //RETENTION
                                        if batchCheckLine."Net Amount" = pvlines."Retention  Amount" then begin
                                            taxRate := pvlines."Retention Rate";
                                            taxAmount := pvlines."Retention  Amount";
 
                                        end else begin
 
 
                                            //PAYE
                                            if batchCheckLine."Net Amount" = pvlines."PAYE Amount" then begin
                                                taxRate := pvlines."PAYE Rate";
                                                taxAmount := pvlines."PAYE Amount";
 
                                            end;
 
                                        end;
 
                                    end;
 
                                end;
                            end;
                        end;
 
                        purchInvHeader.Reset();
                        //purchInvHeader.SetRange("No.", pvLines."Invoice No.");
                        purchInvHeader.SetRange(purchInvHeader."No.", pvLines."Applies to Doc. No");
                        if purchInvHeader.FindFirst() then begin
                            purchInvHeader.calcfields(Amount);
                            invAmount := purchInvHeader.Amount;
                            InvoiceNo := purchInvHeader."No.";
                            VendorNo := purchInvHeader."Buy-from Vendor No.";
                            invAmount := purchInvHeader.Amount;
                            BCLVendName := purchInvHeader."Buy-from Vendor Name";
                            invDate := purchInvHeader."Posting Date";
                            //message('pvLines."Applies to Doc. No" = %1', pvLines."Applies to Doc. No");
 
 
                        end else begin
 
                            PvHeader1.Reset();
                            PvHeader1.SetRange(PvHeader1."No.", pvLines."Applies to Doc. No");
                            if PvHeader1.FindFirst() then begin
                                pvLines1.Reset();
                                pvLines1.SetRange(pvLines1.No, PvHeader1."No.");
                                if pvLines1.FindFirst() then begin
 
 
                                    //VAT W/HELD
                                    if batchCheckLine."Net Amount" = pvlines1."VAT Withheld Amount" then begin
 
                                        taxRate := pvlines1."VAT Six % Rate";
                                        taxAmount := pvlines1."VAT Withheld Amount";
 
                                    end else begin
 
                                        //VAT
                                        if batchCheckLine."Net Amount" = pvlines1."VAT Amount" then begin
                                            taxRate := pvlines1."VAT Rate";
                                            taxAmount := pvlines1."VAT Amount";
 
                                        end else begin
 
 
                                            //WTAX
                                            if batchCheckLine."Net Amount" = pvlines1."W/Tax Amount" then begin
                                                taxRate := pvlines1."W/Tax Rate";
                                                taxAmount := pvlines1."W/Tax Amount";
 
                                            end else begin
 
 
                                                //PPRA
                                                if batchCheckLine."Net Amount" = pvlines."PCBL Charge" then begin
                                                    taxRate := pvlines1."PPRA Percentage Amount";
                                                    taxAmount := pvlines1."PCBL Charge";
 
                                                end else begin
 
 
                                                    //RETENTION
                                                    if batchCheckLine."Net Amount" = pvlines."Retention  Amount" then begin
                                                        taxRate := pvlines1."Retention Rate";
                                                        taxAmount := pvlines1."Retention  Amount";
 
                                                    end else begin
 
 
                                                        //PAYE
                                                        if batchCheckLine."Net Amount" = pvlines1."PAYE Amount" then begin
                                                            taxRate := pvlines1."PAYE Rate";
                                                            taxAmount := pvlines1."PAYE Amount";
 
                                                        end;
 
                                                    end;
 
                                                end;
 
                                            end;
                                        end;
 
                                    end;
 
                                    purchInvHeader.Reset();
                                    //purchInvHeader.SetRange("No.", pvLines."Invoice No.");
                                    purchInvHeader.SetRange(purchInvHeader."No.", pvLines1."Applies to Doc. No");
                                    if purchInvHeader.FindFirst() then begin
                                        purchInvHeader.calcfields(Amount);
                                        invAmount := purchInvHeader.Amount;
                                        InvoiceNo := purchInvHeader."No.";
                                        VendorNo := purchInvHeader."Buy-from Vendor No.";
                                        invAmount := purchInvHeader.Amount;
                                        BCLVendName := purchInvHeader."Buy-from Vendor Name";
                                        invDate := purchInvHeader."Posting Date";
                                        //message('pvLines1."Applies to Doc. No" = %1', pvLines1."Applies to Doc. No");
 
                                    end else begin
                                        PvHeader2.Reset();
                                        PvHeader2.SetRange(PvHeader2."No.", pvLines1."Applies to Doc. No");
                                        if PvHeader2.FindFirst() then begin
                                            pvLines2.Reset();
                                            pvLines2.SetRange(pvLines2.No, PvHeader2."No.");
                                            if pvLines2.FindFirst() then begin
 
 
 
                                                //VAT W/HELD
                                                if batchCheckLine."Net Amount" = pvlines2."VAT Withheld Amount" then begin
 
                                                    taxRate := pvlines2."VAT Six % Rate";
                                                    taxAmount := pvlines2."VAT Withheld Amount";
 
                                                end else begin
 
                                                    //VAT
                                                    if batchCheckLine."Net Amount" = pvlines2."VAT Amount" then begin
                                                        taxRate := pvlines2."VAT Rate";
                                                        taxAmount := pvlines2."VAT Amount";
 
                                                    end else begin
 
 
                                                        //WTAX
                                                        if batchCheckLine."Net Amount" = pvlines2."W/Tax Amount" then begin
                                                            taxRate := pvlines2."W/Tax Rate";
                                                            taxAmount := pvlines2."W/Tax Amount";
 
                                                        end else begin
 
 
                                                            //PPRA
                                                            if batchCheckLine."Net Amount" = pvlines2."PCBL Charge" then begin
                                                                taxRate := pvlines2."PPRA Percentage Amount";
                                                                taxAmount := pvlines2."PCBL Charge";
 
                                                            end else begin
 
 
                                                                //RETENTION
                                                                if batchCheckLine."Net Amount" = pvlines2."Retention  Amount" then begin
                                                                    taxRate := pvlines2."Retention Rate";
                                                                    taxAmount := pvlines2."Retention  Amount";
 
                                                                end else begin
 
 
                                                                    //PAYE
                                                                    if batchCheckLine."Net Amount" = pvlines2."PAYE Amount" then begin
                                                                        taxRate := pvlines2."PAYE Rate";
                                                                        taxAmount := pvlines2."PAYE Amount";
 
                                                                    end;
 
                                                                end;
 
                                                            end;
 
                                                        end;
                                                    end;
 
                                                end;
 
                                                purchInvHeader.Reset();
                                                //purchInvHeader.SetRange("No.", pvLines."Invoice No.");
                                                purchInvHeader.SetRange(purchInvHeader."No.", pvLines2."Applies to Doc. No");
                                                if purchInvHeader.FindFirst() then begin
                                                    purchInvHeader.calcfields(Amount);
                                                    invAmount := purchInvHeader.Amount;
                                                    InvoiceNo := purchInvHeader."No.";
                                                    VendorNo := purchInvHeader."Buy-from Vendor No.";
                                                    invAmount := purchInvHeader.Amount;
                                                    BCLVendName := purchInvHeader."Buy-from Vendor Name";
                                                    invDate := purchInvHeader."Posting Date";
                                                    //message('pvLines2."Applies to Doc. No" = %1', pvLines2."Applies to Doc. No");
 
 
                                                end else begin
                                                    PvHeader3.Reset();
                                                    PvHeader3.SetRange(PvHeader3."No.", pvLines2."Applies to Doc. No");
                                                    if PvHeader3.FindFirst() then begin
                                                        pvLines3.Reset();
                                                        pvLines3.SetRange(pvLines3.No, PvHeader3."No.");
                                                        if pvLines3.FindFirst() then begin
 
 
 
 
                                                            //VAT W/HELD
                                                            if batchCheckLine."Net Amount" = pvlines3."VAT Withheld Amount" then begin
 
                                                                taxRate := pvlines3."VAT Six % Rate";
                                                                taxAmount := pvlines3."VAT Withheld Amount";
 
                                                            end else begin
 
                                                                //VAT
                                                                if batchCheckLine."Net Amount" = pvlines3."VAT Amount" then begin
                                                                    taxRate := pvlines3."VAT Rate";
                                                                    taxAmount := pvlines3."VAT Amount";
 
                                                                end else begin
 
 
                                                                    //WTAX
                                                                    if batchCheckLine."Net Amount" = pvlines3."W/Tax Amount" then begin
                                                                        taxRate := pvlines3."W/Tax Rate";
                                                                        taxAmount := pvlines3."W/Tax Amount";
 
                                                                    end else begin
 
 
                                                                        //PPRA
                                                                        if batchCheckLine."Net Amount" = pvlines3."PCBL Charge" then begin
                                                                            taxRate := pvlines3."PPRA Percentage Amount";
                                                                            taxAmount := pvlines3."PCBL Charge";
 
                                                                        end else begin
 
 
                                                                            //RETENTION
                                                                            if batchCheckLine."Net Amount" = pvlines3."Retention  Amount" then begin
                                                                                taxRate := pvlines3."Retention Rate";
                                                                                taxAmount := pvlines3."Retention  Amount";
 
                                                                            end else begin
 
 
                                                                                //PAYE
                                                                                if batchCheckLine."Net Amount" = pvlines3."PAYE Amount" then begin
                                                                                    taxRate := pvlines3."PAYE Rate";
                                                                                    taxAmount := pvlines3."PAYE Amount";
 
                                                                                end;
 
                                                                            end;
 
                                                                        end;
 
                                                                    end;
                                                                end;
 
                                                            end;
 
                                                            purchInvHeader.Reset();
                                                            //purchInvHeader.SetRange("No.", pvLines."Invoice No.");
                                                            purchInvHeader.SetRange(purchInvHeader."No.", pvLines3."Applies to Doc. No");
                                                            if purchInvHeader.FindFirst() then begin
                                                                purchInvHeader.calcfields(Amount);
                                                                invAmount := purchInvHeader.Amount;
                                                                InvoiceNo := purchInvHeader."No.";
                                                                VendorNo := purchInvHeader."Buy-from Vendor No.";
                                                                BCLVendName := purchInvHeader."Buy-from Vendor Name";
                                                                invDate := purchInvHeader."Posting Date";
 
                                                                //message('pvLines3."Applies to Doc. No" = %1', pvLines3."Applies to Doc. No");
 
 
                                                            end;
 
                                                        end;
                                                    end;
                                                end;
 
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
 
 
                AppliedVendor.Reset();
                AppliedVendor.SetRange("No.", VendorNo);
                if AppliedVendor.FindFirst() then begin
                    VendorName := AppliedVendor.Name;
                    KRAPIN := AppliedVendor."VAT Registration No.";
                    VendorAddress := AppliedVendor.Address;
                    VendorEmail := AppliedVendor."E-Mail";
                    VendorPhone := AppliedVendor."Phone No.";
 
                end;
 
            end;
        }
 
 
        dataitem(VendorLedgerEntry; "Vendor Ledger Entry")
        {
            DataItemTableView = sorting("Entry No.");
            RequestFilterFields = "Posting Date", "Vendor No.", "Document No.", PPRA;
            column(EntryNo; "Entry No.")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(ExternalDocumentNo; InvoiceNo)
            {
            }
            column(VendorNo; "Vendor No.")
            {
            }
            column(Description; Description)
            {
            }
            column(CheckNo; "Check No")
            {
            }
            column(StartDate; StartDate)
            {
            }
            column(EndDate; EndDate)
            {
            }
            column(TaxCodeDesc; TaxCodeDesc)
            {
            }
            column(BatchCheckVoucherNo; ChequeBatch)
            {
            }
            column(PPRA; PPRA)
            {
 
            }
            trigger OnPreDataItem()
            begin
 
                setrange("Document No.", InvoiceNo);
 
                //     if StartDate <> 0D then
                //         SetFilter("Posting Date", '%1..%2', StartDate, EndDate);
 
                //     // SetRange("Payment Method Code", 'CHEQUE');
                //     SetFilter("Document Type", '%1|%2', "Document Type"::" ", "Document Type"::Payment);
                //     SetFilter("Original Amount", '>0');
                //     if WHTCode <> '' then begin
                //         if TariffCode.Get(WHTCode) then begin
                //             case TariffCode.Type of
                //                 TariffCode.Type::PPRA:
                //                     SetRange(PPRA, WHTCode);
                //                 TariffCode.Type::PAYE:
                //                     SetRange(PAYE, WHTCode);
                //                 TariffCode.Type::Retention:
                //                     SetRange(Retention, WHTCode);
                //                 TariffCode.Type::"W/Tax":
                //                     SetRange(WHT, WHTCode);
                //                 TariffCode.Type::VAT:
                //                     SetRange("VAT Witheld", WHTCode);
                //             end;
                //         end;
                //     end;
                //     if FilterDocNo <> '' then
                //         SetRange("Document No.", FilterDocNo)
                //     else
                //         if ChequeBatch <> '' then
                //             SetRange("Document No.", ChequeBatch);
            end;
 
            trigger OnAfterGetRecord()
            var
                PVLine: Record "PV Lines";
                BatchCheckVoucher: Record "Batch Check Voucher";
                BatchCheckLines: Record "Batch Check Lines";
                Payments: Record "Payments";
                PVLines: Record "PV Lines";
                VendLedgerEntry: Record "Vendor Ledger Entry";
            begin
 
 
 
                // BatchCheckVoucher.Reset();
                // BatchCheckVoucher.SetRange("No.", "Document No.");
                // if BatchCheckVoucher.FindFirst() then begin
                //     BatchCheckLines.SetRange("Document No", BatchCheckVoucher."No.");
                //     BatchCheckLines.SetRange("Vendor No", "Vendor No.");
                //     if BatchCheckLines.FindFirst() then begin
                //         Payments.Reset();
                //         Payments.SetRange("No.", BatchCheckLines."PV No");
                //         if Payments.FindFirst() then begin
                //             PVLines.Reset();
                //             PVLines.SetRange(No, Payments."No.");
                //             PVLines.SetRange("Account No", "Vendor No.");
                //             if PVLines.FindFirst() then begin
                //                 VendLedgerEntry.Reset();
                //                 VendLedgerEntry.SetRange("Document No.", PVLines."Applies to Doc. No");
                //                 if VendLedgerEntry.FindFirst() then begin
                //                     VendorName := VendLedgerEntry."Vendor Name";
                //                 end;
                //             end;
                //         end;
                //     end;
                // end;                
 
                // PVLine.Reset();
                // PVLine.SetRange(No, "External Document No.");
                // if PVLine.FindFirst() then
                //     InvoiceNo := PVLine."Invoice No.";
 
                // CalcFields("Original Amount");
                // PurchAmount := Abs("Original Amount");
 
                // if WHTCode <> '' then begin
                //     if TariffCode.Get(WHTCode) then begin
                //         TaxRate := TariffCode.Percentage;
                //         TaxAmount := Round(PurchAmount * TaxRate / 100, 0.01);
                //     end;
                // end else begin
                //     if AppliedVendor."Withholding Tax Code" <> '' then begin
                //         if TariffCode.Get(AppliedVendor."Withholding Tax Code") then begin
                //             TaxRate := TariffCode.Percentage;
                //             TaxAmount := Round(PurchAmount * TaxRate / 100, 0.01);
                //         end;
                //     end;
                // end;
            end;
        }
 
    }
 
 
 
    requestpage
    {
        SaveValues = true;
 
        layout
        {
            area(Content)
            {
                group(Filters)
                {
                    Caption = 'Filters';
 
                    field(WHTCodeField; WHTCode)
                    {
                        ApplicationArea = All;
                        Caption = 'Tax Code';
                        TableRelation = "Tariff Codes1".Code;
                        ToolTip = 'Specifies the tax code to use for rate and amount calculation. Leave blank to use vendor default WHT code.';
                    }
                    // field(ChequeBatchField; ChequeBatch)
                    // {
                    //     ApplicationArea = All;
                    //     Caption = 'Cheque Batch';
                    //     TableRelation = "Batch Check Voucher"."No.";
                    //     ToolTip = 'Specifies the batch check voucher number to filter by.';
 
                    //     trigger OnValidate()
                    //     var
                    //         BatchCheckVoucher: Record "Batch Check Voucher";
                    //     begin
                    //         ChequeNo := '';
                    //         PhysicalChequeNo := '';
                    //         FilterDocNo := ChequeBatch;
                    //         if BatchCheckVoucher.Get(ChequeBatch) then begin
                    //             ChequeNo := BatchCheckVoucher."Check No";
                    //             PhysicalChequeNo := BatchCheckVoucher."Physical Check No";
                    //         end;
                    //     end;
                    // }
                    // field(ChequeNoField; ChequeNo)
                    // {
                    //     ApplicationArea = All;
                    //     Caption = 'Cheque No';
                    //     Editable = false;
                    //     ToolTip = 'Auto-populated from the selected Cheque Batch.';
                    // }
                    // field(PhysicalChequeNoField; PhysicalChequeNo)
                    // {
                    //     ApplicationArea = All;
                    //     Caption = 'Physical Cheque No';
                    //     Editable = false;
                    //     ToolTip = 'Auto-populated from the selected Cheque Batch.';
                    // }
                }
            }
        }
 
        actions
        {
        }
    }
 
    trigger OnPreReport()
    begin
        // CompanyInfo.Get();
        // CompanyInfo.CalcFields(Picture);
 
        if (StartDate <> 0D) and (EndDate = 0D) then
            EndDate := Today;
 
        if (StartDate <> 0D) and (EndDate < StartDate) then
            Error('End Date must be greater than or equal to Start Date.');
 
        TaxCodeDesc := '';
        if WHTCode <> '' then
            if TariffCode.Get(WHTCode) then
                TaxCodeDesc := TariffCode.Description;
    end;
 
    procedure SetChequeBatch(BatchNo: Code[20])
    var
        BatchCheckVoucher: Record "Batch Check Voucher";
    begin
        ChequeBatch := BatchNo;
        FilterDocNo := BatchNo;
        if BatchCheckVoucher.Get(BatchNo) then begin
            ChequeNo := BatchCheckVoucher."Check No";
            PhysicalChequeNo := BatchCheckVoucher."Physical Check No";
        end;
    end;
 
    var
        Vendor: Record Vendor;
        CompanyInfo: Record "Company Information";
        TariffCode: Record "Tariff Codes1";
        StartDate: Date;
        EndDate: Date;
        WHTCode: Code[10];
        VendorName: Text[100];
        KRAPIN: Text[50];
        VendorAddress: Text[100];
        VendorEmail: Text[80];
        VendorPhone: Text[30];
        TaxRate: Decimal;
        TaxAmount: Decimal;
        PurchAmount: Decimal;
        TaxCodeDesc: Text[100];
        ChequeBatch: Code[20];
        ChequeNo: Code[20];
        PhysicalChequeNo: Code[20];
        FilterDocNo: Code[20];
        InvoiceNo: Text[100];
        batchCheckLines: Record "Batch Check Lines";
        PvHeader: Record payments;
        pvLines: Record "PV Lines";
        purchInvHeader: Record "Purch. Inv. Header";
        purchInvLine: Record "Purch. Inv. Line";
        BCLVendName: Text[100];
        BCLPvNo: Code[20];
        PvHeader1: Record payments;
        pvLines1: Record "PV Lines";
        PvHeader2: Record payments;
        pvLines2: Record "PV Lines";
        PvHeader3: Record payments;
        pvLines3: Record "PV Lines";
        invAmount: Decimal;
        AppliedVendor: Record Vendor;
        VendorNo: Code[20];
        pvAmount: Decimal;
        invDate: Date;
}