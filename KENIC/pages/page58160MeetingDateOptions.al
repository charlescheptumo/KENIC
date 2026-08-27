page 58160 "Meeting Date Options Subform"
{
    ApplicationArea = All;
    Caption = 'Proposed Meeting Dates';
    PageType = ListPart;
    SourceTable = "Meeting Date Options";
    AutoSplitKey = true;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Proposed Date"; Rec."Proposed Date")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the proposed date for the meeting.';
                }
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the planned start time.';
                }
                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the planned end time.';
                }
                field("Venue"; Rec."Venue")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the proposed meeting location/venue or online link.';
                }
                field("Vote count"; Rec."Vote Count")

                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vote count.';
                }
                // field("Created At"; Rec."Created At")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Displays when this option was created.';
                // }
            }
        }
    }
    
}