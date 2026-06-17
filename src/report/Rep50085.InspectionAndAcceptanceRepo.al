namespace KICD.KICD;
using Microsoft.Purchases.Document;
using Microsoft.Foundation.Company;
using System.Security.User;
using System.Automation;

report 50085 "Inspection And Acceptance Repo"
{
    ApplicationArea = All;
    Caption = 'Inspection And Acceptance Report';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Inspection And Acceptance Report.rdlc';
    UsageCategory = ReportsAndAnalysis;
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
            column(CompanyCity; CompanyInfo.City)
            {
            }
            column(CompanyPhone; CompanyInfo."Phone No.")
            {
            }
            column(CompanyFax; CompanyInfo."Fax No.")
            {
            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyWebsite; CompanyInfo."Home Page")
            {
            }
            column(InspectionNo; "Inspection No")
            {
            }
            column(ContractOrderNo; "Contract/Order No")
            {
            }
            column(CommiteeAppointmentNo; "Commitee Appointment No")
            {
            }
            column(InspectionDate; "Inspection Date")
            {
            }
            column(SupplierName; "Supplier Name")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(Status; Status)
            {
            }
            column(Amount; Amount)
            {
            }
            column(AmountInvoiced; "Amount Invoiced")
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
            column(Description; Description)
            {
            }
            column(GeneralCommitteRemarks; "General Committe Remarks")
            {
            }
            column(ResponsibilityCenter; "Responsibility Center")
            {
            }
            column(ClauseNo; "Clause No.")
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
            column(ApprovedPurchaseRequisition_InspectionHeader1; "Approved Purchase Requisition")
            {
            }
            column(DeliveryNote_InspectionHeader1; "Delivery Note")
            {
            }
            column(ETRReceipt_InspectionHeader1; "ETR Receipt")
            {
            }
            column(Invoice_InspectionHeader1; Invoice)
            {
            }
            column(LPO_InspectionHeader1; LPO)
            {
            }
            column(DeliveryNoteDate_InspectionHeader1; "Delivery Note Date")
            {
            }
            column(ETRReceiptDate_InspectionHeader1; "ETR Receipt Date")
            {
            }
            dataitem(InspectionLines1; "Inspection Lines1")
            {
                DataItemLink = "Inspection No" = field("Inspection No");
                DataItemTableView = SORTING("Inspection No","Line No");
                column(Inspection_No; InspectionLines1."Inspection No")
                {
                }
                column(Description_InspectionLines1; InspectionLines1.Description)
                {
                }
                column(InspectionDecision_InspectionLines1; InspectionLines1."Inspection Decision")
                {
                }
                column(ItemNo_InspectionLines1; InspectionLines1."Item No")
                {
                }
                column(LineNo_InspectionLines1; InspectionLines1."Line No")
                {
                }
                column(QuantityOrdered_InspectionLines1; InspectionLines1."Quantity Ordered")
                {
                }
                column(QuantityReceived_InspectionLines1; InspectionLines1."Quantity Received")
                {
                }
                column(ReasonsforRejection_InspectionLines1; InspectionLines1."Reasons for Rejection")
                {
                }
                column(ReceivedQty_InspectionLines1; InspectionLines1."Received Qty")
                {
                }
                column(RejectedQuantity_InspectionLines1; InspectionLines1."Rejected Quantity")
                {
                }
                column(ReturnReasons_InspectionLines1; InspectionLines1."Return Reasons")
                {
                }
                column(UnitofMeasure_InspectionLines1; InspectionLines1."Unit of Measure")
                {
                }
            }
            dataitem(IFSTenderCommitteeMember; "IFS Tender Committee Member")
            {
                DataItemLink = "Document No." = field("Commitee Appointment No");
                DataItemTableView = SORTING("Document No.","Member No.");
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
                column(Designation_IFSTenderCommitteeMember; Designation)
                {
                }
                column(Role_IFSTenderCommitteeMember; Role)
                {
                }
                column(StaffNo_IFSTenderCommitteeMember; "Staff  No.")
                {
                }
                column(Signature_IFSTenderCommitteeMember; Signature)
                {
                }
            }
            dataitem(PurchaseRequisition; "Purchase Header")
            {
                DataItemLink = "No." = field("Approved Purchase Requisition");

                column(Datereceived_PurchaseRequisition; "Date received")
                {
                }
            }
            dataitem(LPO; "Purchase Header")
            {
                DataItemLink = "No." = field(LPO);

                column(Datereceived_LPO; "Date received")
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
