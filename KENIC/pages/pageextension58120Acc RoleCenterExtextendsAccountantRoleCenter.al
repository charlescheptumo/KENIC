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

                    RunObject = page "Cash Receipt Journal"; 
                }
                action("Sales Credit Memos")
                {
                    ApplicationArea = All;
                    Caption = 'Sales Credit Memos';
                    ToolTip = 'Open the Sales Credit Memos page.';
                    RunObject = page "Sales Credit Memos";
                }
            }
        }
    }
}