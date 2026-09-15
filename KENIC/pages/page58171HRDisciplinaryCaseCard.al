page 58171 "HR Disciplinary Case Card"
{
    PageType = Card;
    SourceTable = "HR Disciplinary Cases";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = All;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            systempart(Links; Links)
            {
                ApplicationArea = RecordLinks;
                Caption = 'Case Documents';
            }
            systempart(Control22; Notes) { }
        }
    }
}