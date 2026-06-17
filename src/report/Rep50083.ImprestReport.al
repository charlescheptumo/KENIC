namespace KICD.KICD;
using Microsoft.Foundation.Company;
using Microsoft.Inventory.Location;
using Microsoft.Foundation.Address;

report 50083 "Imprest Report"
{
    ApplicationArea = All;
    Caption = 'OutStanding Imprest Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Outstanding Imprestsv1.rdlc';
    dataset
    {
        dataitem(payments; payments)
        {
        DataItemTableView = where("Payment Type" = filter(Imprest), "Account Type" = filter(Employee), Surrendered = const(false), "Archive Document" = const(false),Status = const(Released));

            column(AccessRetentionAccount; "Access Retention Account")
            {
            }
            column(AccountName; "Account Name")
            {
            }
            column(AccountNo; "Account No.")
            {
            }
            column(AccountType; "Account Type")
            {
            }
            column(Acknowledged; Acknowledged)
            {
            }
            column(AcknowledgedOn; "Acknowledged On")
            {
            }
            column(Acknowledger; Acknowledger)
            {
            }
            column(ActualAmount; "Actual Amount")
            {
            }
            column(ActualAmountSpent; "Actual Amount Spent")
            {
            }
            column(ActualPettyCashAmountSpent; "Actual Petty Cash Amount Spent")
            {
            }
            column(ActualProjectCosts; "Actual Project Costs")
            {
            }
            column(AdvancePayment; "Advance Payment")
            {
            }
            column(AdvanceRecovery; "Advance Recovery")
            {
            }
            column(AmountApproved; "Amount Approved")
            {
            }
            column(AmountPaid; "Amount Paid")
            {
            }
            column(AmountPending; "Amount Pending")
            {
            }
            column(AppliesToDocNo; "Applies- To Doc No.")
            {
            }
            column(ArchiveDocument; "Archive Document")
            {
            }
            column(AvailableAmount; "Available Amount")
            {
            }
            column(AvailableFunds; "Available Funds")
            {
            }
            column(BankBalance; "Bank Balance")
            {
            }
            column(BankCode; "Bank Code")
            {
            }
            column(BankName; "Bank Name")
            {
            }
            column(BudgetCenterName; "Budget Center Name")
            {
            }
            column(CashReceiptAmount; "Cash Receipt Amount")
            {
            }
            column(Cashier; Cashier)
            {
            }
            column(ChequeDate; "Cheque Date")
            {
            }
            column(ChequeNo; "Cheque No")
            {
            }
            column(ChequeType; "Cheque Type")
            {
            }
            column(Comments; Comments)
            {
            }
        
           
            column(Date; "Date")
            {
            }
            column(DateSurrendered; "Date Surrendered")
            {
            }
            column(Dateconverted; "Date converted")
            {
            }
            column(DateofJoining; "Date of Joining")
            {
            }
            column(DateofReporting; "Date of Reporting")
            {
            }
            column(DateTimeSent; "DateTime Sent")
            {
            }
            column(DepartmentCode; "Department Code")
            {
            }
            column(DepartmentName; "Department Name")
            {
            }
            column(DepartureDate; "Departure Date")
            {
            }
            column(Destination; Destination)
            {
            }
            column(DestinationName; "Destination Name")
            {
            }
            column(DimensionSetID; "Dimension Set ID")
            {
            }
            column(DirectorAllowance; "Director Allowance")
            {
            }
            column(DirectorateCode; "Directorate Code")
            {
            }
            column(DirectorateHead; "Directorate Head")
            {
            }
            column(Division; Division)
            {
            }
            column(DivisionName; "Division Name")
            {
            }
            column(DocumentType; "Document Type")
            {
            }
            column(EffectivefromMonth; "Effective from Month")
            {
            }
            column(EmployeeBanAccountName; "Employee Ban Account Name")
            {
            }
            column(EmployeeBankAccountCode; "Employee Bank Account Code")
            {
            }
            column(EmployeeBankAccountNumber; "Employee Bank Account Number")
            {
            }
            column(EmployeeBankBrachCode; "Employee Bank Brach Code")
            {
            }
            column(EmployeeBankBranchName; "Employee Bank Branch Name")
            {
            }
            column(EmployeeMobileNo; "Employee Mobile No")
            {
            }
            column(FileNo; "File No.")
            {
            }
            column(Finance; Finance)
            {
            }
            column(FloatReimbursement; "Float Reimbursement")
            {
            }
            column(FunctionName; "Function Name")
            {
            }
            column(FundingSource; "Funding Source")
            {
            }
            column(HOD; HOD)
            {
            }
            column(Imprest; Imprest)
            {
            }
            column(ImprestAmount; "Imprest Amount")
            {
            }
            column(ImprestApplicationCommitment; "Imprest Application Commitment")
            {
            }
            column(ImprestBankAccountNumber; "Imprest Bank Account Number")
            {
            }
            column(ImprestBankBranchName; "Imprest Bank Branch Name")
            {
            }
            column(ImprestBankName; "Imprest Bank Name")
            {
            }
            column(ImprestCreated; "Imprest Created")
            {
            }
            column(ImprestDeadline; "Imprest Deadline")
            {
            }
            column(ImprestIssueDate; "Imprest Issue Date")
            {
            }
            column(ImprestIssueDocNo; "Imprest Issue Doc. No")
            {
            }
            column(ImprestMemoNo; "Imprest Memo No")
            {
            }
            column(ImprestMemoNoStaffClaim; "Imprest Memo No Staff Claim")
            {
            }
            column(ImprestMemoSurrenderNo; "Imprest Memo Surrender No")
            {
            }
            column(ImprestType; "Imprest Type")
            {
            }
            column(Job; Job)
            {
            }
            column(JobDescription; "Job Description")
            {
            }
            column(JobGroup; "Job Group")
            {
            }
            column(JobName; "Job Name")
            {
            }
            column(JobTaskBudget; "Job Task Budget")
            {
            }
            column(JobTaskName; "Job Task Name")
            {
            }
            column(JobTaskRemainingAmount; "Job Task Remaining Amount")
            {
            }
            column(JobNo; JobNo)
            {
            }
            column(MonthlyInstallment; "Monthly Installment")
            {
            }
            column(Noofmonthsdeducted; "No of months deducted")
            {
            }
            column(No; "No.")
            {
            }
            column(NoPrinted; "No. Printed")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(NotificationSent; "Notification Sent")
            {
            }
            column(ObligationIncomeTax; "Obligation Income Tax")
            {
            }
            column(ObligationVAT; "Obligation VAT")
            {
            }
            column(ObligationWHT; "Obligation WHT")
            {
            }
            column(Onbehalfof; "On behalf of")
            {
            }
            column(OriginalDocument; "Original Document")
            {
            }
            column(OriginalDocumentNo; "Original Document No")
            {
            }
            column(POCommitments; "PO Commitments")
            {
            }
            column(PRNCommitments; "PRN Commitments")
            {
            }
            column(PVCreationDateTime; "PV Creation DateTime")
            {
            }
            column(PVCreatorID; "PV Creator ID")
            {
            }
            column(PVRemainingAmount; "PV Remaining Amount")
            {
            }
            column(PartPayment; "Part Payment")
            {
            }
            column(PayMode; "Pay Mode")
            {
            }
            column(Payee; Payee)
            {
            }
            column(PayingBankAccount; "Paying Bank Account")
            {
            }
            column(PaymentNarration; "Payment Narration")
            {
            }
            column(PaymentReleaseDate; "Payment Release Date")
            {
            }
            column(PaymentType; "Payment Type")
            {
            }
            column(Paymentprocessed; "Payment processed")
            {
            }
            column(PayrollDeductionCode; "Payroll Deduction Code")
            {
            }
            column(PettyCashAmount; "Petty Cash Amount")
            {
            }
            column(PhoneNumber; "Phone Number")
            {
            }
            column(Posted; Posted)
            {
            }
            column(PostedBy; "Posted By")
            {
            }
            column(PostedDate; "Posted Date")
            {
            }
            column(PostedtoKCB; "Posted to KCB")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(PreAssignedNo; "Pre-Assigned No.")
            {
            }
            column(Project; Project)
            {
            }
            column(ProjectBudget; "Project Budget")
            {
            }
            column(ProjectDescription; "Project Description")
            {
            }
            column(ProjectName; "Project Name")
            {
            }
            column(Purpose; Purpose)
            {
            }
            column(ReasonstoReopen; "Reasons to Reopen")
            {
            }
            column(ReceiptCreated; "Receipt Created")
            {
            }
            column(ReceiptedPettyCashAmount; "Receipted Petty Cash Amount")
            {
            }
            column(RecoveryFrom; "Recovery From")
            {
            }
            column(RecoveryStartMonth; "Recovery Start Month")
            {
            }
            column(ReferenceNo; "Reference No.")
            {
            }
            column(RegionalManager; "Regional Manager")
            {
            }
            column(RegionalManagerName; "Regional Manager Name")
            {
            }
            column(RemainingAmount; "Remaining Amount")
            {
            }
            column(RemainingPettyCashAmount; "Remaining Petty Cash Amount")
            {
            }
            column(Remarks; Remarks)
            {
            }
            column(ResponsibilityCenter; "Responsibility Center")
            {
            }
            column(RetentionAccount; "Retention Account")
            {
            }
            column(RetentionDonor; "Retention Donor")
            {
            }
            column(Reversed; Reversed)
            {
            }
            column(SalaryAdvance; "Salary Advance")
            {
            }
            column(SalaryAdvanceMemoNo; "Salary Advance Memo No")
            {
            }
            column(SalaryLastDrawn; "Salary Last Drawn")
            {
            }
            column(SalaryType; "Salary Type")
            {
            }
            column(Select; Select)
            {
            }
            column(Selected; Selected)
            {
            }
            column(SendforPosting; "Send for Posting")
            {
            }
            column(SenttoKCB; "Sent to KCB")
            {
            }
            column(ShortcutDimension1Code; "Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code; "Shortcut Dimension 2 Code")
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
            column(SourceBankAccNo; "Source Bank Acc No.")
            {
            }
            column(StaffClaim; "Staff Claim")
            {
            }
            column(StaffClaimNo; "Staff Claim No")
            {
            }
            column(StandingImprestType; "Standing Imprest Type")
            {
            }
            column(Status; Status)
            {
            }
            column(StoreRequisitionCommitments; "Store Requisition Commitments")
            {
            }
            column(SurrenderCreated; "Surrender Created")
            {
            }
            column(SurrenderDate; "Surrender Date")
            {
            }
            column(SurrenderStatus; "Surrender Status")
            {
            }
            column(Surrendered; Surrendered)
            {
            }
            column(SurrenderedBy; "Surrendered By")
            {
            }
            column(SystemCreatedAt; SystemCreatedAt)
            {
            }
            column(SystemCreatedBy; SystemCreatedBy)
            {
            }
            column(SystemId; SystemId)
            {
            }
            column(SystemModifiedAt; SystemModifiedAt)
            {
            }
            column(SystemModifiedBy; SystemModifiedBy)
            {
            }
            column(Test; Test)
            {
            }
            column(TimePosted; "Time Posted")
            {
            }
            column(Timeconverted; "Time converted")
            {
            }
            column(TotalAmount; "Total Amount")
            {
            }
            column(TotalBudgetCommitments; "Total Budget Commitments")
            {
            }
            column(TotalLiquidatedDamages; "Total Liquidated Damages")
            {
            }
            column(TotalMpesaCharges; "Total Mpesa Charges")
            {
            }
            column(TotalNetAmount; "Total Net Amount")
            {
            }
            column(TotalNetPay; "Total Net Pay")
            {
            }
            column(TotalObligationAmount; "Total Obligation Amount")
            {
            }
            column(TotalPAYEAmount; "Total PAYE Amount")
            {
            }
            column(TotalPaymentAmountLCY; "Total Payment Amount LCY")
            {
            }
            column(TotalRetentionAmount; "Total Retention Amount")
            {
            }
            column(TotalSupervisionCost; "Total Supervision Cost")
            {
            }
            column(TotalVATAmount; "Total VAT Amount")
            {
            }
            column(TotalWitholdingTaxAmount; "Total Witholding Tax Amount")
            {
            }
            column(TravelDate; "Travel Date")
            {
            }
            column(Type; "Type")
            {
            }
            column(UnitName; "Unit  Name")
            {
            }
            column(UsedClaim; "Used Claim")
            {
            }
            column(VATWthheldsix; "VAT Wthheld six %")
            {
            }
            column(VendorBank; "Vendor Bank")
            {
            }
            column(VendorBankAccount; "Vendor Bank Account")
            {
            }
            column(VendorBankBranch; "Vendor Bank Branch")
            {
            }
            column(VoteAmount; "Vote Amount")
            {
            }
            column(VoteItem; "Vote Item")
            {
            }
            column(banked; banked)
            {
            }
            column(StartDate;StartDate)
            {
                

            }
            column(EndDate;EndDate)
            {

            }
            column(CompanyPicture; CompanyInformation.Picture)
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
            column(CompanyMotto; CompanyInformation.Motto)
            {
            }
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                
            end;

            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                payments.SetRange("Posting Date",StartDate,EndDate);
                
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
                     field(StartDate; StartDate)
                    {
                        Caption = 'Start Date';
                        //ShowMandatory = true;
                        ApplicationArea = Basic;
                    }
                    field(EndDate; EndDate)
                    {
                        Caption = 'End Date';
                        ShowMandatory = true;
                        ApplicationArea = Basic;
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
        CompanyInformation.get();
        CompanyInformation.CalcFields(Picture);
        FormatAddr.GetCompanyAddr('', ResponsibilityCenter, CompanyInformation, CompanyAddr);
    end;

    trigger OnInitReport()
    begin
        CompanyInformation.get();
        CompanyInformation.CalcFields(Picture);
        FormatAddr.GetCompanyAddr('', ResponsibilityCenter, CompanyInformation, CompanyAddr);
    end;
    var
     EmpName: Text;
     CompanyInformation: Record "Company Information";
     FormatAddr: Codeunit "Format Address";
     CompanyAddr: array[8] of Text[100];
     ResponsibilityCenter: Record "Responsibility Center";
     StartDate: Date;
     EndDate: Date;
     Err001: Label 'The Start Date field is required.';
     Err002: Label 'The End Date field is required.';
}
