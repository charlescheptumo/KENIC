#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50011 "pageextension50011" extends "Vendor Ledger Entries"
{

    //Unsupported feature: Property Modification (Permissions) on ""Vendor Ledger Entries"(Page 29)".


    //Unsupported feature: Property Modification (InsertAllowed) on ""Vendor Ledger Entries"(Page 29)".


    //Unsupported feature: Property Modification (DeleteAllowed) on ""Vendor Ledger Entries"(Page 29)".

    Editable = true;
    layout
    {
        addafter("On Hold")
        {
            field("Check No"; Rec."Check No")
            {
                Caption = 'Check No.';
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the Check No. field.', Comment = '%';
            }
            field("Paying Bank Account"; Rec."Paying Bank Account")
            {
                ApplicationArea = Basic;
                Caption = 'Paying Bank Account';
                ToolTip = 'Specifies the value of the Paying Bank Account field.';
            }
            field("Bank Name"; Rec."Bank Name")
            {
                ApplicationArea = Basic;
                Caption = 'Bank Name';
                ToolTip = 'Specifies the value of the Bank Name field.';
            }
            field(WHT; Rec.WHT)
            {
                ApplicationArea = Basic;
                Caption = 'WHT';
                ToolTip = 'Specifies the value of the WHT field.';
            }
            field("VAT Witheld"; Rec."VAT Witheld")
            {
                ApplicationArea = Basic;
                Caption = 'VAT Withheld';
                ToolTip = 'Specifies the value of the VAT Withheld field.';
            }
            field(PPRA; Rec.PPRA)
            {
                ApplicationArea = Basic;
                Caption = 'PPRA';
                ToolTip = 'Specifies the value of the PPRA field.';
            }
            field(Retention; Rec.Retention)
            {
                ApplicationArea = Basic;
                Caption = 'Retention';
                ToolTip = 'Specifies the value of the Retention field.';
            }
            field(PAYE; Rec.PAYE)
            {
                ApplicationArea = Basic;
                Caption = 'PAYE';
                ToolTip = 'Specifies the value of the PAYE field.';
            }

        }
        addafter("Dimension Set ID")
        {
            field("Project No"; Rec."Project No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Project No field.';
            }
            field("Contractor No"; Rec."Contractor No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Contractor No field.';
            }
        }
    }
    actions
    {


        //Unsupported feature: Code Modification on ""Show Document"(Action 13).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ShowDoc
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*

        ShowDoc
        */
        //end;
    }
}

#pragma implicitwith restore

