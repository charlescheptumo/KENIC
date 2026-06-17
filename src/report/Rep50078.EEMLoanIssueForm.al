namespace KICD.KICD;

using Microsoft.Purchases.Document;
using Microsoft.Foundation.Company;
using Microsoft.Inventory.Location;
using System.Security.User;
using System.Automation;
using Microsoft.Inventory.Item;
using Microsoft.Foundation.Address;

report 50078 "EEM Loan Issue Form"
{
    Caption = 'EEM Loan Issue Form';
    // UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/EEM Loan Issue Form.rdlc';
    ApplicationArea = Basic;

    dataset
    {
        dataitem(PurchaseHeader; "Purchase Header")
        {
            RequestFilterFields = "No.";
            DataItemTableView = where("Document Type" = filter("Loan Issue Requisition" | "Loan Issue Surrender"));

            column(No; "No.")
            {
            }
            column(DocumentType; "Document Type")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(CustomerNo; "Customer No.")
            {
            }
            column(CustomerName; "Customer Name")
            {
            }
            column(CustomerName2_PurchaseHeader; "Customer Name2")
            {
            }
            column(CustomerPhone; "Customer Phone")
            {
            }
            column(CustomerPhone2; "Customer Phone2")
            {
            }
            column(CustomerEMail; "Customer EMail")
            {
            }
            column(Description; Description)
            {
            }
            column(Duration; "Duration")
            {
            }
            column(StartDate; "Start Date")
            {
            }
            column(EndDate; "End Date")
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
            column(PostingDate; "Posting Date")
            {
            }
            column(IssueDate; "Issue Date")
            {
            }
            column(FullyIssued; "Fully Issued")
            {
            }
            column(PartiallyIssued; "Partially Issued")
            {
            }
            column(ReturnDate; "Return Date")
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
            column(RequesterSignature;UserSetup4.Picture)
            {

            }
            column(Posted_By;"Posted By")
            {

            }
            column(Issue_Date;"Issue Date")
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
                column(SerialNo;SerialNo)
                {

                }
                column(Model;Model)
                {

                }
                trigger OnAfterGetRecord()
                var
                Item : Record Item;
                begin
                    If Item.Get("No.")then Begin
                    SerialNo := Item."Serial No";
                    Model := Item.Model;
                    End
                    
                end;
            }

            trigger OnAfterGetRecord()
            begin
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

                //Borrowers Signature
                If UserSetup4.Get("Requester ID")then
                   UserSetup4.CalcFields(Picture);
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
        UserSetup4: Record "User Setup";
        i: Integer;
        Model: Text[100];
        SerialNo:Text[100];

}
