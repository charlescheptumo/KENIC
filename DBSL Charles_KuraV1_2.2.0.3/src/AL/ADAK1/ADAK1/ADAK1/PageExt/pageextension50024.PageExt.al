#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50024 "pageextension50024" extends "Purch. Invoice Subform"
{
    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""VAT Prod. Posting Group"(Control 14)".


        //Unsupported feature: Property Modification (Visible) on ""Job No."(Control 38)".


        //Unsupported feature: Property Modification (Visible) on ""Job Task No."(Control 90)".

        modify("Job Unit Price")
        {
            Visible = false;
        }
        modify("Job Total Price")
        {
            Visible = false;
        }
        modify("Job Unit Price (LCY)")
        {
            Visible = false;
        }
        modify("Job Total Price (LCY)")
        {
            Visible = false;
        }
        modify("Gen. Prod. Posting Group")
        {
            Visible = true;
        }
        // addafter("Cross-Reference No.")
        // {
        //     field(Applied;Applied)
        //     {
        //         ApplicationArea = Basic;
        //     }
        // }
        addafter("VAT Prod. Posting Group")
        {
            // field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
            // {
            //     ApplicationArea = Basic;
            // }
        }
        addafter("Line Amount")
        {
            field("Amount Including VAT"; Rec."Amount Including VAT")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Amount Including VAT field.';
            }
        }
        addafter("Qty. Assigned")
        {
            field("Procurement Plan ID"; Rec."Procurement Plan ID")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Procurement Plan ID field.';
            }
            field("Procurement Plan Entry No"; Rec."Procurement Plan Entry No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Procurement Plan Entry No field.';
            }
        }
        moveafter("IC Partner Reference"; "VAT Prod. Posting Group")
    }
}

