#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69471 "Safety Equipment Register"
{
    PageType = Card;
    SourceTable = 69435;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Equipment ID"; Rec."Equipment ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment ID field.';
                }
                field(SubType; Rec.SubType)
                {
                    ApplicationArea = Basic;
                    Caption = 'Type';
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("SubType No."; Rec."SubType No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Type No.';
                    ToolTip = 'Specifies the value of the Type No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Safety Equipment Category"; Rec."Safety Equipment Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Safety Equipment Category field.';
                }
                field("Safety Notes/Comments"; Rec."Safety Notes/Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Safety Notes/Comments field.';
                }
                field("FA Location Code"; Rec."FA Location Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Location';
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Serial No. field.';
                }
                field("Inventory Quantity"; Rec."Inventory Quantity")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Inventory Quantity field.';
                }
                field("Fixed Asset/Resource Quantity"; Rec."Fixed Asset/Resource Quantity")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Fixed Asset/Resource Quantity field.';
                }
            }
            group(Maintenance)
            {
                Caption = 'Maintenance';
                Visible = false;

                field("Maintenance Type"; Rec."Maintenance Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Maintenance Type field.', Comment = '%';
                }
                field("Maintenance Vendor No."; Rec."Maintenance Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintenance Vendor No. field.';
                }
                field("Next Service Date"; Rec."Next Service Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Service Date field.';
                }
                field("Maintenance Date"; Rec."Maintenance Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintenance Date field.';
                }
                field(Insured; Rec.Insured)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Insured field.';
                }
            }
            part("Safety Equiment Register Lines"; "Safety Equiment Register Lines")
            {
                ApplicationArea = Basic;

            }
        }
    }

    actions
    {
    }
}
