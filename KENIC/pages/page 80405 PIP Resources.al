page 90405 "PIP Resources"
{
    Caption = 'Resources';
    PageType = ListPart;
    SourceTable = "PIP Resource";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Resource Type"; Rec."Resource Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Estimated Cost"; Rec."Estimated Cost")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}
