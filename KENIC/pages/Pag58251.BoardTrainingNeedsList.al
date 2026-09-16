page 58251 "Board Training Needs List"
{
    PageType = List;
    SourceTable = "Board Training Needs";
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Board Training Needs Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No."; Rec."Application No.") { ApplicationArea = All; }
                field("Member Name"; Rec."Member Name") { ApplicationArea = All; }
                field("Training Title"; Rec."Training Title") { ApplicationArea = All; }
                field("Date Submitted"; Rec."Date Submitted") { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
            }
        }
    }
}