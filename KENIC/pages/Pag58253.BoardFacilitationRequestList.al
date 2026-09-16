page 58253 "Board Facilitation Req List"
{
    PageType = List;
    SourceTable = "Board Facilitation Request";
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Board Facilitation Req Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Request No."; Rec."Request No.") { ApplicationArea = All; }
                field("Member Name"; Rec."Member Name") { ApplicationArea = All; }
                field("Request Type"; Rec."Request Type") { ApplicationArea = All; }
                field("Amount Requested"; Rec."Amount Requested") { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
            }
        }
    }
}