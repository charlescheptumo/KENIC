namespace KICD.KICD;

using Microsoft.Purchases.Document;
using Microsoft.Foundation.Company;
using Microsoft.Purchases.Vendor;
using Microsoft.Inventory.Location;
using System.Security.User;
using System.Automation;
using Microsoft.Foundation.Address;
using Microsoft.Sales.Document;
using Microsoft.Inventory.Item;
using Microsoft.HumanResources.Employee;
using Microsoft.Purchases.Setup;
using System.Environment.Configuration;
using System.Utilities;
using Microsoft.Finance.Dimension;
using Microsoft.Inventory.Setup;
using Microsoft.Finance.Currency;
using Microsoft.Utilities;
using Microsoft.Foundation.Navigate;
using Microsoft.Foundation.ExtendedText;
using Microsoft.Inventory.Availability;
using Microsoft.Purchases.Pricing;

report 50079 "Goods Rejection Note"
{
    ApplicationArea = All;
    Caption = 'Return Stores Note';
    // UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Goods Rejection Note.rdlc';

    dataset
    {
        dataitem(PurchaseHeader; "Purchase Header")
        {
            RequestFilterFields = "No.";
            DataItemTableView = where("Document Type" = filter("Item Rejection"));

            column(No; "No.")
            {
            }
            column(DocumentType; "Document Type")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(Description; Description)
            {
            }
            column(ReturnDate; "Return Date")
            {
            }
            column(RequesterID; "Requester ID")
            {
            }
            column(RequestByNo; "Request-By No.")
            {
            }
            column(RequestByName; "Request-By Name")
            {
            }
            column(DepartmentCode; "Department Code")
            {
            }
            column(DepartmentName; "Department Name")
            {
            }
            column(LocationCode; "Location Code")
            {
            }
            column(Amount; Amount)
            {
            }
            column(AmountIncludingVAT; "Amount Including VAT")
            {
            }
            column(BuyfromVendorNo; "Buy-from Vendor No.")
            {
            }
            column(BuyfromVendorName; "Buy-from Vendor Name")
            {
            }
            column(BuyfromVendorName2; "Buy-from Vendor Name 2")
            {
            }
            column(PaytoVendorNo; "Pay-to Vendor No.")
            {
            }
            column(Location_Code; "Location Code")
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
            column(PreparedBy; UserSetup."Employee Name")
            {
            }
            column(DatePrepared; ApproverDate[1])
            {
            }
            column(PreparedBy_Signature; UserSetup.Picture)
            {
            }
            column(ExaminedBy; UserSetup1."Employee Name")
            {
            }
            column(DateExamined; ApproverDate[2])
            {
            }
            column(ExaminedBy_Signature; UserSetup1.Picture)
            {
            }
            column(VBC; UserSetup2."Employee Name")
            {
            }
            column(VBCDate; ApproverDate[3])
            {
            }
            column(VBC_Signature; UserSetup2.Picture)
            {
            }
            column(Authorizer; UserSetup3."Employee Name")
            {
            }
            column(DateAuthorized; ApproverDate[4])
            {
            }
            column(Authorizer_Signature; UserSetup3.Picture)
            {
            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = field("No."), "Document Type" = field("Document Type");
                DataItemLinkReference = PurchaseHeader;
                DataItemTableView = sorting("Document Type", "Document No.", "Line No.");

                column(Document_No_; "Document No.")
                {
                }
                column(Document_Type; "Document Type")
                {
                }
                column(Type; Type)
                {
                }
                column(No_PurchaseLine; "No.")
                {
                }
                column(Description_PurchaseLine; Description)
                {
                }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(Quantity__issued; "Quantity  issued")
                {
                }
                column(Quantity_To__Issue; "Quantity To  Issue")
                {
                }
                column(Remaining_Quantity; "Remaining Quantity")
                {
                }
                column(Quantity_Returned; "Quantity Returned")
                {
                }
                column(Qty_Approved; "Qty Approved")
                {
                }
                column(Unit_Price__LCY_; "Unit Price (LCY)")
                {
                }
                column(Line_Amount; "Line Amount")
                {
                }
                column(Direct_Unit_Cost; "Direct Unit Cost")
                {
                }
                column(Direct_Unit_Cost_Inc__VAT; "Direct Unit Cost Inc. VAT")
                {
                }
                column(Gen__Bus__Posting_Group; "Gen. Bus. Posting Group")
                {
                }
                column(Gen__Prod__Posting_Group; "Gen. Prod. Posting Group")
                {
                }
                column(VAT_Bus__Posting_Group; "VAT Bus. Posting Group")
                {
                }
                column(Location_Code_PurchaseLine; "Location Code")
                {
                }
                column(Total_Amount_Excl_VAT; TotalPurchaseLine.Amount)
                {
                }
                column(VATAmount; VATAmount)
                {
                }
                column(Total_Amount_Incl_VAT; TotalPurchaseLine."Amount Including VAT")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    GetTotalsPurchaseHeader;
                    CalculateTotals;
                end;
            }
            dataitem(Vendor; Vendor)
            {
                DataItemLink = "No." = field("Buy-from Vendor No.");
                DataItemLinkReference = PurchaseHeader;
                DataItemTableView = sorting("No.");

                column(No_Vendor; "No.")
                {
                }
                column(Name_Vendor; Name)
                {
                }
                column(Name_2_Vendor; "Name 2")
                {
                }
                column(Address_Vendor; Address)
                {
                }
                column(Address_2_Vendor; "Address 2")
                {
                }
                column(City_Vendor; City)
                {
                }
                column(Contact_Vendor; Contact)
                {
                }
                column(Phone_No_Vendor; "Phone No.")
                {
                }
                column(VAT_Registration_No_; "VAT Registration No.")
                {
                }
                column(Email_Vendor; "E-Mail")
                {
                }
                column(Postal_Code_Vendor; "Post Code")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                GetTotalsPurchaseHeader;
                CalculateTotals;

                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 38);
                ApprovalEntries.SetRange("Document No.", PurchaseHeader."No.");
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            WFApprover[1] := ApprovalEntries."Sender ID";
                            ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                            if UserSetup.Get(WFApprover[1]) then
                                UserSetup.CalcFields(Picture);

                            WFApprover[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup1.Get(WFApprover[2]) then
                                UserSetup1.CalcFields(Picture);
                        end;
                        if i = 2 then begin
                            WFApprover[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(WFApprover[3]) then
                                UserSetup2.CalcFields(Picture);
                        end;
                        if i = 3 then begin
                            WFApprover[4] := ApprovalEntries."Approver ID";
                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(WFApprover[4]) then
                                UserSetup3.CalcFields(Picture);
                        end;
                    until
                   ApprovalEntries.Next = 0;

                end;
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

    trigger OnPreReport()
    begin
        CompanyInformation.get();
        CompanyInformation.CalcFields(Picture);
        FormatAddr.GetCompanyAddr('', ResponsibilityCenter, CompanyInformation, CompanyAddr);
    end;

    var
        CompanyInformation: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: array[8] of Text[100];
        ResponsibilityCenter: Record "Responsibility Center";
        ApprovalEntries: Record "Approval Entry";
        WFApprover: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
        DocumentTotals: Codeunit "Document Totals";
        SuppressTotals: Boolean;
        TotalPurchaseHeader: Record "Purchase Header";
        Currency: Record Currency;
        TotalPurchaseLine: Record "Purchase Line";
        VATAmount: Decimal;
        InvoiceDiscountPct: Decimal;
        InvoiceDiscountAmount: Decimal;

    local procedure GetTotalsPurchaseHeader()
    begin
        DocumentTotals.GetTotalPurchaseHeaderAndCurrency("Purchase Line", TotalPurchaseHeader, Currency);
    end;

    procedure CalculateTotals()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCalculateTotals("Purchase Line", SuppressTotals, DocumentTotals, IsHandled);
        if IsHandled then
            exit;

        DocumentTotals.CalculatePurchaseSubPageTotals(
          TotalPurchaseHeader, TotalPurchaseLine, VATAmount, InvoiceDiscountAmount, InvoiceDiscountPct);
        DocumentTotals.RefreshPurchaseLine("Purchase Line");
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCalculateTotals(var PurchLine: Record "Purchase Line"; SuppressTotals: Boolean; var DocumentTotals: Codeunit "Document Totals"; var IsHandled: Boolean)
    begin
    end;
}
