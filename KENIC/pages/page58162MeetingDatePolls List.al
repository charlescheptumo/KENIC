page 58162 "Meeting Date Polls List"
{
    ApplicationArea = All;
    Caption = 'Meeting Date Polls';
    PageType = List;
    SourceTable = "Meeting Date Polls";
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Id"; Rec."Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique poll record ID.';
                }
                field("Meeting Date Option Id"; Rec."Meeting Date Option Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the target meeting date option ID.';
                }
                field("User Id"; Rec."User Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the board member or user who voted.';
                }
                field("Voted At"; Rec."Voted At")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the timestamp when the vote was registered.';
                }
            }
        }
    }
}