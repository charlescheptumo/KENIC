page 58250 "Board Training Needs Card"
{
    PageType = Card;
    SourceTable = "Board Training Needs";
    ApplicationArea = All;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Application No."; Rec."Application No.") { ApplicationArea = All; }
                field("Member No."; Rec."Member No.") { ApplicationArea = All; }
                field("Member Name"; Rec."Member Name") { ApplicationArea = All; }
                field("Training Title"; Rec."Training Title") { ApplicationArea = All; }
                field(Justification; Rec.Justification) { ApplicationArea = All; }
                field("Date Submitted"; Rec."Date Submitted") { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
                field("Approver Comments"; Rec."Approver Comments") { ApplicationArea = All; }
                field("Date Actioned"; Rec."Date Actioned") { ApplicationArea = All; }
            }
        }
    }
}