namespace KICD.KICD;

page 50319 "Batch Imprest Voucher"
{
    ApplicationArea = All;
    Caption = 'Batch Imprest Voucher List';
    PageType = List;
    SourceTable = payments;
    UsageCategory = Lists;
    CardPageId = "Batch Imprest Voucher Card";
    SourceTableView = where("Payment Type" = filter("Batch Imprest Voucher"),Posted=const(false));
    InsertAllowed = false;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ToolTip = 'Specifies the value of the Paying Bank Account field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ToolTip = 'Specifies the value of the Payment Narration field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Reasons to Reopen"; Rec."Reasons to Reopen")
                {
                    ToolTip = 'Specifies the value of the Reasons to Reopen field.';
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ToolTip = 'Specifies the value of the Funding Source field.';
                }
                field("Job Name"; Rec."Job Name")
                {
                    ToolTip = 'Specifies the value of the Job Name field.';
                }
                field(Currency; Rec.Currency)
                {
                    ToolTip = 'Specifies the value of the Currency field.';
                }
                field(Posted; Rec.Posted)
                {
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ToolTip = 'Specifies the value of the Posted Date field.';
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    ToolTip = 'Specifies the value of the Time Posted field.';
                }
            }
        }
    }
}
