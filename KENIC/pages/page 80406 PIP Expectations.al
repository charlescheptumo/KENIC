page 90406 "PIP Expectations"
{
    Caption = 'Expectations';
    PageType = ListPart;
    SourceTable = "PIP Expectation";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requirement/Task"; Rec."Requirement/Task")
                {
                    ApplicationArea = Basic;
                }
                field("Timeline Date"; Rec."Timeline Date")
                {
                    ApplicationArea = Basic;
                }
                field("Reporting Frequency"; Rec."Reporting Frequency")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}
