page 58154 "ESign Lines"
{
    PageType = ListPart;
    SourceTable = "ESign Line";
    Caption = 'Signers';
    AutoSplitKey = true;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Board Member No."; Rec."Board Member No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the board member assigned to sign this document.';
                }
                field("Board Member Name"; Rec."Board Member Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the board member name.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the email address of the board member.';
                }

                field("Signing Order"; Rec."Signing Order")
                {
                    ApplicationArea = All;
                    ToolTip = 'Species the sequence of signing';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the current signing status for this line.';
                }
                field("Signed/Declined Date"; Rec."Signed/Declined Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the timestamp when the board member signed or declined.';
                }
            }
        }
    }
}