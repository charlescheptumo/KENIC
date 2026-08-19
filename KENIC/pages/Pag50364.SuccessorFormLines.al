namespace KENIC.KENIC;

page 50364 "Successor Form Lines"
{
    PageType = ListPart;
    SourceTable = "Successor Form Line";
    ApplicationArea = All;
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(Lines)
            {
                field("Development Area/Activity"; Rec."Development Area/Activity")
                {
                    ApplicationArea = All;
                }
                field("Timeframe"; Rec."Timeframe")
                {
                    ApplicationArea = All;
                }
                field("Progress/Comment"; Rec."Progress/Comment")
                {
                    ApplicationArea = All;
                }
                field("Training Required"; Rec."Training Required")
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