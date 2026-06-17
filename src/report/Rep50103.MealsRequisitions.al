namespace KICD.KICD;

using Microsoft.Purchases.Document;
using Microsoft.HumanResources.Employee;
using Microsoft.Foundation.Company;
using System.Security.User;
using System.Automation;

report 50103 "Meals Requisitions"
{
    ApplicationArea = All;
    Caption = 'Meals Requisitions';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Meals Reqs.rdlc';
    dataset
    {
        dataitem(PurchaseHeader; "Purchase Header")
        {
            DataItemTableView = Where("Document Type" = Const("Meals Requisition"));
            RequestFilterFields = "No.";
            column(compname; CompanyInf.Name)
            {
            }
            column(logo; CompanyInf.Picture)
            {
            }
            column(Address; CompanyInf.Address)
            {

            }
            column(PostCode; CompanyInf."Post Code")
            {

            }
            column(City; CompanyInf.City)
            {

            }
            column(ActualNoofPeople_PurchaseHeader; "Actual No. of People")
            {
            }
            column(ExpectedNoofPeople_PurchaseHeader; "Expected No. of People")
            {
            }
            column(NameoftheConference_PurchaseHeader; "Name of the Conference")
            {
            }
            column(LocationCode_PurchaseHeader; "Location Code")
            {
            }
            column(Date_PurchaseHeader; "Date")
            {
            }
            column(Time_PurchaseHeader; "Time")
            {
            }
            column(No_PurchaseHeader; "No.")
            {
            }
            column(RequestByName_PurchaseHeader; "Request-By Name")
            {
            }
            column(RequisitionOfficer; UserSetup."Employee Name")
            {
            }
            column(DateRequisitionOfficer; ApproverDate[1])
            {
            }
            column(RequisitionOfficer_Signature; UserSetup.Picture)
            {
            }
            column(AuthorisingOfficer; UserSetup2."Employee Name")
            {
            }
            column(DateAuthorisingOfficer; ApproverDate[2])
            {
            }
            column(AuthorisingOfficer_Signature; UserSetup2.Picture)
            {
            }
            column(IssuedBy; UserSetup3."Employee Name")
            {
            }
            column(DateIssuedBy; ApproverDate[3])
            {
            }
            column(IssuedBy_Signature; UserSetup3.Picture)
            {
            }
            column(AuthorizedBy; UserSetup1."Employee Name")
            {
            }
            column(DateAuthorizedBy; ApproverDate[2])
            {
            }
            column(AuthorizedBy_Signature; UserSetup1.Picture)
            {
            }
            column(Designation; Designation)
            {
            }
            column(CostCenter; "Shortcut Dimension 1 Code")
            {
            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = where("Document Type" = const("Meals Requisition"));
                column(VoteItem_PurchaseLine; "Vote Item")
                {
                }
                column(FundsAvailable_PurchaseLine; "Funds Available")
                {
                }
            }
            dataitem("Meals Subform"; "Meals Subform")
            {
                DataItemLink = "Document No." = field("No.");

                column(DocumentNo_MealsSubform; "Document No.")
                {
                }
                column(Cost_MealsSubform; Cost)
                {
                }
                column(MealsType_MealsSubform; "Meal Type Code")
                {
                }
                column(Description; Description)
                {
                }
                column(Amount; Amount)
                {
                }
            }
            trigger OnAfterGetRecord()
            var
            begin
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 38);
                ApprovalEntries.SetRange("Document No.", PurchaseHeader."No.");
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            Approver1[1] := ApprovalEntries."Sender ID";
                            ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                            if UserSetup.Get(Approver1[1]) then begin
                                UserSetup.CalcFields(Picture);

                                ENo := UserSetup."Employee No.";
                                if Emp.Get(ENo) then
                                    DesignationID := Emp."Job ID";
                                JOBID.Reset;
                                JOBID.SetRange("Job Id", DesignationID);
                                if JOBID.FindSet then
                                    Designation := JOBID."Task No";

                            end;
                            Approver1[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup1.Get(Approver1[2]) then begin
                                UserSetup1.CalcFields(Picture);
                                ENo := UserSetup1."Employee No.";
                                if Emp.Get(ENo) then
                                    DesignationID := Emp."Job ID";
                                JOBID.Reset;
                                JOBID.SetRange("Job Id", DesignationID);
                                if JOBID.FindSet then
                                    Designation := JOBID."Task No";
                            end;
                        end;
                        if i = 2 then begin
                            Approver1[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver1[3]) then begin
                                UserSetup2.CalcFields(Picture);
                                ENo := UserSetup2."Employee No.";
                                if Emp.Get(ENo) then
                                    DesignationID := Emp."Job ID";
                                JOBID.Reset;
                                JOBID.SetRange("Job Id", DesignationID);
                                if JOBID.FindSet then
                                    Designation := JOBID."Task No";
                            end;
                        end;
                        if i = 3 then begin
                            Approver1[4] := ApprovalEntries."Approver ID";
                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(Approver1[4]) then begin
                                UserSetup3.CalcFields(Picture);
                                ENo := UserSetup3."Employee No.";
                                if Emp.Get(ENo) then
                                    DesignationID := Emp."Job ID";
                                JOBID.Reset;
                                JOBID.SetRange("Job Id", DesignationID);
                                if JOBID.FindSet then
                                    Designation := JOBID."Task No";
                            end;
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

    }

    trigger OnPreReport()
    var
    begin
        CompanyInf.Get;
        CompanyInf.CalcFields(Picture);
    end;

    Var
        ApprovalEntries: Record "Approval Entry";
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        UserSetup4: Record "User Setup";
        i: Integer;
        Emp: Record Employee;
        DesignationID: Code[50];
        USetup: Record "User Setup";
        ENo: Code[10];
        Designation: Code[50];
        JOBID: Record "ManPower Planning Lines";
        Approver1: array[10] of Code[50];
        QuantityIssued: Decimal;
        CompanyInf: Record "Company Information";

}