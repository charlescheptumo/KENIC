page 50366 "Training Needs Dev Goals"
{
    PageType = ListPart;
    SourceTable = "Training Needs Dev Goal";
    ApplicationArea = All;
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(Lines)
            {
                field("Development Year"; Rec."Development Year")
                {
                    ApplicationArea = All;
                }
                field("Goal"; Rec.Goal)
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
