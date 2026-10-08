pageextension 60008 "Sales & Receivables Setup Ext" extends "Sales & Receivables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field("Etims Nos."; Rec."Etims Nos.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Etims Nos. field.', Comment = '%';
            }
            // field("Allow Unit Price Editing"; Rec."Allow Unit Price Editing")
            // {
            //     ApplicationArea = Basic;
            //     ToolTip = 'Specifies whether Unit Price can be edited on Sales Invoice and Credit Memo lines. Leave unticked to keep prices locked to the price list.';
            // }
        }
    }
}
