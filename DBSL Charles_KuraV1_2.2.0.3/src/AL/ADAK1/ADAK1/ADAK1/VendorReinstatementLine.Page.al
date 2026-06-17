#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75191 "Vendor Reinstatement Line"
{
    PageType = ListPart;
    SourceTable = "Vendor Debarment Voucher Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Firm Name"; Rec."Firm Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Firm Name field.';
                }
                field("Debarment Reason Code"; Rec."Debarment Reason Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reason Code';
                    ToolTip = 'Specifies the value of the Reason Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Apply To Entry No."; Rec."Apply To Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Apply To Entry No. field.';
                }
                field("Reinstatement Date"; Rec."Reinstatement Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reinstatement Date field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Tax Registration (PIN) No."; Rec."Tax Registration (PIN) No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Registration (PIN) No. field.';
                }
                field("Incorporation/Reg No."; Rec."Incorporation/Reg No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incorporation/Reg No. field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
            }
        }
    }

    actions
    {
    }
}

