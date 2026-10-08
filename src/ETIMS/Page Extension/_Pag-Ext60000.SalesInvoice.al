pageextension 60000 "Sales Invoice" extends "Sales Invoice"
{
    layout
    {
        modify("Document Date")
        {
            ApplicationArea = Basic;
            ToolTip = 'Specifies the value of the Document Date field.';
            Editable = false;
            visible = false;
        }

        modify("Sell-to Customer No.")
        {
            ApplicationArea = Basic;
            ToolTip = 'Specifies the value of the Sell-to Customer No. field.';

        }

        addbefore(Status)
        {
            field("PostingDescription"; Rec."Posting Description")
            {
                Visible = true;
                ApplicationArea = Basic;
            }
        }
        addafter(Status)
        {

            field("Sales Type Code"; Rec."Sales Type Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Sales Type Code field.';
            }
            field("Invoice Status Code"; Rec."Invoice Status Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Invoice Status Code field.';
            }

        }
    }
    actions
    {
        // Nothing to change here
    }

    // trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    // begin
    //     Rec."Posting Date" := 0D; // clear Posting Date on new record
    //     exit(true); // allow insert
    // end;


}