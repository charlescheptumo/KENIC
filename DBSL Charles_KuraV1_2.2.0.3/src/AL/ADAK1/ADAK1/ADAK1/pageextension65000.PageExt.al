#pragma implicitwith disable
PageExtension 65000 "pageextension65000" extends "Purchase Lines"
{
    layout

    {
        addafter("Line Amount")
        {

            field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the VAT Prod. Posting Group field.';


            }
            field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
            {
                ApplicationArea = basic;
                ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.';
            }
            field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = basic;
                Visible = true;
                ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
            }

        }
        addafter(Description)
        {
            field(Description3; Rec.Description3)
            {
                ApplicationArea = BASIC;
                Visible = TRUE;
                ToolTip = 'Specifies the value of the Description field.';
            }
        }
    }

    var
        PurchaseLine: Record "Purchase Line";
}

#pragma implicitwith restore
