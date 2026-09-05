#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
page 58170 "Resolution Votes Subform"
{
    Caption = 'Resolution Votes';
    PageType = ListPart;
    SourceTable = "Resolution Votes";
    ApplicationArea = All;

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
                field("Vote"; Rec."Vote")
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