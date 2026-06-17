namespace KICD.KICD;
using System.Security.User;
using System.Automation;
using Microsoft.Foundation.Company;

report 50102 "Inspection Report"
{
    ApplicationArea = All;
    Caption = 'Inspection Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Inspection Report.rdlc';
    dataset
    {
        dataitem(InspectionHeader1; "Inspection Header1")
        {
            RequestFilterFields = "Inspection No", "Contract/Order No";
             column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompanyPostCode; CompanyInfo."Post Code")
            {
            }
            column(Amount; Amount)
            {
            }
            column(AmountInvoiced; "Amount Invoiced")
            {
            }
            column(ApprovedPurchaseRequisition; "Approved Purchase Requisition")
            {
            }
            column(ClauseNo; "Clause No.")
            {
            }
            column(CommiteeAppointmentNo; "Commitee Appointment No")
            {
            }
            column(ContractOrderNo; "Contract/Order No")
            {
            }
            column(CreatedBy; "Created By")
            {
            }
            column(CreatedOn; "Created On")
            {
            }
            column(CreationTime; "Creation Time")
            {
            }
            column(DeliveryNote; "Delivery Note")
            {
            }
            column(DeliveryNoteDate; "Delivery Note Date")
            {
            }
            column(Description; Description)
            {
            }
            column(ETRReceipt; "ETR Receipt")
            {
            }
            column(ETRReceiptDate; "ETR Receipt Date")
            {
            }
            column(GeneralCommitteRemarks; "General Committe Remarks")
            {
            }
            column(InspectionDate; "Inspection Date")
            {
            }
            column(InspectionNo; "Inspection No")
            {
            }
            column(Invoice; Invoice)
            {
            }
            column(LPO; LPO)
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(ResponsibilityCenter; "Responsibility Center")
            {
            }
            column(Status; Status)
            {
            }
            column(SupplierName; "Supplier Name")
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
            column(TempAmount; "Temp Amount")
            {
            }
            column(TenderQuotationNo; "Tender/Quotation No.")
            {
            }
            column(Type; "Type")
            {
            }
            dataitem(InspectionLines;"Inspection Lines1")
            {
             DataItemLink = "Inspection No" = field("Inspection No");
                
                column(Description_InspectionLines; Description)
                {
                }
                column(InspectionDecision_InspectionLines; "Inspection Decision")
                {
                }
                column(InspectionNo_InspectionLines; "Inspection No")
                {
                }
                column(ItemNo_InspectionLines; "Item No")
                {
                }
                column(LineNo_InspectionLines; "Line No")
                {
                }
                column(QuantityOrdered_InspectionLines; "Quantity Ordered")
                {
                }
                column(QuantityReceived_InspectionLines; "Quantity Received")
                {
                }
                column(ReasonsforRejection_InspectionLines; "Reasons for Rejection")
                {
                }
                column(ReceivedQty_InspectionLines; "Received Qty")
                {
                }
                column(RejectedQuantity_InspectionLines; "Rejected Quantity")
                {
                }
                column(ReturnReasons_InspectionLines; "Return Reasons")
                {
                }
                column(SystemCreatedAt_InspectionLines; SystemCreatedAt)
                {
                }
                column(SystemCreatedBy_InspectionLines; SystemCreatedBy)
                {
                }
                column(SystemId_InspectionLines; SystemId)
                {
                }
                column(SystemModifiedAt_InspectionLines; SystemModifiedAt)
                {
                }
                column(SystemModifiedBy_InspectionLines; SystemModifiedBy)
                {
                }
                column(UnitofMeasure_InspectionLines; "Unit of Measure")
                {
                }
            }
            dataitem(IFSTenderCommitteeMember; "IFS Tender Committee Member")
            {
                DataItemLink = "Document No." = field("Commitee Appointment No");
                column(CommitteeType_IFSTenderCommitteeMember; "Committee Type")
                {
                }
                column(DateTimeNotified_IFSTenderCommitteeMember; "Date/Time Notified")
                {
                }
                column(Designation_IFSTenderCommitteeMember; Designation)
                {
                }
                column(Destination_IFSTenderCommitteeMember; Destination)
                {
                }
                column(DimensionSetID_IFSTenderCommitteeMember; "Dimension Set ID")
                {
                }
                column(DocumentNo_IFSTenderCommitteeMember; "Document No.")
                {
                }
                column(IDPassportNo_IFSTenderCommitteeMember; "ID/Passport No")
                {
                }
                column(IFSCode_IFSTenderCommitteeMember; "IFS Code")
                {
                }
                column(LineNo_IFSTenderCommitteeMember; "Line No")
                {
                }
                column(MemberEmail_IFSTenderCommitteeMember; "Member Email")
                {
                }
                column(MemberName_IFSTenderCommitteeMember; "Member Name")
                {
                }
                column(MemberNo_IFSTenderCommitteeMember; "Member No.")
                {
                }
                column(NoofDays_IFSTenderCommitteeMember; "No. of Days")
                {
                }
                column(NotifiedonEmail_IFSTenderCommitteeMember; "Notified on Email")
                {
                }
                column(Role_IFSTenderCommitteeMember; Role)
                {
                }
                column(ShortcutDimension1Code_IFSTenderCommitteeMember; "Shortcut Dimension 1 Code")
                {
                }
                column(ShortcutDimension2Code_IFSTenderCommitteeMember; "Shortcut Dimension 2 Code")
                {
                }
                column(Signature_IFSTenderCommitteeMember; Signature)
                {
                }
                column(StaffNo_IFSTenderCommitteeMember; "Staff  No.")
                {
                }
                column(SystemCreatedAt_IFSTenderCommitteeMember; SystemCreatedAt)
                {
                }
                column(SystemCreatedBy_IFSTenderCommitteeMember; SystemCreatedBy)
                {
                }
                column(SystemId_IFSTenderCommitteeMember; SystemId)
                {
                }
                column(SystemModifiedAt_IFSTenderCommitteeMember; SystemModifiedAt)
                {
                }
                column(SystemModifiedBy_IFSTenderCommitteeMember; SystemModifiedBy)
                {
                }
                column(TaxRegistrationPINNo_IFSTenderCommitteeMember; "Tax Registration (PIN) No.")
                {
                }
                column(TelephoneNo_IFSTenderCommitteeMember; "Telephone No.")
                {
                }
                column(TotalAmount_IFSTenderCommitteeMember; "Total Amount")
                {
                }
                column(Type_IFSTenderCommitteeMember; "Type")
                {
                }
                column(UnitAmount_IFSTenderCommitteeMember; "Unit Amount")
                {
                }
            }
            
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
     trigger OnInitReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;
     var
        ApprovalEntries: Record "Approval Entry";
        CompanyInfo: Record "Company Information";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        Approver1: array[10] of Code[50];
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
        UserSetup4: Record "User Setup";
        UserSetup5: Record "User Setup";
}
