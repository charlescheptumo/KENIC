#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75151 "Bid_Contract Security Register"
{
    PageType = List;
    SourceTable = "Bid_Contract Security Register";
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
                field("Security Type"; Rec."Security Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Security Type field.';
                }
                field("Reference No"; Rec."Reference No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Guarantee Number';
                    ToolTip = 'Specifies the value of the Guarantee Number field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Issuer Institution Type"; Rec."Issuer Institution Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issuer Institution Type field.';
                }
                field("Issuer/Guarantor Name"; Rec."Issuer/Guarantor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issuer/Guarantor Name field.';
                }
                field("Issuer Registered Offices"; Rec."Issuer Registered Offices")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issuer Registered Offices field.';
                }
                field("Security Amount (LCY)"; Rec."Security Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Guarantee Amount (KES)';
                    ToolTip = 'Specifies the value of the Guarantee Amount (KES) field.';
                }
                field("Bid Security Effective Date"; Rec."Bid Security Effective Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Guarantee Effective Date';
                    Description = 'Bid Security Effective Date';
                    ToolTip = 'Specifies the value of the Guarantee Effective Date field.';
                }
                field("Bid Security Validity Expiry"; Rec."Bid Security Validity Expiry")
                {
                    ApplicationArea = Basic;
                    Caption = 'Guarantee Expiry Date';
                    ToolTip = 'Specifies the value of the Guarantee Expiry Date field.';
                }
                field("Guarantee Expiry Notification"; Rec."Guarantee Expiry Notification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Guarantee Expiry Notification field.';
                }
                field("Second Expiry Notification Dat"; Rec."Second Expiry Notification Dat")
                {
                    ApplicationArea = Basic;
                    Caption = 'Second Expiry Notification Date';
                    ToolTip = 'Specifies the value of the Second Expiry Notification Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

