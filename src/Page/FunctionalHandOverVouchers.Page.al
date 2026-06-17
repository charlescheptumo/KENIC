#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69836 "Functional Hand Over Vouchers"
{
    CardPageID = "Functional Hand Over Voucher";
    Editable = false;
    PageType = List;
    SourceTable = "Employee Exit header";
    SourceTableView = where("Document Type" = const("Hand Over Voucher"));
    ApplicationArea = All;

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

