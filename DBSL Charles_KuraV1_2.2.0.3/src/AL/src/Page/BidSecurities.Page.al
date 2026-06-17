#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72386 "Bid Securities"
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "Bid_Contract Security Register";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Form of Security"; Rec."Form of Security")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Form of Security field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Reference No"; Rec."Reference No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Guarantee Number';
                    ToolTip = 'Specifies the value of the Guarantee Number field.';
                }
                field("Security Type"; Rec."Security Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Guarantee Type';
                    ToolTip = 'Specifies the value of the Guarantee Type field.';
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
                field("Security Closure Date"; Rec."Security Closure Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Security Closure Date field.';
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

