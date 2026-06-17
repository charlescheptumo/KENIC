#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59135 "Vehicle Insurance Lines"
{
    PageType = ListPart;
    SourceTable = "Vehicle Insurance Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Insurance Number';
                    ToolTip = 'Specifies the value of the Insurance Number field.';
                }
                field("Policy Number"; Rec."Policy Number")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Policy Number field.';
                }
                field("FA No."; Rec."FA No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field("Vehicle Description"; Rec."Vehicle Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Model field.';
                }
                field("Insurance Type"; Rec."Insurance Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Type field.';
                }
                field("Vehicle Policy No."; Rec."Vehicle Policy No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle Policy No. field.';
                }
                field("Vehicle Location"; Rec."Vehicle Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Location field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expiration Date field.';
                }
                field("Insurance Vendor No."; Rec."Insurance Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Vendor No. field.';
                }
                field("Insurance Vendor Name"; Rec."Insurance Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Vendor Name field.';
                }
                field("Insuance Details"; Rec."Insuance Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insuance Details field.';
                }
            }
        }
    }

    actions
    {
    }
}

