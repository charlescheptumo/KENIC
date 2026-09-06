#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
page 58169 "Resolution Actions Subform"
{
    Caption = 'History';
    PageType = ListPart;
    SourceTable = "Resolution Actions";
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Meeting Code"; Rec."Meeting Code")
                {
                    ApplicationArea = All;
                }
                field("Meeting Title"; Rec."Meeting Title")
                {
                    ApplicationArea = All;
                }
                field("Meeting Description"; Rec."Meeting Description")
                {
                    ApplicationArea = All;
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = All;
                    // Only locked for rows the system logged automatically (Escalated to Board,
                    // Voting Opened, Voting Closed, Withdrawn). A manually added row - which
                    // always starts as "Discussed & Agreed" by default - stays editable so it can
                    // be switched to "Deferred" if that's what actually happened.
                    Editable = not IsSystemGenerated;
                }
                field("Chaired By"; Rec."Chaired By")
                {
                    ApplicationArea = All;
                }
                field("Notes"; Rec."Notes")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Action Date"; Rec."Action Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        IsSystemGenerated := Rec."Action Taken" in [
            Rec."Action Taken"::"Escalated to Board",
            Rec."Action Taken"::"Voting Opened",
            Rec."Action Taken"::"Voting Closed",
            Rec."Action Taken"::Withdrawn
        ];
    end;

    var
        IsSystemGenerated: Boolean;
}
