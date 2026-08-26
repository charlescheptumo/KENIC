page 58161 "Meeting Date Polls Subform"
{
    ApplicationArea = All;
    Caption = 'Votes Cast';
    PageType = ListPart;
    SourceTable = "Meeting Date Polls";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Id"; Rec."Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique poll vote record ID.';
                    Visible = false;
                }
                field("Meeting Date Option Id"; Rec."Meeting Date Option Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the target date option ID.';
                }
                field("User Id"; Rec."User Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the board member/user who cast the vote.';
                }
                field("Voted At"; Rec."Voted At")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the exact date and timestamp when the vote was submitted.';
                }
            }
        }
    }
}