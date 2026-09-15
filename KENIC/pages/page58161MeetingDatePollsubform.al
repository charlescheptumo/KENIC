#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
page 58161 "Meeting Date Polls Subform"
{
    Caption = 'Votes';
    PageType = ListPart;
    SourceTable = "Meeting Date Polls";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Member No."; Rec."Member No.")
                {
                    ApplicationArea = All;
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = All;
                }
                field("Proposed Date"; Rec."Proposed Date")
                {
                    ApplicationArea = All;
                }
                field("Has Voted"; Rec."Has Voted")
                {
                    ApplicationArea = All;
                }
                field("Voted At"; Rec."Voted At")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
