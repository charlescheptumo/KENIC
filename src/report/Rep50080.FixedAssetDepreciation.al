namespace KICD.KICD;

using Microsoft.FixedAssets.FixedAsset;
using Microsoft.FixedAssets.Depreciation;
using Microsoft.Foundation.Company;
using Microsoft.Inventory.Location;
using Microsoft.Foundation.Address;

report 50080 "Fixed Asset Depreciation"
{
    // ApplicationArea = All;
    Caption = 'Fixed Asset Depreciation';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Fixed Asset Depreciation.rdlc';
    ApplicationArea = All;
     UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem("FA Depreciation Book"; "FA Depreciation Book")
        {

            column(FA_No_; "FA No.")
            {
            }
            column(Depreciation_Book_Code; "Depreciation Book Code")
            {
            }
            column(Depreciation_Method; "Depreciation Method")
            {
            }
            column(Depreciation_Starting_Date; "Depreciation Starting Date")
            {
            }
            column(Depreciation_Ending_Date; "Depreciation Ending Date")
            {
            }
            column(Book_Value; "Book Value")
            {
            }
            column(Depreciation_Table_Code; "Depreciation Table Code")
            {
            }
            column(No__of_Depreciation_Years; "No. of Depreciation Years")
            {
            }
            column(No__of_Depreciation_Months; "No. of Depreciation Months")
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
            dataitem(FixedAsset; "Fixed Asset")
            {
                DataItemLink = "No." = field("FA No.");
                DataItemTableView = sorting("No.");
                column(No; "No.")
                {
                }
                column(Description; Description)
                {
                }
                column(SerialNo; "Serial No.")
                {
                }
                column(ResponsibleEmployee; "Responsible Employee")
                {
                }
                column(LocationCode; "Location Code")
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
}
