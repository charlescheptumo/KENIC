report 50044 "Handing Over Report"
{
    ApplicationArea = All;
    Caption = 'Handing Over Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Layouts/Handing Over Report.rdlc';
    dataset
    {
        dataitem("Staff Exit"; "Staff Exit")
        {
            RequestFilterFields = "No.";

            column(FullName; FullName)
            {
            }
            column(DateOfLeaving_Employee; "Date Of Leaving")
            {
            }
            column(CompInfo_Logo; CompInfo.Picture)
            {
            }

            dataitem(Item; Item)
            {
                DataItemLink = "Responsible Employee" = field("Employee No.");

                column(No_Item; Item."No.")
                {
                }
                column(Description_Item; Item.Description)
                {
                }
                column(Quantity_Item; Item.Quantity)
                {
                }
                column(BrandCode_Item; Item."Item Brand Code")
                {
                }
                column(BrandDesc_Item; Item."Item Brand Description")
                {
                }
                column(SerialNos_Item; Item."Serial Nos.")
                {
                }
                column(Remarks; Remarks)
                {
                }
            }
            dataitem("Fixed Asset"; "Fixed Asset")
            {
                DataItemLink = "Responsible Employee" = field("Employee No.");
                column(No_FixedAsset; "No.")
                {
                }
                column(Description_FixedAsset; Description)
                {
                }
                column(SerialNo_FixedAsset; "Serial No.")
                {
                }
                column(FixedAssetType_FixedAsset; "Fixed Asset Type")
                {
                }
                column(Quantity_FixedAsset; "FA Quantity")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    "FA Quantity" := 1;
                end;

                trigger OnPreDataItem()
                begin
                    "FA Quantity" := 1;
                end;
            }
            dataitem(Integer; Integer)
            {
                column(Number_Integer; Number)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                FullName := "Staff Exit"."First Name" + ' ' + "Staff Exit"."Last Name";
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
    var
        CompInfo: Record "Company Information";
    begin
        CompInfo.Get();
        CompInfo.CalcFields(CompInfo.Picture);
    end;

    trigger OnInitReport()
    var
        CompInfo: Record "Company Information";
    begin
        CompInfo.Get();
        CompInfo.CalcFields(CompInfo.Picture);
    end;

    var
        Remarks: Text;
        "FA Quantity": Integer;
        CompInfo: Record "Company Information";
        FullName: Text;
}
