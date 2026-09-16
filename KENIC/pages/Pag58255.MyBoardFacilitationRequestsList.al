page 58255 "My Facilitation Reqs List"
{
    // Publish under Web Services with Service Name: MyBoardFacilitationRequestsList
    PageType = List;
    SourceTable = "Board Facilitation Request";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Request No."; Rec."Request No.") { ApplicationArea = All; }
                field("Training Need No."; Rec."Training Need No.") { ApplicationArea = All; }
                field("Member No."; Rec."Member No.") { ApplicationArea = All; }
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