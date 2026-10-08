pageextension 60001 "G/L Account Card" extends "G/L Account Card"
{
    layout
    {
        // addafter(Blocked)
        // {
        //     field("Budget Controlled"; Rec."Budget Controlled")
        //     {
        //         ApplicationArea = Basic;
        //     }
        // }
        addafter(Balance)
        {
            field("Balance at Date"; Rec."Balance at Date")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Cost Accounting")
        {
            group(ETIMS)
            {
                Visible = yesno;
                field("Country of Origin"; Rec."Country of Origin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country of Origin field.';
                }
                field("Product Type"; Rec."Service Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Product Type field.';
                }
                field("Packaging Unit code"; Rec."Packaging Unit code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Packaging Unit code field.';
                }
                field("Quantity Unit Code"; Rec."Quantity Unit Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity Unit Code field.';
                }
                field("Item Code"; Rec."Etims Item Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Etims Item Code field.';
                    Caption = 'Etims Item Code';
                    Editable = false;
                }
                field("Branch Code"; Rec."Branch Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch Code field.';
                }
                field("Item Class"; Rec."Item Class")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item Class field.';
                }
                field("Tax Type"; Rec."Tax Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Type field.';
                }
                field("Insuarance Applicable"; Rec."Insuarance Applicable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insuarance Applicable field.';
                    Visible = false;
                }

            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        yesno := false;
        if (Rec."Account Type" = Rec."Account Type"::Posting) and (Rec.Blocked = false) and (Rec."Direct Posting" = true) then begin
            Rec.generateItemCode();
            yesno := true;
        end;
    end;

    var
        yesno: Boolean;
}
