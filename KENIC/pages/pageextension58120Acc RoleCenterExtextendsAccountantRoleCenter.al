pageextension 58120 "Acc RoleCenter Ext" extends "Accountant Role Center"
{
    actions
    {

        addafter("Domain Customers")
        {
            action("Registrants")
            {
                ApplicationArea = All;
                Caption = 'Registrants';
                ToolTip = 'View and manage domain registrants.';
                Image = Users;
                RunObject = page "Registrants List";
            }
        }

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
                    Caption = 'Domain Registration';
                    ToolTip = 'View domain registration statistics by registrar.';
                    Image = List;
                    RunObject = page "Domain Registration Stat List";
                }
                action("Domain Renewal")
                {
                    ApplicationArea = All;
                    Caption = 'Domain Renewal';
                    ToolTip = 'View domain renewal statistics by registrar.';
                    Image = List;
                    RunObject = page "Domain Renewal Stat List";
                }
                action("Domain Deletion List")
                {
                    ApplicationArea = All;
                    Caption = 'Domain Deletion';
                    ToolTip = 'View the list of deleted domains and their details.';
                    Image = List;
                    RunObject = page "Domain Deletion List";
                }//page 58180 "Domain DUM Statistics List"

                action("Domains Under Management Report")
                {
                    ApplicationArea = All;
                    Caption = 'DUM';
                    ToolTip = 'View the list of domains under management and their statistics by registrar.';
                    Image = List;
                    RunObject = page "Domain DUM Statistics List";
                }

                action("Zones")
                {
                    ApplicationArea = All;
                    Caption = 'Zones';
                    ToolTip = 'View domain zone statistics breakdown.';
                    Image = List;
                    RunObject = page "Domain Zone Statistics List";
                }//page 58178 "Domain Acct Statistics List"
                action("Account Manager Statistics")
                {
                    ApplicationArea = All;
                    Caption = 'Account Manager Statistics';
                    ToolTip = 'View domain account manager statistics breakdown.';
                    Image = List;
                    RunObject = page "Domain Acct Statistics List";
                }
            }

        }
    }
}