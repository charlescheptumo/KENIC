namespace KICD.KICD;

using Microsoft.Inventory.Item;
using Microsoft.Inventory.Location;
using Microsoft.Foundation.Address;
using Microsoft.Foundation.Company;
using System.Security.User;
using Microsoft.Purchases.Document;

report 50134 InventoryUsage
{
    ApplicationArea = All;
    Caption = 'Inventory Usage';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/InventoryUsage.rdlc';
    dataset
    {
        dataitem(Item; Item)
        {
            PrintOnlyIfDetail = true;
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
            column(ItemNo_; "No.")
            {

            }
            column(ItemName; Description)
            {

            }
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "No." = field("No.");
                PrintOnlyIfDetail = true;
                column(Quantity__issued; "Quantity  issued")
                {

                }
                dataitem(PurchaseHeader; "Purchase Header")
                {
                    DataItemLink = "No." = field("Document No.");
                    column(No_; "No.")
                    {

                    }
                    column(Description; Description)
                    {

                    }
                    column(Request_By_Name; "Request-By Name")
                    {

                    }
                    column(Location_Code; "Location Code")
                    {

                    }
                    column(Department_Code; "Department Code")
                    {

                    }
                    column(Directorate_Code; "Directorate Code")
                    {

                    }
                    column(DepartmentName;DepartmentName)
                    {

                    }
                    trigger OnAfterGetRecord()
                    begin
                        if ResponsibilityCenter.Get("Department Code") then
                        DepartmentName := ResponsibilityCenter.Name;
                    end;
                    trigger OnPreDataItem()
                    begin
                        SetRange("Document Type", "Document Type"::"Store Requisition");
                       // SetRange("Fully Issued", true);
                        SetRange(Status, Status::Released);
                        SetFilter("Posting Date", '<>%1', 0D);
                        if (StartDate <> 0D) and (EndDate <> 0D)  then BEGIN
                             SetRange("Posting Date",StartDate,EndDate);
                        END;
                        if (StartDate = 0D) and (EndDate <> 0D)  then BEGIN
                             Setfilter("Posting Date",'..%1',EndDate);
                        END;
                        if (StartDate <> 0D) and (EndDate = 0D)  then BEGIN
                             Setfilter("Posting Date",'%1..',StartDate);
                        END;
                       
                    end;
                }
                trigger OnPreDataItem()
                begin
                    SetRange("Document Type", "Document Type"::"Store Requisition");
                    Setfilter("Quantity  issued",'<>%1',0);
                end;

            }
        }

    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Filters)
                {
                    field("Start Date";StartDate)
                    {
                        ApplicationArea =All;
                    }
                       field("End Date";EndDate)
                    {
                        ApplicationArea =All;
                    }
                }
            }
        }
       
    }
    trigger OnPreReport()
    var
        UserSetup: Record "User Setup";
    begin
        if CompanyInfo.get() then begin
            CompanyInfo.CalcFields(Picture);
            FormatAddr.GetCompanyAddr(UserSetup."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        end;
    end;

    var
        ResponsibilityCenter: Record "Responsibility Center";
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RespCenter: Record "Responsibility Center";
        UserSetup: Record "User Setup";
        DepartmentName: Text;
        StartDate: Date;
        EndDate: Date;
}
