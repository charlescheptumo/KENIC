page 50369 "Training Needs Dev Goals List"
{
    // Publish under Web Services with Service Name: TrainingNeedsDevGoals
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Training Needs Dev Goal";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Training Header No"; Rec."Training Header No")
                {
                    ApplicationArea = Basic;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Development Year"; Rec."Development Year")
                {
                    ApplicationArea = Basic;
                }
                field("Goal"; Rec.Goal)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}