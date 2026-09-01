page 58160 "Meeting Date Options Subform"
{
    ApplicationArea = All;
    Caption = 'Proposed Meeting Dates';
    PageType = ListPart;
    SourceTable = "Meeting Date Options";
    AutoSplitKey = false; 
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
                field("Vote Count"; Rec."Vote Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vote count.';
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        Rec."Created At" := CurrentDateTime();
    end;
}