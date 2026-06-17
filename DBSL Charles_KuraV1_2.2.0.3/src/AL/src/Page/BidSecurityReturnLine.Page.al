#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75322 "Bid Security Return Line"
{
    PageType = ListPart;
    SourceTable = "Bid Security Return Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Form of Security"; Rec."Form of Security")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Form of Security field.';
                }
                field("Bid Security ID"; Rec."Bid Security ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Security ID field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Issuer/Guarantor Name"; Rec."Issuer/Guarantor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issuer/Guarantor Name field.';
                }
                field("Security Amount (LCY)"; Rec."Security Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Security Amount (LCY) field.';
                }
                field("Return Reason Code"; Rec."Return Reason Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Return Reason Code field.';
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Closed field.';
                }
            }
        }
    }

    actions
    {
    }
}

