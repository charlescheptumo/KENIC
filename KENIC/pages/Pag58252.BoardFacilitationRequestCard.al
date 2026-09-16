page 58252 "Board Facilitation Req Card"
{
    PageType = Card;
    SourceTable = "Board Facilitation Request";
    ApplicationArea = All;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Request No."; Rec."Request No.") { ApplicationArea = All; }
                field("Training Need No."; Rec."Training Need No.") { ApplicationArea = All; }
                field("Member No."; Rec."Member No.") { ApplicationArea = All; }
                field("Member Name"; Rec."Member Name") { ApplicationArea = All; }
                field("Request Type"; Rec."Request Type") { ApplicationArea = All; }
                field("Amount Requested"; Rec."Amount Requested") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field("Date Submitted"; Rec."Date Submitted") { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
                field("Approver Comments"; Rec."Approver Comments") { ApplicationArea = All; }
            }
        }
    }
}