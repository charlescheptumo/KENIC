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
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Title"; Rec."Title")
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                }
                field("Resolution Type"; Rec."Resolution Type")
                {
                    ApplicationArea = All;
                }
                field("Committee Id"; Rec."Committee Id")
                {
                    ApplicationArea = All;
                }
                field("Committee Description"; Rec."Committee Description")
                {
                    ApplicationArea = All;
                }
                field("Raised At Meeting Code"; Rec."Raised At Meeting Code")
                {
                    ApplicationArea = All;
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                }
            }
            group(Voting)
            {
                Caption = 'Voting';

                field("Majority Type"; Rec."Majority Type")
                {
                    ApplicationArea = All;
                }
                field("Special Majority Percentage"; Rec."Special Majority Percentage")
                {
                    ApplicationArea = All;
                    Editable = Rec."Majority Type" = Rec."Majority Type"::"Special Majority";
                }
                field("Voting Meeting Code"; Rec."Voting Meeting Code")
                {
                    ApplicationArea = All;
                }
                field("Voting Status"; Rec."Voting Status")
                {
                    ApplicationArea = All;
                }
                field("Voting Opened At"; Rec."Voting Opened At")
                {
                    ApplicationArea = All;
                }
                field("Voting Closed At"; Rec."Voting Closed At")
                {
                    ApplicationArea = All;
                }
                field("Eligible Voters"; Rec."Eligible Voters")
                {
                    ApplicationArea = All;
                }
                field("For Votes"; Rec."For Votes")
                {
                    ApplicationArea = All;
                }
                field("Against Votes"; Rec."Against Votes")
                {
                    ApplicationArea = All;
                }
                field("Abstain Votes"; Rec."Abstain Votes")
                {
                    ApplicationArea = All;
                }
                field("Outcome"; Rec."Outcome")
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
                Enabled = (Rec."Resolution Type" <> Rec."Resolution Type"::Information) and
                          (Rec."Status" in [Rec."Status"::Raised, Rec."Status"::"Under Discussion"]);

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
                Enabled = (Rec."Status" = Rec."Status"::Escalated) and (Rec."Voting Status" = Rec."Voting Status"::"Not Started");

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
                Enabled = Rec."Voting Status" = Rec."Voting Status"::Open;

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
                Enabled = Rec."Voting Status" <> Rec."Voting Status"::Closed;

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
                Enabled = (Rec."Resolution Type" = Rec."Resolution Type"::Information) and
                          not (Rec."Status" in [Rec."Status"::Approved, Rec."Status"::Rejected, Rec."Status"::Withdrawn, Rec."Status"::Noted]);

                trigger OnAction()
                begin
                    Rec.MarkNoted();
                    CurrPage.Update(false);
                end;
            }
        }
    }
}
