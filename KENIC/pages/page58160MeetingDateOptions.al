#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
page 58160 "Meeting Date Options Subform"
{
    Caption = 'Proposed Dates';
    PageType = ListPart;
    SourceTable = "Meeting Date Options";
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Proposed Date"; Rec."Proposed Date")
                {
                    ApplicationArea = All;
                }
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = All;
                }
                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = All;
                }
                field("Venue"; Rec."Venue")
                {
                    ApplicationArea = All;
                }
                field("Vote Count"; Rec."Vote Count")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
