pageextension 50347 "General Ledger Entries Ext" extends "General Ledger Entries"
{
    layout
    {
        addafter("G/L Account No.")
        {
            field("Employee No."; Rec."Employee No.")
            {
                ApplicationArea = All;
            }
            field("Employee Name"; Rec."Employee Name")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }

        addafter("Gen. Prod. Posting Group")
        {
            field("Paying Bank Account"; Rec."Paying Bank Account")
            {
                ApplicationArea = All;
            }
            field("Bank Name"; Rec."Bank Name")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Destination Narration"; Rec."Destination Narration")
            {
                ApplicationArea = All;
            }
        }
    }

}