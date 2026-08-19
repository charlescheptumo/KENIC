namespace KENIC.KENIC;


page 50361 "Succ. Sel. Justif. Lines"
{
    PageType = ListPart;
    SourceTable = "Succ. Sel. Justification Line";
    ApplicationArea = All;
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(Lines)
            {
                field("Criteria"; Rec."Criteria")
                {
                    ApplicationArea = All;
                }
                field("Rating"; Rec."Rating")
                {
                    ApplicationArea = All;
                }
                field("Comments"; Rec."Comments")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document No." := GetHeaderNo();
    end;

    local procedure GetHeaderNo(): Code[20]
    var
        Hdr: Record "Succ. Sel. Justification Hdr";
    begin
        if Hdr.Get(Rec."Document No.") then
            exit(Hdr."No.");
    end;
}