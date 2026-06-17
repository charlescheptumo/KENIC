namespace KICD.KICD;
using Microsoft.Foundation.Company;
using Microsoft.Inventory.Location;
using System.Security.User;
using System.Automation;
using Microsoft.Foundation.Address;

report 50077 "Return to Stores Note"
{
    // ApplicationArea = Basic;
    Caption = 'Return to Stores Note';
    // UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Return Stores Note.rdlc';
    ApplicationArea = Basic;

    dataset
    {
        dataitem(StoreReturnsHeader; "Store Returns Header")
        {
            RequestFilterFields = "No.", "Requestor No.";
            column(No; "No.")
            {
            }
            column(RequestorID; "Requestor ID")
            {
            }
            column(RequestorNo; "Requestor No.")
            {
            }
            column(RequestorName; "Requestor Name")
            {
            }
            column(DepartmentCode; "Department Code")
            {
            }
            column(DepartmentName; "Department Name")
            {
            }
            column(Description; Description)
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(ReturnDate; "Return Date")
            {
            }
            column(Recommendations; Recommendations)
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
            dataitem(StoreReturnsLines; "Store Returns Lines")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLinkReference = StoreReturnsHeader;
                column(Document_No_StoreReturnsLines; "Document No.")
                {

                }
                column(No_StoreReturnsLines; "No.")
                {

                }
                column(Description_StoreReturnsLines; Description)
                {

                }
                column(Serial_No_StoreReturnsLines; "Serial No.")
                {

                }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                {

                }
                column(Current_Status; "Current Status")
                {

                }
                column(Estimated_Residual_Value; "Estimated Residual Value")
                {

                }
                column(Estimated_Residual_Amount; "Estimated Residual Amount")
                {

                }
                column(Amount_StoreReturnsLines; Amount)
                {

                }
                column(Direct_Unit_Cost; "Direct Unit Cost")
                {

                }
                column(Recommendations_StoreReturnsLines; Recommendations)
                {

                }
                column(Quantity; Quantity)
                {

                }
            }

            trigger OnAfterGetRecord()
            begin
                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 50103);
                ApprovalEntries.SetRange("Document No.", StoreReturnsHeader."No.");
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
}
