page 50380 "Training Needs Dev Obj Lookup"
{
    PageType = List;
    SourceTable = "Training Needs Dev Objective";
    Editable = false;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Training Header No"; Rec."Training Header No")
                {
                    ApplicationArea = Basic;
                }
                field(Competency; Rec.Competency)
                {
                    ApplicationArea = Basic;
                }
                field("Development Goal Year"; Rec."Development Goal Year")
                {
                    ApplicationArea = Basic;
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    procedure GetRecord(var TrainingNeedsDevObjective: Record "Training Needs Dev Objective")
    begin
        TrainingNeedsDevObjective := Rec;
    end;
}