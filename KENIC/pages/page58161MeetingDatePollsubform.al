page 58161 "Meeting Date Polls Subform"
{
    ApplicationArea = All;
   // Caption = 'Meeting Date Polls';
    PageType = ListPart;
    SourceTable = "Meeting Date Polls";
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Member No."; Rec."Member No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Has Voted"; Rec."Has Voted")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indicates if this member has submitted a vote for this date option.';
                }
                field("User Id"; Rec."User Id")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Voted At"; Rec."Voted At")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
}