pageextension 58120 "Acc RoleCenter Ext" extends "Accountant Role Center"
{
    actions
    {

        addafter("Registry Data Integration")
        {
            group("Manual Domain Transactions")
            {
                Caption = 'Manual Domain Transactions';
                ToolTip = 'Manage manual domain sales invoices, receipts, and credit memos.';

                action("Sales Invoices")
                {
                    ApplicationArea = All;
                    Caption = 'Sales Invoices';
                    ToolTip = 'Open the Sales Invoices page.';
                    RunObject = page "Sales Invoice List";
                }
                action("Receipts")
                {
                    ApplicationArea = All;
                    Caption = 'Receipts List';
                    ToolTip = 'Open the Receipts page.';

                    RunObject = page "Receipts List";
                }
                action("Sales Credit Memos")
                {
                    ApplicationArea = All;
                    Caption = 'Sales Credit Memos';
                    ToolTip = 'Open the Sales Credit Memos page.';
                    RunObject = page "Sales Credit Memos";
                }
                action("Payment Voucher")
                {
                    ApplicationArea = All;
                    Caption = 'Payment Voucher';
                    ToolTip = 'Open the Payment Voucher.';
                    RunObject = page "Payments List";
                }
            }
            group("Registry reports")
            {
                Caption = 'Registry reports';
                // ToolTip = 'Manage .';

                action("Domain Registration")
                {
                    ApplicationArea = All;
                    Caption = 'Domain Registrations Report';
                    ToolTip = 'View domain registration counts by registrar for a selected year.';
                    Image = "Report";
                    RunObject = report "Domain Registrations Report";
                }

                action("Domain Renewal")
                {
                    ApplicationArea = All;
                    Caption = 'Domain Renewals Report';
                    ToolTip = 'View domain renewal counts by registrar for a selected year.';
                    Image = "Report";
                    RunObject = report "Domain Renewals Report";
                }
            }

        }
    }
}