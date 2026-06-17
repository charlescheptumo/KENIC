namespace KICD.KICD;

using Microsoft.Sales.Customer;
using Microsoft.Inventory.Location;
using Microsoft.Utilities;
using Microsoft.Sales.Receivables;
using Microsoft.Foundation.Company;
using System.Security.User;
using Microsoft.Foundation.Address;

report 50107 "Customer Aging Report1"
{
    ApplicationArea = All;
    Caption = 'Customer Aging Report';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(Customer; Customer)
        {
             column(CompanyPicture; CompanyInfo.Picture)
            {
            }
            column(Motto; CompanyInfo.Motto)
            {
            }
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyAddress7; CompanyAddr[7])
            {
            }
            column(CompanyAddress8; CompanyAddr[8])
            {
            }


            column(STRSUBSTNO_Text001_FORMAT_StartDate__; StrSubstNo(Text001, Format(StartDate)))
            {
            }
            column(COMPANYNAME; COMPANYPROPERTY.DisplayName())
            {
            }
            column(Employee_TABLECAPTION__________EmpFilter; TableCaption + ': ' + EmpFilter)
            {
            }
            column(EmpFilter; EmpFilter)
            {
            }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code")
            {

            }
            column(Global_Dimension_1_Name; CustomFunction.DimensionName(1, "Global Dimension 1 Code"))
            {

            }
            column(EmpBalanceDueLCY_5_; EmpBalanceDueLCY[5])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_4_; EmpBalanceDueLCY[4])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_3_; EmpBalanceDueLCY[3])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_2_; EmpBalanceDueLCY[2])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_1_; EmpBalanceDueLCY[1])
            {
                AutoFormatType = 1;
            }
            column(Employee__No__; "No.")
            {
            }
            column(EmpBalanceDueLCY_5__Control25; EmpBalanceDueLCY[5])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_4__Control26; EmpBalanceDueLCY[4])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_3__Control27; EmpBalanceDueLCY[3])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_2__Control28; EmpBalanceDueLCY[2])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_1__Control29; EmpBalanceDueLCY[1])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_5__Control37; EmpBalanceDueLCY[5])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_4__Control38; EmpBalanceDueLCY[4])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_3__Control39; EmpBalanceDueLCY[3])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_2__Control40; EmpBalanceDueLCY[2])
            {
                AutoFormatType = 1;
            }
            column(EmpBalanceDueLCY_1__Control41; EmpBalanceDueLCY[1])
            {
                AutoFormatType = 1;
            }
            column(Employee___Summary_Aging_Simp_Caption; Employee___Summary_Aging_Simp_CaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(All_amounts_are_in_LCYCaption; All_amounts_are_in_LCYCaptionLbl)
            {
            }
            column(Employee__No__Caption; FieldCaption("No."))
            {
            }
            column(Employee_NameCaption; FieldCaption("First Name"))
            {
            }
            column(EmpBalanceDueLCY_5__Control25Caption; EmpBalanceDueLCY_5__Control25CaptionLbl)
            {
            }
            column(EmpBalanceDueLCY_4__Control26Caption; EmpBalanceDueLCY_4__Control26CaptionLbl)
            {
            }
            column(EmpBalanceDueLCY_3__Control27Caption; EmpBalanceDueLCY_3__Control27CaptionLbl)
            {
            }
            column(EmpBalanceDueLCY_2__Control28Caption; EmpBalanceDueLCY_2__Control28CaptionLbl)
            {
            }
            column(EmpBalanceDueLCY_1__Control29Caption; EmpBalanceDueLCY_1__Control29CaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(AccountType; "Account Type")
            {
            }
            column(Address; Address)
            {
            }
            column(Address2; "Address 2")
            {
            }
            column(AdvancePaymentContractorNo; "Advance Payment Contractor No")
            {
            }
            column(AgentCode; "Agent Code")
            {
            }
            column(AllowLineDisc; "Allow Line Disc.")
            {
            }
            column(AllowMultiplePostingGroups; "Allow Multiple Posting Groups")
            {
            }
            column(Amount; Amount)
            {
            }
            column(ApplicationMethod; "Application Method")
            {
            }
            column(Balance; Balance)
            {
            }
            column(BalanceLCY; "Balance (LCY)")
            {
            }
            column(BalanceDue; "Balance Due")
            {
            }
            column(BalanceDueLCY; "Balance Due (LCY)")
            {
            }
            column(BankAccountNumber; "Bank Account Number")
            {
            }
            column(BankBranch; "Bank Branch")
            {
            }
            column(BankBranchName; "Bank Branch Name")
            {
            }
            column(BankName; "Bank Name")
            {
            }
            column(BaseCalendarCode; "Base Calendar Code")
            {
            }
            column(BeneficiaryAddress1; "Beneficiary Address 1")
            {
            }
            column(BeneficiaryAddress2; "Beneficiary Address 2")
            {
            }
            column(BeneficiaryTelephone; "Beneficiary Telephone")
            {
            }
            column(BillToNoofBlanketOrders; "Bill-To No. of Blanket Orders")
            {
            }
            column(BillToNoofCreditMemos; "Bill-To No. of Credit Memos")
            {
            }
            column(BillToNoofInvoices; "Bill-To No. of Invoices")
            {
            }
            column(BillToNoofOrders; "Bill-To No. of Orders")
            {
            }
            column(BillToNoofPstdCrMemos; "Bill-To No. of Pstd. Cr. Memos")
            {
            }
            column(BillToNoofPstdInvoices; "Bill-To No. of Pstd. Invoices")
            {
            }
            column(BillToNoofPstdReturnR; "Bill-To No. of Pstd. Return R.")
            {
            }
            column(BillToNoofPstdShipments; "Bill-To No. of Pstd. Shipments")
            {
            }
            column(BillToNoofQuotes; "Bill-To No. of Quotes")
            {
            }
            column(BillToNoofReturnOrders; "Bill-To No. of Return Orders")
            {
            }
            column(BilltoCustomerNo; "Bill-to Customer No.")
            {
            }
            column(BilltoNoOfArchivedDoc; "Bill-to No. Of Archived Doc.")
            {
            }
            column(BlockPaymentTolerance; "Block Payment Tolerance")
            {
            }
            column(Blocked; Blocked)
            {
            }
            column(BudgetedAmount; "Budgeted Amount")
            {
            }
            column(CashFlowPaymentTermsCode; "Cash Flow Payment Terms Code")
            {
            }
            column(ChainName; "Chain Name")
            {
            }
            column(City; City)
            {
            }
            column(CollectionMethod; "Collection Method")
            {
            }
            column(CombineShipments; "Combine Shipments")
            {
            }
            column(Comment; Comment)
            {
            }
            column(CompanyRegNo; "Company Reg No")
            {
            }
            column(Contact; Contact)
            {
            }
            column(ContactGraphId; "Contact Graph Id")
            {
            }
            column(ContactID; "Contact ID")
            {
            }
            column(ContactType; "Contact Type")
            {
            }
            column(ContractGainLossAmount; "Contract Gain/Loss Amount")
            {
            }
            column(CopySelltoAddrtoQteFrom; "Copy Sell-to Addr. to Qte From")
            {
            }
            column(CountryRegionCode; "Country/Region Code")
            {
            }
            column(County; County)
            {
            }
            // column(CoupledtoCRM; "Coupled to CRM")
            // {
            // }
            column(CoupledtoDataverse; "Coupled to Dataverse")
            {
            }
            column(CrMemoAmounts; "Cr. Memo Amounts")
            {
            }
            column(CrMemoAmountsLCY; "Cr. Memo Amounts (LCY)")
            {
            }
            column(CreditAmount; "Credit Amount")
            {
            }
            column(CreditAmountLCY; "Credit Amount (LCY)")
            {
            }
            column(CreditLimitLCY; "Credit Limit (LCY)")
            {
            }
            column(CurrencyCode; "Currency Code")
            {
            }
            column(CurrencyId; "Currency Id")
            {
            }
            column(CustomerCategory; "Customer Category")
            {
            }
            column(CustomerDiscGroup; "Customer Disc. Group")
            {
            }
            column(CustomerPostingGroup; "Customer Posting Group")
            {
            }
            column(CustomerPriceGroup; "Customer Price Group")
            {
            }
            column(CustomerType; "Customer Type")
            {
            }
            column(DateOfAcquistion; "Date Of Acquistion")
            {
            }
            column(DateofBirth; "Date of Birth")
            {
            }
            column(DebitAmount; "Debit Amount")
            {
            }
            column(DebitAmountLCY; "Debit Amount (LCY)")
            {
            }
            column(DebtorType; "Debtor Type")
            {
            }
            column(DefaultVATCode; "Default VAT Code")
            {
            }
            column(DefaultWithholdingTaxCode; "Default Withholding Tax Code")
            {
            }
            column(DisableSearchbyName; "Disable Search by Name")
            {
            }
            column(DocumentSendingProfile; "Document Sending Profile")
            {
            }
            column(EMail; "E-Mail")
            {
            }
            column(EORINumber; "EORI Number")
            {
            }
            column(EmployeesBank; "Employee's Bank")
            {
            }
            column(ExcludefromPmtPractices; "Exclude from Pmt. Practices")
            {
            }
            column(ExpectedRepayment; "Expected Repayment")
            {
            }
            column(FaxNo; "Fax No.")
            {
            }
            column(FinChargeMemoAmountsLCY; "Fin. Charge Memo Amounts (LCY)")
            {
            }
            column(FinChargeTermsCode; "Fin. Charge Terms Code")
            {
            }
            column(FinanceChargeMemoAmounts; "Finance Charge Memo Amounts")
            {
            }
            column(FirstName; "First Name")
            {
            }
            column(FormatRegion; "Format Region")
            {
            }
            column(FundingClass; "Funding Class")
            {
            }
            column(GLN; GLN)
            {
            }
            column(GenBusPostingGroup; "Gen. Bus. Posting Group")
            {
            }
            column(Gender; Gender)
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(HomePage; "Home Page")
            {
            }
            column(ICPartnerCode; "IC Partner Code")
            {
            }
            column(IDNo; "ID. No.")
            {
            }
            column(Image; Image)
            {
            }
            column(ImprestBalanceAmount; "Imprest Balance Amount")
            {
            }
            column(Imprests; Imprests)
            {
            }
            column(InstitutionCode; "Institution Code")
            {
            }
            column(InstitutionName; "Institution Name")
            {
            }
            column(IntrastatPartnerType; "Intrastat Partner Type")
            {
            }
            column(InvAmountsLCY; "Inv. Amounts (LCY)")
            {
            }
            column(InvDiscountsLCY; "Inv. Discounts (LCY)")
            {
            }
            column(InvoiceAmounts; "Invoice Amounts")
            {
            }
            column(InvoiceCopies; "Invoice Copies")
            {
            }
            column(InvoiceDiscCode; "Invoice Disc. Code")
            {
            }
            column(JobDescription; "Job Description")
            {
            }
            column(JobGroup; "Job Group")
            {
            }
            column(JobGroupName; "Job Group Name")
            {
            }
            column(JobTitle; "Job Title")
            {
            }
            column(LRNo; "LR No")
            {
            }
            column(LanguageCode; "Language Code")
            {
            }
            column(LastDateModified; "Last Date Modified")
            {
            }
            column(LastModifiedDateTime; "Last Modified Date Time")
            {
            }
            column(LastName; "Last Name")
            {
            }
            column(LastStatementNo; "Last Statement No.")
            {
            }
            column(LeaseholdPeriod; "Leasehold Period")
            {
            }
            column(Location; Location)
            {
            }
            column(LocationCode; "Location Code")
            {
            }
            column(MiddleName; "Middle Name")
            {
            }
            column(MobilePhoneNo; "Mobile Phone No.")
            {
            }
            column(MortgageTerm; "Mortgage Term")
            {
            }
            column(MortgageType; "Mortgage Type")
            {
            }
            column(Name; Name)
            {
            }
            column(Name2; "Name 2")
            {
            }
            column(NameOfBeneficiary; "Name Of Beneficiary")
            {
            }
            column(NetChange; "Net Change")
            {
            }
            column(NetChangeLCY; "Net Change (LCY)")
            {
            }
            column(No; "No.")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(NoofBlanketOrders; "No. of Blanket Orders")
            {
            }
            column(NoofCreditMemos; "No. of Credit Memos")
            {
            }
            column(NoofFundingSources; "No. of Funding Sources")
            {
            }
            column(NoofInvoices; "No. of Invoices")
            {
            }
            column(NoofOrders; "No. of Orders")
            {
            }
            column(NoofProjects; "No. of Projects")
            {
            }
            column(NoofPstdCreditMemos; "No. of Pstd. Credit Memos")
            {
            }
            column(NoofPstdInvoices; "No. of Pstd. Invoices")
            {
            }
            column(NoofPstdReturnReceipts; "No. of Pstd. Return Receipts")
            {
            }
            column(NoofPstdShipments; "No. of Pstd. Shipments")
            {
            }
            column(NoofQuotes; "No. of Quotes")
            {
            }
            column(NoofReturnOrders; "No. of Return Orders")
            {
            }
            column(NoofShiptoAddresses; "No. of Ship-to Addresses")
            {
            }
            column(OtherAmounts; "Other Amounts")
            {
            }
            column(OtherAmountsLCY; "Other Amounts (LCY)")
            {
            }
            column(OurAccountNo; "Our Account No.")
            {
            }
            column(OutstandingInvoices; "Outstanding Invoices")
            {
            }
            column(OutstandingInvoicesLCY; "Outstanding Invoices (LCY)")
            {
            }
            column(OutstandingOrders; "Outstanding Orders")
            {
            }
            column(OutstandingOrdersLCY; "Outstanding Orders (LCY)")
            {
            }
            column(OutstandingServOrdersLCY; "Outstanding Serv. Orders (LCY)")
            {
            }
            column(OutstandingServInvoicesLCY; "Outstanding Serv.Invoices(LCY)")
            {
            }
            column(PIN; "P.I.N")
            {
            }
            column(PINNo; "PIN No")
            {
            }
            column(PartnerType; "Partner Type")
            {
            }
            column(PaymentMethodCode; "Payment Method Code")
            {
            }
            column(PaymentMethodId; "Payment Method Id")
            {
            }
            column(PaymentTermsCode; "Payment Terms Code")
            {
            }
            column(PaymentTermsId; "Payment Terms Id")
            {
            }
            column(Payments; Payments)
            {
            }
            column(PaymentsLCY; "Payments (LCY)")
            {
            }
            column(PhoneNo; "Phone No.")
            {
            }
            column(PhysicalLocation; "Physical Location")
            {
            }
            column(PlaceofExport; "Place of Export")
            {
            }
            column(PmtDiscToleranceLCY; "Pmt. Disc. Tolerance (LCY)")
            {
            }
            column(PmtDiscountsLCY; "Pmt. Discounts (LCY)")
            {
            }
            column(PmtToleranceLCY; "Pmt. Tolerance (LCY)")
            {
            }
            column(PositionName; "Position Name")
            {
            }
            column(Positioncode; "Position code")
            {
            }
            column(PostCode; "Post Code")
            {
            }
            column(PreferredBankAccountCode; "Preferred Bank Account Code")
            {
            }
            column(Prepayment; "Prepayment %")
            {
            }
            column(PriceCalculationMethod; "Price Calculation Method")
            {
            }
            column(PricesIncludingVAT; "Prices Including VAT")
            {
            }
            column(PrimaryContactNo; "Primary Contact No.")
            {
            }
            column(PrintStatements; "Print Statements")
            {
            }
            column(Priority; Priority)
            {
            }
            column(PrivacyBlocked; "Privacy Blocked")
            {
            }
            column(ProfitLCY; "Profit (LCY)")
            {
            }
            column(PropertyParticulars; "Property Particulars")
            {
            }
            column(RealEstateManagerName; "Real Estate Manager Name")
            {
            }
            column(RealEstateManagerTelephone; "Real Estate Manager Telephone")
            {
            }
            column(Refunds; Refunds)
            {
            }
            column(RefundsLCY; "Refunds (LCY)")
            {
            }
            column(RegistrationNumber; "Registration Number")
            {
            }
            column(ReminderAmounts; "Reminder Amounts")
            {
            }
            column(ReminderAmountsLCY; "Reminder Amounts (LCY)")
            {
            }
            column(ReminderTermsCode; "Reminder Terms Code")
            {
            }
            column(Reserve; Reserve)
            {
            }
            column(ResponsibilityCenter; "Responsibility Center")
            {
            }
            column(SalesLCY; "Sales (LCY)")
            {
            }
            column(SalespersonCode; "Salesperson Code")
            {
            }
            column(SearchName; "Search Name")
            {
            }
            column(SelltoNoOfArchivedDoc; "Sell-to No. Of Archived Doc.")
            {
            }
            column(ServShippedNotInvoicedLCY; "Serv Shipped Not Invoiced(LCY)")
            {
            }
            column(ServiceZoneCode; "Service Zone Code")
            {
            }
            column(ShiptoCode; "Ship-to Code")
            {
            }
            column(ShipmentMethodCode; "Shipment Method Code")
            {
            }
            column(ShipmentMethodId; "Shipment Method Id")
            {
            }
            column(ShippedNotInvoiced; "Shipped Not Invoiced")
            {
            }
            column(ShippedNotInvoicedLCY; "Shipped Not Invoiced (LCY)")
            {
            }
            column(ShippingAdvice; "Shipping Advice")
            {
            }
            column(ShippingAgentCode; "Shipping Agent Code")
            {
            }
            column(ShippingAgentServiceCode; "Shipping Agent Service Code")
            {
            }
            column(ShippingTime; "Shipping Time")
            {
            }
            column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
            {
            }
            column(ShortcutDimension4Code; "Shortcut Dimension 4 Code")
            {
            }
            column(ShortcutDimension5Code; "Shortcut Dimension 5 Code")
            {
            }
            column(Signature; Signature)
            {
            }
            column(Sport; Sport)
            {
            }
            column(SportDiscipline; "Sport Discipline")
            {
            }
            column(StaffNo; "Staff No.")
            {
            }
            column(StatisticsGroup; "Statistics Group")
            {
            }
            column(Status; Status)
            {
            }
            column(Stock; Stock)
            {
            }
            column(Surrenders; Surrenders)
            {
            }
           

            trigger OnAfterGetRecord()
            var
                FilteredEmployee: Record  Customer;
                ShouldSkipEmployee: Boolean;
            begin
                FilteredEmployee.CopyFilters(Customer);
                FilteredEmployee.SetFilter("Date Filter", '..%1', StartDate);
                FilteredEmployee.SetRange("No.", "No.");
                ShouldSkipEmployee := FilteredEmployee.IsEmpty();
                Customer.CalcFields(Balance);
                OnEmployeeOnAfterGetRecordOnAfterCalcShouldSkipEmployee(Customer, FilteredEmployee, DtldEmpLedgEntry, EmpBalanceDueLCY, PrintEmp, ShouldSkipEmployee);
                if ShouldSkipEmployee then
                    CurrReport.Skip();

                PrintEmp := false;
                for i := 1 to 5 do begin
                    // DtldEmpLedgEntry.SetCurrentKey("No.", "Initial Entry Due Date", "Posting Date");
                    DtldEmpLedgEntry.SetCurrentKey("Customer No.", "Posting Date");
                    DtldEmpLedgEntry.SetRange("Customer No.", "No.");
                    DtldEmpLedgEntry.SetRange("Posting Date", 0D, StartDate);
                    // DtldEmpLedgEntry.SetRange("Initial Entry Due Date", PeriodStartDate[i], PeriodStartDate[i + 1] - 1);
                    DtldEmpLedgEntry.SetRange("Posting Date", PeriodStartDate[i], PeriodStartDate[i + 1] - 1);
                    OnAfterGetRecordOnAfterDtldEmpLedgEntrySetFilters(DtldEmpLedgEntry);
                    DtldEmpLedgEntry.CalcSums("Amount (LCY)");
                    EmpBalanceDueLCY[i] := DtldEmpLedgEntry."Amount (LCY)";
                    if EmpBalanceDueLCY[i] <> 0 then
                        PrintEmp := true;
                end;
                if not PrintEmp then
                    CurrReport.Skip();
            end;

            trigger OnPreDataItem()
            begin
                Clear(EmpBalanceDueLCY);
            end;
        }
        
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                 group(Options)
                {
                    Caption = 'Options';
                    field(StartingDate; StartDate)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Starting Date';
                        ToolTip = 'Specifies the date from which the report or batch job processes information.';
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
        trigger OnOpenPage()
        begin
            if StartDate = 0D then
                StartDate := WorkDate();
        end;
    }

    
     trigger OnPreReport()
    var
        FormatDocument: Codeunit "Format Document";
    begin
        if CompanyInfo.get() then
            CompanyInfo.CalcFields(Picture);
        if UserSetup.Get(UserId) then
            FormatAddr.GetCompanyAddr(UserSetup."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);

        EmpFilter := FormatDocument.GetRecordFiltersWithCaptions(Customer);
        PeriodStartDate[5] := StartDate;
        PeriodStartDate[6] := DMY2Date(31, 12, 9999);
        for i := 4 downto 2 do
            PeriodStartDate[i] := CalcDate('<-30D>', PeriodStartDate[i + 1]);
    end;
    var
        DtldEmpLedgEntry: Record "Detailed Cust. Ledg. Entry";
        StartDate: Date;
        PeriodStartDate: array[6] of Date;
        EmpBalanceDueLCY: array[5] of Decimal;
        PrintEmp: Boolean;
        i: Integer;

        Text001: Label 'As of %1';
        Employee___Summary_Aging_Simp_CaptionLbl: Label 'Employee - Summary Aging Simp.';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        All_amounts_are_in_LCYCaptionLbl: Label 'All amounts are in LCY';
        EmpBalanceDueLCY_5__Control25CaptionLbl: Label 'Not Due';
        EmpBalanceDueLCY_4__Control26CaptionLbl: Label '0-30 days';
        EmpBalanceDueLCY_3__Control27CaptionLbl: Label '31-60 days';
        EmpBalanceDueLCY_2__Control28CaptionLbl: Label '61-90 days';
        EmpBalanceDueLCY_1__Control29CaptionLbl: Label 'Over 90 days';
        TotalCaptionLbl: Label 'Total';
        CompanyInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        RespCenter: Record "Responsibility Center";
        CompanyAddr: array[8] of Text[100];
        CustomFunction: Codeunit "Custom Function";
        FormatAddr: Codeunit "Format Address";

    protected var
        EmpFilter: Text;

    procedure InitializeRequest(StartingDate: Date)
    begin
        StartDate := StartingDate;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetRecordOnAfterDtldEmpLedgEntrySetFilters(var DetailedEmpLedgEntry: Record "Detailed Cust. Ledg. Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnEmployeeOnAfterGetRecordOnAfterCalcShouldSkipEmployee(Employee: Record Customer; var FilteredEmployee: Record Customer; var DetailedEmpLedgEntry: Record "Detailed Cust. Ledg. Entry"; var EmpBalanceDueLCY: array[5] of Decimal; var PrintEmp: Boolean; var ShouldSkipEmployee: Boolean)
    begin
    end;
}
