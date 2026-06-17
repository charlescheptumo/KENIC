page 50156 "Approved Employee Exit Voucher"
{
    ApplicationArea = All;
    Caption = 'Approved Employee Exit Vouchers';
    PageType = List;
    SourceTable = "Employee Exit Header";
    CardPageID = "Employee Exit Voucher";
    UsageCategory = Lists;
    SourceTableView = where("Document Type" = const("Exit Voucher"), "Approval Status" = filter(Approved), Posted = const(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Names"; Rec."Employee Names")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Names field.';
                }
                field("Exit Method"; Rec."Exit Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exit Method field.';
                }
                field("Position Id"; Rec."Position Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position Id field.';
                }
                field("Reasons Code"; Rec."Reasons Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reasons Code field.';
                }
            }
        }
    }

    actions
    {
    }
}


