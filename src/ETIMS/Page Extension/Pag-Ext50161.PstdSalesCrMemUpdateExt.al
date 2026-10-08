pageextension 50161 "Pstd.Sales Cr. Mem- Update Ext"
    extends "Pstd. Sales Cr. Memo - Update"
{
    layout
    {
        addlast(General)
        {
            field("External Document No."; Rec."External Document No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the external document number.';
                Editable = true;
            }

            field("Your Reference"; Rec."Your Reference")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the customer reference.';
                Editable = true;
            }
        }
    }
}

