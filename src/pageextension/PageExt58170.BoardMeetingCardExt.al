pageextension 58172 "Board Meeting Card Ext" extends "Board Meeting Card"
{
    layout
    {
        addafter("Meeting group")
        {
            field("Convener No."; Rec."Convener No.")
            {
                ApplicationArea = All;
                Caption = 'Convener No.';
            }
            field("Send Meeting Reminder"; Rec."Send Meeting Reminder")
            {
                ApplicationArea = All;
                ToolTip = 'Email the attendees the meeting date, time and venue one day before the meeting.';
            }
            field("Meeting Reminder Sent"; Rec."Meeting Reminder Sent")
            {
                ApplicationArea = All;
            }
        }
    }
}