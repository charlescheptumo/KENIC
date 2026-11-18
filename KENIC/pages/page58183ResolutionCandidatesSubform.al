#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
page 58183 "Resolution Candidates Subform"
{
    Caption = 'Candidates';
    PageType = ListPart;
    SourceTable = "Resolution Candidates";
    AutoSplitKey = true;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Director No."; Rec."Director No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Optional. Pick a board member to fill the name automatically, or leave blank for an outside candidate.';
                }
                field("Candidate Name"; Rec."Candidate Name")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Profile"; Rec."Profile")
                {
                    ApplicationArea = All;
                    ToolTip = 'Short profile shown to members on the portal ballot.';
                }
                field("Vote Count"; Rec."Vote Count")
                {
                    ApplicationArea = All;
                    Style = Strong;
                }
                field("Elected"; Rec."Elected")
                {
                    ApplicationArea = All;
                    Style = Favorable;
                    StyleExpr = Rec."Elected";
                }
            }
        }
    }
}
