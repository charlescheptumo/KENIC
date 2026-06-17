pageextension 50147 "Accountant Role Ext" extends "Accountant Role Center"
{
    actions
    {
        addlast(Payments)
        {

            group("Payment Vouchers")
            {
                action("Payment Voucher List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Voucher List';
                    Image = Payment;
                    RunObject = Page "Payments Vouchers";
                    ToolTip = 'Executes the Payment Voucher List action.';
                }
                action("Approved Payment Vouchers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approved Payment Voucher List';
                    Image = Payment;
                    RunObject = Page "Approved Payment Vouchers";
                    ToolTip = 'Executes the Approved Payment Voucher List action.';
                }
            }
            action(Retention)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Retention List';
                Image = Payment;
                RunObject = Page Retentions;
                ToolTip = 'Executes the Retention List action.';
            }

        }
        addafter("Cash Management")
        { group(BatchCheck)
            {
                Caption = 'Batch Check';
                ToolTip = 'Check the batch status and details.';

                action(Batchchecks)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Batch checks';
                    Image = BatchCheck;
                    RunObject = Page "Batch Check Vouchers";
                    ToolTip = 'View the list of batches that are waiting to be processed, currently being processed, or have been processed recently. You can check the details and status of each batch to monitor the progress of transactions that are being posted in your system.';
                }
                action(BatchCheckList)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Batch checks';
                    Image = BatchCheck;
                    RunObject = Page "Posted Batch Check Vouchers";
                    ToolTip = 'View the list of batches that are waiting to be processed, currently being processed, or have been processed recently. You can check the details and status of each batch to monitor the progress of transactions that are being posted in your system.';
                }
                action(BatchCheckAnalysisReport)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Batch Check Analysis Report';
                    Image = BatchCheck;
                    RunObject = Report "Check Analysis Report";
                    ToolTip = 'View the report of batches that are waiting to be processed, currently being processed, or have been processed recently. You can analyze the details and status of each batch to monitor the progress of transactions that are being posted in your system.';
                }
            }}
    }
}
