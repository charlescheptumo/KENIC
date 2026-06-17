/// <summary>
/// Report Purchase Requisition Report (ID 50059).
/// </summary>
report 50059 "Purchase Requisition Report"
{
    ApplicationArea = All;
    Caption = 'Purchase Requisition Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Purchase Requisition 2.rdlc';

    dataset
    {
        dataitem(PurchaseHeader; "Purchase Header")
        {
            DataItemTableView = where("Document Type" = filter("Purchase Requisition"));

            column(No; "No.")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(OrderDate; "Order Date")
            {
            }
            column(ShortcutDimension1Code; "Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code; "Shortcut Dimension 2 Code")
            {
            }
            column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
            {
            }
            column(Description; Description)
            {
            }
            column(DocumentType; "Document Type")
            {
            }
            column(PRNType; "PRN Type")
            {
            }
            column(Amount; Amount)
            {
            }
            column(DocumentStatus; "Document Status")
            {
            }
            column(Status; Status)
            {
            }
            column(CompanyLogo; CompInfo.Picture)
            {
            }
            column(CompanyName; CompInfo.Name)
            {
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
        CompInfo.Get();
        CompInfo.CalcFields(CompInfo.Picture);
    end;

    trigger OnPreReport()
    begin
        CompInfo.Get;
        CompInfo.CalcFields(CompInfo.Picture);
    end;

    var
        CompInfo: Record "Company Information";
}
