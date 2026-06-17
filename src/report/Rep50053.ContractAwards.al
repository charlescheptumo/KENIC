report 50053 "Contract Awards"
{
    ApplicationArea = All;
    Caption = 'Contract Awards';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Contract Awards.rdlc';

    dataset
    {
        dataitem(LPO; 38)
        {
            DataItemTableView = WHERE("Document Type" = CONST(Order),
                                      "Document Type" = FILTER(Order | "Blanket Order"));
            column(DocumentType_LPO; LPO."Document Type")
            {
            }
            column(OrderDate_LPO; LPO."Order Date")
            {
            }
            column(BuyfromVendorNo_LPO; LPO."Buy-from Vendor No.")
            {
            }
            column(No_LPO; LPO."No.")
            {
            }
            column(PaytoVendorNo_LPO; LPO."Pay-to Vendor No.")
            {
            }
            column(PaytoName_LPO; LPO."Pay-to Name")
            {
            }
            column(Amount_LPO; LPO.Amount)
            {
            }
            column(RequisitionNo_LPO; LPO."Requisition No")
            {
            }
            column(IFSCode_LPO; LPO."IFS Code")
            {
            }
            column(AmountIncludingVAT_LPO; LPO."Amount Including VAT")
            {
            }
            column(TenderName_LPO; LPO."Tender Name")
            {
            }
            column(ProcurementPlanID_LPO; LPO."Procurement Plan ID")
            {
            }
            column(ProcurementPlanEntryNo_LPO; LPO."Procurement Plan Entry No")
            {
            }
            column(PPPlanningCategory_LPO; LPO."PP Planning Category")
            {
            }
            column(PPFundingSourceID_LPO; LPO."PP Funding Source ID")
            {
            }
            column(PPSolicitationType_LPO; LPO."PP Solicitation Type")
            {
            }
            column(PPProcurementMethod_LPO; LPO."PP Procurement Method")
            {
            }
            column(image1; corec.Picture)
            {
            }
        }
        dataitem("Purch. Inv. Header"; 122)
        {
            DataItemTableView = WHERE("Order No." = FILTER(<> ''));
            column(BuyfromVendorNo_PurchInvHeader; "Purch. Inv. Header"."Buy-from Vendor No.")
            {
            }
            column(No_PurchInvHeader; "Purch. Inv. Header"."No.")
            {
            }
            column(PaytoVendorNo_PurchInvHeader; "Purch. Inv. Header"."Pay-to Vendor No.")
            {
            }
            column(PaytoName_PurchInvHeader; "Purch. Inv. Header"."Pay-to Name")
            {
            }
            column(PaytoName2_PurchInvHeader; "Purch. Inv. Header"."Pay-to Name 2")
            {
            }
            column(PaytoAddress_PurchInvHeader; "Purch. Inv. Header"."Pay-to Address")
            {
            }
            column(PaytoAddress2_PurchInvHeader; "Purch. Inv. Header"."Pay-to Address 2")
            {
            }
            column(PaytoCity_PurchInvHeader; "Purch. Inv. Header"."Pay-to City")
            {
            }
            column(PaytoContact_PurchInvHeader; "Purch. Inv. Header"."Pay-to Contact")
            {
            }
            column(YourReference_PurchInvHeader; "Purch. Inv. Header"."Your Reference")
            {
            }
            column(ShiptoCode_PurchInvHeader; "Purch. Inv. Header"."Ship-to Code")
            {
            }
            column(ShiptoName_PurchInvHeader; "Purch. Inv. Header"."Ship-to Name")
            {
            }
            column(ShiptoName2_PurchInvHeader; "Purch. Inv. Header"."Ship-to Name 2")
            {
            }
            column(ShiptoAddress_PurchInvHeader; "Purch. Inv. Header"."Ship-to Address")
            {
            }
            column(ShiptoAddress2_PurchInvHeader; "Purch. Inv. Header"."Ship-to Address 2")
            {
            }
            column(ShiptoCity_PurchInvHeader; "Purch. Inv. Header"."Ship-to City")
            {
            }
            column(ShiptoContact_PurchInvHeader; "Purch. Inv. Header"."Ship-to Contact")
            {
            }
            column(OrderDate_PurchInvHeader; "Purch. Inv. Header"."Order Date")
            {
            }
            column(PostingDate_PurchInvHeader; "Purch. Inv. Header"."Posting Date")
            {
            }
            column(ExpectedReceiptDate_PurchInvHeader; "Purch. Inv. Header"."Expected Receipt Date")
            {
            }
            column(PostingDescription_PurchInvHeader; "Purch. Inv. Header"."Posting Description")
            {
            }
            column(PaymentTermsCode_PurchInvHeader; "Purch. Inv. Header"."Payment Terms Code")
            {
            }
            column(DueDate_PurchInvHeader; "Purch. Inv. Header"."Due Date")
            {
            }
            column(PaymentDiscount_PurchInvHeader; "Purch. Inv. Header"."Payment Discount %")
            {
            }
            column(PmtDiscountDate_PurchInvHeader; "Purch. Inv. Header"."Pmt. Discount Date")
            {
            }
            column(ShipmentMethodCode_PurchInvHeader; "Purch. Inv. Header"."Shipment Method Code")
            {
            }
            column(LocationCode_PurchInvHeader; "Purch. Inv. Header"."Location Code")
            {
            }
            column(ShortcutDimension1Code_PurchInvHeader; "Purch. Inv. Header"."Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code_PurchInvHeader; "Purch. Inv. Header"."Shortcut Dimension 2 Code")
            {
            }
            column(VendorPostingGroup_PurchInvHeader; "Purch. Inv. Header"."Vendor Posting Group")
            {
            }
            column(CurrencyCode_PurchInvHeader; "Purch. Inv. Header"."Currency Code")
            {
            }
            column(CurrencyFactor_PurchInvHeader; "Purch. Inv. Header"."Currency Factor")
            {
            }
            column(PricesIncludingVAT_PurchInvHeader; "Purch. Inv. Header"."Prices Including VAT")
            {
            }
            column(InvoiceDiscCode_PurchInvHeader; "Purch. Inv. Header"."Invoice Disc. Code")
            {
            }
            column(LanguageCode_PurchInvHeader; "Purch. Inv. Header"."Language Code")
            {
            }
            column(PurchaserCode_PurchInvHeader; "Purch. Inv. Header"."Purchaser Code")
            {
            }
            column(OrderNo_PurchInvHeader; "Purch. Inv. Header"."Order No.")
            {
            }
            column(Comment_PurchInvHeader; "Purch. Inv. Header".Comment)
            {
            }
            column(NoPrinted_PurchInvHeader; "Purch. Inv. Header"."No. Printed")
            {
            }
            column(OnHold_PurchInvHeader; "Purch. Inv. Header"."On Hold")
            {
            }
            column(AppliestoDocType_PurchInvHeader; "Purch. Inv. Header"."Applies-to Doc. Type")
            {
            }
            column(AppliestoDocNo_PurchInvHeader; "Purch. Inv. Header"."Applies-to Doc. No.")
            {
            }
            column(BalAccountNo_PurchInvHeader; "Purch. Inv. Header"."Bal. Account No.")
            {
            }
            column(Amount_PurchInvHeader; "Purch. Inv. Header".Amount)
            {
            }
            column(AmountIncludingVAT_PurchInvHeader; "Purch. Inv. Header"."Amount Including VAT")
            {
            }
            column(VendorOrderNo_PurchInvHeader; "Purch. Inv. Header"."Vendor Order No.")
            {
            }
            column(VendorInvoiceNo_PurchInvHeader; "Purch. Inv. Header"."Vendor Invoice No.")
            {
            }
            column(VATRegistrationNo_PurchInvHeader; "Purch. Inv. Header"."VAT Registration No.")
            {
            }
            column(SelltoCustomerNo_PurchInvHeader; "Purch. Inv. Header"."Sell-to Customer No.")
            {
            }
            column(ReasonCode_PurchInvHeader; "Purch. Inv. Header"."Reason Code")
            {
            }
            column(GenBusPostingGroup_PurchInvHeader; "Purch. Inv. Header"."Gen. Bus. Posting Group")
            {
            }
            column(TransactionType_PurchInvHeader; "Purch. Inv. Header"."Transaction Type")
            {
            }
            column(TransportMethod_PurchInvHeader; "Purch. Inv. Header"."Transport Method")
            {
            }
            column(VATCountryRegionCode_PurchInvHeader; "Purch. Inv. Header"."VAT Country/Region Code")
            {
            }
            column(BuyfromVendorName_PurchInvHeader; "Purch. Inv. Header"."Buy-from Vendor Name")
            {
            }
            column(BuyfromVendorName2_PurchInvHeader; "Purch. Inv. Header"."Buy-from Vendor Name 2")
            {
            }
            column(BuyfromAddress_PurchInvHeader; "Purch. Inv. Header"."Buy-from Address")
            {
            }
            column(BuyfromAddress2_PurchInvHeader; "Purch. Inv. Header"."Buy-from Address 2")
            {
            }
            column(BuyfromCity_PurchInvHeader; "Purch. Inv. Header"."Buy-from City")
            {
            }
            column(BuyfromContact_PurchInvHeader; "Purch. Inv. Header"."Buy-from Contact")
            {
            }
            column(PaytoPostCode_PurchInvHeader; "Purch. Inv. Header"."Pay-to Post Code")
            {
            }
            column(PaytoCounty_PurchInvHeader; "Purch. Inv. Header"."Pay-to County")
            {
            }
            column(PaytoCountryRegionCode_PurchInvHeader; "Purch. Inv. Header"."Pay-to Country/Region Code")
            {
            }
            column(BuyfromPostCode_PurchInvHeader; "Purch. Inv. Header"."Buy-from Post Code")
            {
            }
            column(BuyfromCounty_PurchInvHeader; "Purch. Inv. Header"."Buy-from County")
            {
            }
            column(BuyfromCountryRegionCode_PurchInvHeader; "Purch. Inv. Header"."Buy-from Country/Region Code")
            {
            }
            column(ShiptoPostCode_PurchInvHeader; "Purch. Inv. Header"."Ship-to Post Code")
            {
            }
            column(ShiptoCounty_PurchInvHeader; "Purch. Inv. Header"."Ship-to County")
            {
            }
            column(ShiptoCountryRegionCode_PurchInvHeader; "Purch. Inv. Header"."Ship-to Country/Region Code")
            {
            }
            column(BalAccountType_PurchInvHeader; "Purch. Inv. Header"."Bal. Account Type")
            {
            }
            column(OrderAddressCode_PurchInvHeader; "Purch. Inv. Header"."Order Address Code")
            {
            }
            column(EntryPoint_PurchInvHeader; "Purch. Inv. Header"."Entry Point")
            {
            }
            column(Correction_PurchInvHeader; "Purch. Inv. Header".Correction)
            {
            }
            column(DocumentDate_PurchInvHeader; "Purch. Inv. Header"."Document Date")
            {
            }
            column(Area_PurchInvHeader; "Purch. Inv. Header".Area)
            {
            }
            column(TransactionSpecification_PurchInvHeader; "Purch. Inv. Header"."Transaction Specification")
            {
            }
            column(PaymentMethodCode_PurchInvHeader; "Purch. Inv. Header"."Payment Method Code")
            {
            }
            column(PreAssignedNoSeries_PurchInvHeader; "Purch. Inv. Header"."Pre-Assigned No. Series")
            {
            }
            column(NoSeries_PurchInvHeader; "Purch. Inv. Header"."No. Series")
            {
            }
            column(OrderNoSeries_PurchInvHeader; "Purch. Inv. Header"."Order No. Series")
            {
            }
            column(PreAssignedNo_PurchInvHeader; "Purch. Inv. Header"."Pre-Assigned No.")
            {
            }
            column(UserID_PurchInvHeader; "Purch. Inv. Header"."User ID")
            {
            }
            column(SourceCode_PurchInvHeader; "Purch. Inv. Header"."Source Code")
            {
            }
            column(TaxAreaCode_PurchInvHeader; "Purch. Inv. Header"."Tax Area Code")
            {
            }
            column(TaxLiable_PurchInvHeader; "Purch. Inv. Header"."Tax Liable")
            {
            }
            column(VATBusPostingGroup_PurchInvHeader; "Purch. Inv. Header"."VAT Bus. Posting Group")
            {
            }
            column(VATBaseDiscount_PurchInvHeader; "Purch. Inv. Header"."VAT Base Discount %")
            {
            }
            column(PrepaymentNoSeries_PurchInvHeader; "Purch. Inv. Header"."Prepayment No. Series")
            {
            }
            column(PrepaymentInvoice_PurchInvHeader; "Purch. Inv. Header"."Prepayment Invoice")
            {
            }
            column(PrepaymentOrderNo_PurchInvHeader; "Purch. Inv. Header"."Prepayment Order No.")
            {
            }
            column(QuoteNo_PurchInvHeader; "Purch. Inv. Header"."Quote No.")
            {
            }
            column(CreditorNo_PurchInvHeader; "Purch. Inv. Header"."Creditor No.")
            {
            }
            column(PaymentReference_PurchInvHeader; "Purch. Inv. Header"."Payment Reference")
            {
            }
            column(DimensionSetID_PurchInvHeader; "Purch. Inv. Header"."Dimension Set ID")
            {
            }
            column(Closed_PurchInvHeader; "Purch. Inv. Header".Closed)
            {
            }
            column(RemainingAmount_PurchInvHeader; "Purch. Inv. Header"."Remaining Amount")
            {
            }
            column(VendorLedgerEntryNo_PurchInvHeader; "Purch. Inv. Header"."Vendor Ledger Entry No.")
            {
            }
            column(InvoiceDiscountAmount_PurchInvHeader; "Purch. Inv. Header"."Invoice Discount Amount")
            {
            }
            column(Cancelled_PurchInvHeader; "Purch. Inv. Header".Cancelled)
            {
            }
            column(Corrective_PurchInvHeader; "Purch. Inv. Header".Corrective)
            {
            }
            column(CampaignNo_PurchInvHeader; "Purch. Inv. Header"."Campaign No.")
            {
            }
            column(BuyfromContactNo_PurchInvHeader; "Purch. Inv. Header"."Buy-from Contact No.")
            {
            }
            column(PaytoContactNo_PurchInvHeader; "Purch. Inv. Header"."Pay-to Contact No.")
            {
            }
            column(ResponsibilityCenter_PurchInvHeader; "Purch. Inv. Header"."Responsibility Center")
            {
            }
            // column(Id_PurchInvHeader;"Purch. Inv. Header".Id)
            // {
            // }
            column(DebitNote_PurchInvHeader; "Purch. Inv. Header"."Debit Note")
            {
            }
            column(Paymentstatus; Paymentstatus)
            {
            }
            dataitem(PAH; 5109)
            {
                DataItemLink = "No." = FIELD("Order No.");
                DataItemTableView = WHERE("Version No." = CONST(1));
                column(AssignedUserID_PAH; PAH."Assigned User ID")
                {
                }
                // column(PRNNo_PAH;PAH."PRN No.")
                // {
                // }
                // column(OrderNo_PAH;PAH."Order No")
                // {
                // }
                // column(IFSNo_PAH;PAH."IFS No")
                // {
                // }
                // column(PPSolicitationType_PAH;PAH."PP Solicitation Type")
                // {
                // }
                // column(PPProcurementMethod_PAH;PAH."PP Procurement Method")
                // {
                // }
                column(DocumentType_PAH; PAH."Document Type")
                {
                }
                column(BuyfromVendorNo_PAH; PAH."Buy-from Vendor No.")
                {
                }
                column(No_PAH; PAH."No.")
                {
                }
                // column(TenderName_PAH;PAH."Tender Name")
                // {
                // }
                // column(PPPlanNo_PAH;PAH."PP Plan No")
                // {
                // }
                // column(PPPlanEntry_PAH;PAH."PP Plan Entry")
                // {
                // }
                // column(AwardedBid_PAH;PAH."Awarded Bid")
                // {
                // }
                // column(OpinionNo_PAH;PAH."Opinion No")
                // {
                // }
                // column(NOANo_PAH;PAH."NOA No")
                // {
                // }
                // column(FinalEvalReportNo_PAH;PAH."Final Eval Report No")
                // {
                // }
            }

            trigger OnAfterGetRecord()
            begin
                VendorLedgerEntry.RESET;
                VendorLedgerEntry.SETRANGE("Document No.", "Purch. Inv. Header"."No.");
                VendorLedgerEntry.SETRANGE("Vendor No.", "Purch. Inv. Header"."Buy-from Vendor No.");
                IF VendorLedgerEntry.FINDSET THEN BEGIN
                    IF VendorLedgerEntry.Open = TRUE THEN BEGIN
                        Paymentstatus := 'Not Paid';
                    END ELSE BEGIN

                        Paymentstatus := 'Paid';
                    END;
                END;
            end;

            trigger OnPreDataItem()
            begin
                corec.GET;
                corec.CALCFIELDS(corec.Picture);
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
        corec: Record 79;
        VendorLedgerEntry: Record 25;
        Paymentstatus: Text[50];
}

