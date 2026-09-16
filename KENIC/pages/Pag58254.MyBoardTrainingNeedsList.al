page 58254 "My Board Training Needs List"
{
    // Publish under Web Services with Service Name: MyBoardTrainingNeedsList
    PageType = List;
    SourceTable = "Board Training Needs";
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
                field("Application No."; Rec."Application No.") { ApplicationArea = All; }
                field("Member No."; Rec."Member No.") { ApplicationArea = All; }
                field("Training Title"; Rec."Training Title") { ApplicationArea = All; }
                field(Justification; Rec.Justification) { ApplicationArea = All; }
                field("Date Submitted"; Rec."Date Submitted") { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
                field("Approver Comments"; Rec."Approver Comments") { ApplicationArea = All; }
            }
        }
    }
}