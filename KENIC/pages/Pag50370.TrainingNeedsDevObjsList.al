page 50370 "Training Needs Dev Objs List"
{
    // Publish under Web Services with Service Name: TrainingNeedsDevObjectives
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Training Needs Dev Objective";
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
                field("Competency"; Rec.Competency)
                {
                    ApplicationArea = Basic;
                }
                field("Development Goal Year"; Rec."Development Goal Year")
                {
                    ApplicationArea = Basic;
                }
                field("Purpose"; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                }
                field("Priority"; Rec.Priority)
                {
                    ApplicationArea = Basic;
                }
                field("Developmental Activity"; Rec."Developmental Activity")
                {
                    ApplicationArea = Basic;
                }
                field("Evidence of Accomplishment"; Rec."Evidence of Accomplishment")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}