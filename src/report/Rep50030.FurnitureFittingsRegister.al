report 50030 "Furniture & Fittings Register"
{
    ApplicationArea = All;
    Caption = 'Furniture & Fittings Register';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Furniture & Fittings Register.rdlc';

    dataset
    {
        dataitem("Fixed Asset"; "Fixed Asset")
        {

            column(Description_FixedAsset; Description)
            {
            }
            column(Financedby_FixedAsset; "Financed by")
            {
            }
            column(SerialNo_FixedAsset; "Serial No.")
            {
            }
            column(TagNo_FixedAsset; "Tag No")
            {
            }
            column(Make_FixedAsset; Make)
            {
            }
            column(Model_FixedAsset; Model)
            {
            }
            column(YearofPurchase_FixedAsset; "Year of Purchase")
            {
            }
            column(PVNumber_FixedAsset; "PV Number")
            {
            }
            column(MainLocation_FixedAsset; "Main Location")
            {
            }
            column(LocationCode_FixedAsset; "Location Code")
            {
            }
            column(ReplacementDate_FixedAsset; "Replacement Date")
            {
            }
            // column(Amount_FixedAsset; Amount)
            // {
            // }
            // column(AnnualDepreciation_FixedAsset; "Annual Depreciation")
            // {
            // }
            // column(AccumulatedDepreciation_FixedAsset; "Accumulated Depreciation")
            // {
            // }
            // column(NetBookValue_FixedAsset; "Net Book Value")
            // {
            // }
            // column(DateofDisposal_FixedAsset; "Date of Disposal")
            // {
            // }
            // column(DisposalValue_FixedAsset; "Disposal Value")
            // {
            // }
            column(ResponsibleEmployee_FixedAsset; "Responsible Employee")
            {
            }
            column(AssetCondition_FixedAsset; "Asset Condition")
            {
            }
            column(PresentLogbook_FixedAsset; "Present Logbook")
            {
            }
            column(Notes_FixedAsset; Notes)
            {
            }
            column(EmptyDate; EmptyDate)
            {
            }
            dataitem("FA Depreciation Book"; "FA Depreciation Book")
            {
                DataItemLink = "FA No." = field("No.");
                column(AcquisitionDate_FADepreciationBook; "Acquisition Date")
                {
                }
                column(AcquisitionCost_FADepreciationBook; "Acquisition Cost")
                {
                }
                column(Appreciation_FADepreciationBook; Appreciation)
                {
                }
                column(BookValue_FADepreciationBook; "Book Value")
                {
                }
                column(Depreciation_FADepreciationBook; Depreciation)
                {
                }
                column(StraightLine_FADepreciationBook; "Straight-Line %")
                {
                }
                column(ProceedsonDisposal_FADepreciationBook; "Proceeds on Disposal")
                {
                }
                column(DecliningBalance_FADepreciationBook; "Declining-Balance %")
                {
                }
                column(DisposalDate_FADepreciationBook; "Disposal Date")
                {
                }
                column(NilDispDat; NilDispDat)
                {
                }
                column(NilDispAmt; NilDispAmt)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if "Disposal Date" = 0D then begin
                        NilDispDat := 'N/A';
                    end;
                    if "Proceeds on Disposal" = 0 then begin
                        NilDispAmt := 'N/A';
                    end;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if "Replacement Date" = 0D then begin
                    EmptyDate := 'N/A';
                end;
                if "PV Number" = '' then begin
                    "PV Number" := 'N/A';
                end;
                if "Tag No" = '' then begin
                    "Tag No" := 'N/A';
                end
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

    var
        EmptyDate: Text;
        NilDispDat: Text;
        NilDispAmt: Text;
}
