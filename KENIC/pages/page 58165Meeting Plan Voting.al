#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
page 58165 "Meeting Plan Voting"
{
    Caption = 'My Meeting Date Votes';
    PageType = List;
    SourceTable = "Meeting Date Polls";
    UsageCategory = Tasks;
    ApplicationArea = All;
    Editable = true;

    // NOTE: GetCurrentMemberNo() below is a placeholder. Wire it up to whatever mapping
    // this solution actually uses to link a Business Central user to a "Board Members" record
    // (e.g. a "User ID" field on Board Members, or a User Setup table). Until that mapping is
    // implemented, this page will show no rows to any user, which fails safe rather than
    // showing everyone else's votes.

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Meeting Plan Id"; Rec."Meeting Plan Id")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Proposed Date"; Rec."Proposed Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Has Voted"; Rec."Has Voted")
                {
                    ApplicationArea = All;
                    Caption = 'My Vote';
                }
                field("Voted At"; Rec."Voted At")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        CurrentMemberNo: Code[20];
    begin
        CurrentMemberNo := GetCurrentMemberNo();
        if CurrentMemberNo = '' then
            Error(NoMemberLinkErr);

        Rec.SetRange("Member No.", CurrentMemberNo);
    end;

    local procedure GetCurrentMemberNo(): Code[20]
    var
        BoardMember: Record "Board Members";
    begin
        // TODO: replace with the actual field/table that links a Business Central User ID
        // to a "Board Members" record in this solution.
        // BoardMember.SetRange("User ID", UserId());
        // if BoardMember.FindFirst() then
        //     exit(BoardMember."Personal No");
        exit('');
    end;

    var
        NoMemberLinkErr: Label 'Your Business Central user is not linked to a Board Member record, so you cannot vote. Please contact your administrator.';
}
