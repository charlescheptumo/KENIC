page 90404 "PIP Activities"
{
    Caption = 'Activity Goals';
    PageType = ListPart;
    SourceTable = "PIP Activity";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Goal Line No."; Rec."Goal Line No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Goal No.';
                }
                field(Requirement; Rec.Requirement)
                {
                    ApplicationArea = Basic;
                }
                field("How to Accomplish"; Rec."How to Accomplish")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}
