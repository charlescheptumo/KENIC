page 90407 "PIP Checkpoints"
{
    Caption = 'Progress Checkpoints';
    PageType = ListPart;
    SourceTable = "PIP Checkpoint";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Scheduled Date"; Rec."Scheduled Date")
                {
                    ApplicationArea = Basic;
                }
                field(Activity; Rec.Activity)
                {
                    ApplicationArea = Basic;
                }
                field("Conducted By"; Rec."Conducted By")
                {
                    ApplicationArea = Basic;
                }
                field(Completed; Rec.Completed)
                {
                    ApplicationArea = Basic;
                }
                field("Completion Date"; Rec."Completion Date")
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}
