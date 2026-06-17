namespace KICD.KICD;
using Microsoft.Foundation.NoSeries;

page 50331 "Batch Check Vouchers"
{
    ApplicationArea = All;
    Caption = 'Batch Check Voucher';
    PageType = List;
    SourceTable = "Batch Check Voucher";
    SourceTableView = where(Posted = const(false));
    CardPageId = "Batch Check Voucher";
    Editable = false;
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ToolTip = 'Specifies the value of the Paying Bank Account field.', Comment = '%';
                }
                field("Paying Bank Account Name";Rec."Paying Bank Account Name")
                {
                    ToolTip = 'Specifies the value of the Paying Bank Account Name field.', Comment = '%';
                }
                field(Payee; Rec.Payee)
                {
                    ToolTip = 'Specifies the value of the Payee field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field("Posting Date";Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
field(Posted;Rec.Posted)
{}

            }
        }
    }
   actions
   {
    area(Navigation)
    {
    group("P&osting")
    {
       
    }
    }
   
   }
}
