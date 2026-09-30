page 50651 "Per Diem Requisitions"
{
    Caption = 'Per Diem Requisitions';
    PageType = List;
    SourceTable = payments;
    SourceTableView = sorting("No.") order(descending) where("Payment Type" = const(Imprest), "Per Diem through Payroll" = const(true));
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    CardPageID = "Imprest Requisition";

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the imprest number.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the imprest date.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Employee for staff or Vendor for board members.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the staff or board member number.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the staff or board member name.';
                }
                field("Imprest Memo No"; Rec."Imprest Memo No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the imprest memo.';
                }
                field("Travel Date"; Rec."Travel Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the travel date.';
                }
                field("PD No. of Days"; Rec."PD No. of Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of days.';
                }
                field("Accommodation Provided"; Rec."Accommodation Provided")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether accommodation was provided.';
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the per diem amount.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the approval status.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether Finance paid it early.';
                }
                field("PD Paid Early"; Rec."PD Paid Early")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the per diem was paid before payroll.';
                }
                field("PD Payroll Period"; Rec."PD Payroll Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the payroll period that picked up the per diem.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(Setup)
            {
                ApplicationArea = All;
                Caption = 'Per Diem Setup';
                Image = Setup;
                RunObject = page "Per Diem Setup";
                ToolTip = 'Opens the per diem setup.';
            }
        }
    }
}
