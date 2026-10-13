
page 58295 "360 Open Lines"
{
    Caption = 'Open-ended Questions';
    PageType = ListPart;
    SourceTable = "360 Open Line";
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
                field(Response; Rec.Response) { ApplicationArea = All; }
            }
        }
    }
}
