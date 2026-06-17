#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50022 "pageextension50022" extends "Purchase List"
{
    layout
    {
        addafter("No.")
        {
            field(Description; Rec.Description)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Description field.';
            }
        }
        // addafter("Ship-to Code")
        // {
        //     field("Amount Including VAT"; Rec."Amount Including VAT")
        //     {
        //         ApplicationArea = Basic;
        //         ToolTip = 'Specifies the sum of amounts, including VAT, on all the lines in the document. This will include invoice discounts.';
        //     }
        // }
    }
}

