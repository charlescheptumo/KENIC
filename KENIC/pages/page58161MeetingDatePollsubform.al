page 58161 "Meeting Date Polls Subform"
{
    ApplicationArea = All;
    Caption = 'Meeting Date Polls';
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
                    ToolTip = 'Specifies the committee member number.';
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the name of the committee member.';
                }
                field("Has Voted"; Rec."Has Voted")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indicates if this member has submitted a vote for this date option.';

                    trigger OnValidate()
                    begin
                       
                        CurrPage.Update(true);
                    end;
                }
                field("User Id"; Rec."User Id")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the user who cast or modified the vote.';
                }
                field("Voted At"; Rec."Voted At")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Displays the timestamp when the vote was submitted.';
                }
            }
        }
    }
}