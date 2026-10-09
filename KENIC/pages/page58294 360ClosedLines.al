page 58294 "360 Closed Lines"
{
    Caption = 'Closed Questions';
    PageType = ListPart;
    SourceTable = "360 Closed Line";
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Question; Rec.Question)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Rating; Rec.Rating) { ApplicationArea = All; }
            }
        }
    }
}