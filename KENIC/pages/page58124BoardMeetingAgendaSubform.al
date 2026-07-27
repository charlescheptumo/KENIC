page 58124 "Board Meeting Agenda Subform"
{
    PageType = ListPart;
    SourceTable = "Board Meeting Agenda";
    Caption = 'Meeting Agenda Items';
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Agenda No."; Rec."Agenda No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the agenda item number (e.g., 1, 2, 3 or A, B, C).';
                }
                field("Topic / Title"; Rec."Topic / Title")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the main topic or title of the agenda item.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies detailed information about the agenda item.';
                }

                field("Conflict Exists"; Rec."Conflict Exists")
                {
                    ApplicationArea = All;
                    ToolTip = 'Indicates whether any board member has declared a conflict of interest for this agenda item.';
                    Editable = false;
                }
            }
        }
    }
}