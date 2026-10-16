page 90402 "PIP Areas of Concern"
{
    Caption = 'Areas of Concern';
    PageType = ListPart;
    SourceTable = "PIP Area of Concern";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Area Type"; Rec."Area Type")
                {
                    ApplicationArea = Basic;
                }
                field("Competency Type"; Rec."Competency Type")
                {
                    ApplicationArea = Basic;
                }
                field("Area Description"; Rec."Area Description")
                {
                    ApplicationArea = Basic;
                }
                field(Observations; Rec.Observations)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}
