
page 58302 "360 Consol. Closed Lines"
{
    Caption = 'Closed Questions';
    PageType = ListPart;
    SourceTable = "360 Consol. Closed Line";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question Text"; Rec."Question Text") { ApplicationArea = All; }
                field("Response Count"; Rec."Response Count") { ApplicationArea = All; }
                field("Average Score"; Rec."Average Score") { ApplicationArea = All; }
                field("Self Score"; Rec."Self Score") { ApplicationArea = All; }
            }
        }
    }
}
