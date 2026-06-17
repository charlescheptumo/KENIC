namespace KICD.KICD;

using Microsoft.FixedAssets.FixedAsset;
using Microsoft.FixedAssets.Depreciation;
using Microsoft.Foundation.Company;
using Microsoft.Foundation.Address;
using Microsoft.Inventory.Location;

report 50133 "Fixed Asset Report"
{
    Caption = 'Fixed Asset Report';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Fixed Asset Register.rdlc';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(FixedAsset; "Fixed Asset")
        {
            DataItemTableView = sorting("No.") where(Blocked = const(false), Inactive = const(false));

            column(FA_Number; "No.")
            {
            }
            column(FA_Description; Description)
            {
            }
            column(FA_LocationCode; "FA Location Code")
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
            column(ReportStartDate; StartDate)
            {
            }
            column(ReportEndDate; EndDate)
            {
            }
            column(AcquisitionCostAmt; AcquisitionCostAmt)
            {
            }
            column(DepreciationForYearAmt; DepreciationForYearAmt)
            {
            }
            column(AccumulatedDepreciationAmt; AccumulatedDepreciationAmt)
            {
            }
            column(NetBookValueAmt; NetBookValueAmt)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if not CompanyPictureLoaded then begin
                    CompanyInformation.Get();
                    CompanyInformation.CalcFields(Picture);
                    CompanyPictureLoaded := true;
                end else
                    Clear(CompanyInformation.Picture);

                AcquisitionCostAmt := 0;
                DepreciationForYearAmt := 0;
                AccumulatedDepreciationAmt := 0;
                NetBookValueAmt := 0;

                FADeprBook.Reset();
                FADeprBook.SetRange("FA No.", "No.");
                if DeprBookCodeFilter <> '' then
                    FADeprBook.SetRange("Depreciation Book Code", DeprBookCodeFilter);
                if FADeprBook.FindFirst() then begin
                    // FADeprBook.SetRange("FA Posting Date Filter", 0D, EndDate);
                    FADeprBook.SetFilter("FA Posting Date Filter", '..%1', EndDate);
                    FADeprBook.CalcFields("Acquisition Cost", Depreciation);
                    AcquisitionCostAmt := FADeprBook."Acquisition Cost";
                    AccumulatedDepreciationAmt := -FADeprBook.Depreciation;
                    FADeprBook.SetRange("FA Posting Date Filter");

                    // FADeprBook.SetRange("FA Posting Date Filter", StartDate, EndDate);
                    FADeprBook.SetFilter("FA Posting Date Filter", '%1..%2', StartDate, EndDate);
                    FADeprBook.CalcFields(Depreciation);
                    DepreciationForYearAmt := -FADeprBook.Depreciation;
                    FADeprBook.SetRange("FA Posting Date Filter");

                    NetBookValueAmt := AcquisitionCostAmt - AccumulatedDepreciationAmt;
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
                group(Options)
                {
                    Caption = 'Options';
                    field(StartDateField; StartDate)
                    {
                        ApplicationArea = All;
                        Caption = 'Start Date';
                        ToolTip = 'Specifies the start date of the depreciation period for the year.';
                    }
                    field(EndDateField; EndDate)
                    {
                        ApplicationArea = All;
                        Caption = 'End Date';
                        ToolTip = 'Specifies the end date of the depreciation period for the year.';
                    }
                    field(DeprBookCodeField; DeprBookCodeFilter)
                    {
                        ApplicationArea = All;
                        Caption = 'Depreciation Book Code';
                        TableRelation = "Depreciation Book";
                        ToolTip = 'Specifies the depreciation book to report on.';
                    }
                }
            }
        }

        trigger OnOpenPage()
        begin
            if EndDate = 0D then
                EndDate := CalcDate('<CY>', Today);
            if StartDate = 0D then
                StartDate := CalcDate('<-CY>', EndDate);
        end;
    }

    trigger OnPreReport()
    begin
        CompanyInformation.Get();
        FormatAddr.GetCompanyAddr('', ResponsibilityCenter, CompanyInformation, CompanyAddr);
    end;

    var
        FADeprBook: Record "FA Depreciation Book";
        CompanyInformation: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: array[8] of Text[100];
        ResponsibilityCenter: Record "Responsibility Center";
        StartDate: Date;
        EndDate: Date;
        DeprBookCodeFilter: Code[10];
        AcquisitionCostAmt: Decimal;
        DepreciationForYearAmt: Decimal;
        AccumulatedDepreciationAmt: Decimal;
        NetBookValueAmt: Decimal;
        CompanyPictureLoaded: Boolean;
}
