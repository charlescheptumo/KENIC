page 57113 "Resolution Votes Subform"
{
    PageType = ListPart;
    SourceTable = "Circular Resolution lines";
    Caption = 'Resolution Votes';
    AutoSplitKey = true;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("Employee No."; Rec."Personal No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique number of the board member.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    Caption = 'Board Member Name';
                    ToolTip = 'Displays the board member name.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the home department code of the board member.';
                    Visible = false;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the board member email address.';
                }
                field("Vote Status"; Rec."Vote Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether this member is pending or has completed voting.';
                    Editable = false;
                }
                field("Selected Option Code"; Rec."Selected Option Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the code of the option they selected.';
                    Editable = false;
                }
                field("Vote DateTime"; Rec."Vote DateTime")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the timestamp when their vote was submitted.';
                    Editable = false;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'Allows the board member to log optional comments with their vote.';
                }
                field("Notification Sent"; Rec."Notification Sent")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if an email notification regarding this vote was sent.';
                    Editable = false;
                }
                field("Notification DateTime"; Rec."Notification DateTime")
                {
                    ApplicationArea = All;
                    ToolTip = 'Displays the timestamp when the email notification went out.';
                    Editable = false;
                }
            }
        }
    }

    // trigger OnAfterGetCurrRecord()
    // begin
    //     if Rec."Line No." = 0 then
    //         Rec."Line No." := Rec."Line No." + 1;
    // end;


}