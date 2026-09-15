namespace KENIC.KENIC;

page 50367 "Training Needs Dev Objectives"
{
    PageType = ListPart;
    SourceTable = "Training Needs Dev Objective";
    ApplicationArea = All;
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(Lines)
            {
                field("Competency"; Rec.Competency)
                {
                    ApplicationArea = All;
                }
                field("Development Goal Year"; Rec."Development Goal Year")
                {
                    ApplicationArea = All;
                }
                field("Purpose"; Rec.Purpose)
                {
                    ApplicationArea = All;
                }
                field("Priority"; Rec.Priority)
                {
                    ApplicationArea = All;
                }
                field("Developmental Activity"; Rec."Developmental Activity")
                {
                    ApplicationArea = All;
                }
                field("Evidence of Accomplishment"; Rec."Evidence of Accomplishment")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Training Header No" := GetHeaderNo();
    end;

    local procedure GetHeaderNo(): Code[30]
    var
        Hdr: Record "Training Needs Header";
    begin
        if Hdr.Get(Rec."Training Header No") then
            exit(Hdr.Code);
    end;
}