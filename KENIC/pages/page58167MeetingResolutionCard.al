#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
page 58167 "Meeting Resolution Card"
{
    Caption = 'Meeting Resolution';
    PageType = Document;
    SourceTable = "Meeting Resolutions";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(ControlNo; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(ControlTitle; Rec."Title")
                {
                    ApplicationArea = All;
                }
                field(ControlDescription; Rec."Description")
                {
                    ApplicationArea = All;
                }
                field(ControlResolutionType; Rec."Resolution Type")
                {
                    ApplicationArea = All;
                }
                field(ControlCommitteeId; Rec."Committee Id")
                {
                    ApplicationArea = All;
                }
                field(ControlCommitteeDescription; Rec."Committee Description")
                {
                    ApplicationArea = All;
                }
                field(ControlRaisedAtMeetingCode; Rec."Raised At Meeting Code")
                {
                    ApplicationArea = All;
                }
                field(ControlResolutionStatus; Rec."Resolution Status")
                {
                    ApplicationArea = All;
                }
            }
            group(Voting)
            {
                Caption = 'Voting';

                field(ControlMajorityType; Rec."Majority Type")
                {
                    ApplicationArea = All;
                }
                field(ControlSpecialMajorityPercentage; Rec."Special Majority Percentage")
                {
                    ApplicationArea = All;
                    Editable = Rec."Majority Type" = Rec."Majority Type"::"Special Majority";
                }
                field(ControlVotingMeetingCode; Rec."Voting Meeting Code")
                {
                    ApplicationArea = All;
                }
                field(ControlVotingStatus; Rec."Voting Status")
                {
                    ApplicationArea = All;
                }
                field(ControlVotingOpenedAt; Rec."Voting Opened At")
                {
                    ApplicationArea = All;
                }
                field(ControlVotingClosedAt; Rec."Voting Closed At")
                {
                    ApplicationArea = All;
                }
                field(ControlEligibleVoters; Rec."Eligible Voters")
                {
                    ApplicationArea = All;
                }
                field(ControlForVotes; Rec."For Votes")
                {
                    ApplicationArea = All;
                }
                field(ControlAgainstVotes; Rec."Against Votes")
                {
                    ApplicationArea = All;
                }
                field(ControlAbstainVotes; Rec."Abstain Votes")
                {
                    ApplicationArea = All;
                }
                field(ControlOutcome; Rec."Outcome")
                {
                    ApplicationArea = All;
                }
            }
            part(History; "Resolution Actions Subform")
            {
                Caption = 'History';
                ApplicationArea = All;
                SubPageLink = "Resolution No." = field("No.");
            }
            part(Votes; "Resolution Votes Subform")
            {
                Caption = 'Votes';
                ApplicationArea = All;
                SubPageLink = "Resolution No." = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(EscalateToBoard)
            {
                Caption = 'Escalate to Board';
                ApplicationArea = All;
                Image = Approve;
                Enabled = CanEscalate;

                trigger OnAction()
                var
                    BoardMeeting: Record "Board Meetings";
                    FullBoardMeetingCode: Code[20];
                begin
                    BoardMeeting.SetRange("Meeting Type", BoardMeeting."Meeting Type"::Board);
                    if Page.RunModal(0, BoardMeeting) = Action::LookupOK then
                        FullBoardMeetingCode := BoardMeeting.No;

                    Rec.EscalateToBoard(FullBoardMeetingCode);
                    CurrPage.Update(false);
                end;
            }
            action(OpenVoting)
            {
                Caption = 'Open Voting';
                ApplicationArea = All;
                Image = Start;
                Enabled = CanOpenVoting;

                trigger OnAction()
                begin
                    Rec.OpenVoting();
                    CurrPage.Update(false);
                end;
            }
            action(CloseVoting)
            {
                Caption = 'Close Voting';
                ApplicationArea = All;
                Image = Stop;
                Enabled = CanCloseVoting;

                trigger OnAction()
                begin
                    Rec.CloseVoting();
                    CurrPage.Update(false);
                end;
            }
            action(Withdraw)
            {
                Caption = 'Withdraw';
                ApplicationArea = All;
                Image = Cancel;
                Enabled = CanWithdraw;

                trigger OnAction()
                begin
                    Rec.Withdraw();
                    CurrPage.Update(false);
                end;
            }
            action(MarkNoted)
            {
                Caption = 'Mark Noted';
                ApplicationArea = All;
                Image = Approve;
                Enabled = CanMarkNoted;

                trigger OnAction()
                begin
                    Rec.MarkNoted();
                    CurrPage.Update(false);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetControlStates();
    end;

    local procedure SetControlStates()
    begin
        CanEscalate := (Rec."Resolution Type" <> Rec."Resolution Type"::Information) and
                       (Rec."Resolution Status" in [Rec."Resolution Status"::Raised, Rec."Resolution Status"::"Under Discussion"]);

        CanOpenVoting := (Rec."Resolution Status" = Rec."Resolution Status"::Escalated) and 
                         (Rec."Voting Status" = Rec."Voting Status"::"Not Started");

        CanCloseVoting := Rec."Voting Status" = Rec."Voting Status"::Open;

        CanWithdraw := Rec."Voting Status" <> Rec."Voting Status"::Closed;

        CanMarkNoted := (Rec."Resolution Type" = Rec."Resolution Type"::Information) and
                        not (Rec."Resolution Status" in [
                            Rec."Resolution Status"::Approved, 
                            Rec."Resolution Status"::Rejected, 
                            Rec."Resolution Status"::Withdrawn, 
                            Rec."Resolution Status"::Noted
                        ]);
    end;

    var
        CanEscalate: Boolean;
        CanOpenVoting: Boolean;
        CanCloseVoting: Boolean;
        CanWithdraw: Boolean;
        CanMarkNoted: Boolean;
}