namespace KENIC.KENIC;

page 50365 "Successor Form Top Dev Areas"
{
    PageType = ListPart;
    SourceTable = "Successor Form Top Dev Area";
    ApplicationArea = All;
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(Lines)
            {
                field("Development Area"; Rec."Development Area")
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
        Hdr: Record "Successor Form Header";
    begin
        if Hdr.Get(Rec."Document No.") then
            exit(Hdr."No.");
    end;
}