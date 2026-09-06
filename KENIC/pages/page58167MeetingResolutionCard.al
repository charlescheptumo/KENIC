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
                    Editable = not Rec."Posted";

                    trigger OnValidate()
                    begin
                        SetControlStates();
                    end;
                }
                field(ControlCommitteeId; Rec."Committee Id")
                {
                    ApplicationArea = All;
                    Editable = not Rec."Posted";
                }
                field(ControlCommitteeDescription; Rec."Committee Description")
                {
                    ApplicationArea = All;
                }
                field(ControlResolutionStatus; Rec."Resolution Status")
                {
                    ApplicationArea = All;
                }
                field(ControlPosted; Rec."Posted")
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
                    Editable = not Rec."Posted";

                    trigger OnValidate()
                    begin
                        SetControlStates();
                    end;
                }
                field(ControlSpecialMajorityPercentage; Rec."Special Majority Percentage")
                {
                    ApplicationArea = All;
                    Editable = SpecialMajorityEditable;
                }
                field(ControlVotingStatus; Rec."Voting Status")
                {
                    ApplicationArea = All;
                }
                field(ControlVotingOpenedAt; Rec."Voting Opened At")
                {
                    ApplicationArea = All;
                }
                field(ControlVotingDeadline; Rec."Voting Deadline")
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
        area(factboxes)
        {
            systempart(BoardMeetingLinks; Links)
            {
                ApplicationArea = RecordLinks;
                Caption = 'Resolution Document Links';
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("Functions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(UploadDocument)
                {
                    ApplicationArea = All;
                    Caption = 'Upload Resolution Documents';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Upload supporting papers for this resolution (proposal, amendments, board pack) to SharePoint.';
                    trigger OnAction()
                    var
                        DMSManagement: Codeunit "DMS Management";
                    begin
                        Rec.TestField("No.");
                        DMSManagement.UploadBoardMeetingDocuments(Rec."No.", 'Meeting Resolutions', Rec.RecordId);
                    end;
                }
            }
            action(EscalateToBoard)
            {
                Caption = 'Escalate to Board';
                ApplicationArea = All;
                Image = Approve;
                ToolTip = 'Escalates this resolution to the Full Board and opens voting in one step. This also posts the resolution and locks its type, committee, and majority settings.';
                Enabled = CanEscalate;

                trigger OnAction()
                var
                    BoardMeeting: Record "Board Meetings";
                    FullBoardMeetingCode: Code[20];
                begin
                    BoardMeeting.SetRange("Meeting Type", BoardMeeting."Meeting Type"::Board);
                    if Page.RunModal(Page::"Board Meetings List", BoardMeeting) = Action::LookupOK then
                        FullBoardMeetingCode := BoardMeeting.No;

                    Rec.EscalateToBoard(FullBoardMeetingCode);
                    SetControlStates();
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
                    SetControlStates();
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
                    SetControlStates();
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
                    SetControlStates();
                    CurrPage.Update(false);
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        DeadlineEnforcer: Codeunit "Resolution Deadline Enforcer";
    begin
        DeadlineEnforcer.CloseOverdueResolutions();
        SetControlStates();
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlStates();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        SetControlStates();
    end;

    /// <summary>
    /// All conditional Enabled/Editable logic lives here, as plain boolean variables computed in
    /// code - never as inline "in [...]" expressions directly on a page property. That inline
    /// pattern is what caused the "identifier 'XxxNN' could not be found" errors earlier; moving
    /// the same logic into a procedure body avoids it entirely. Called on open, on every record
    /// change, on every relevant field edit, and explicitly after every action - so the buttons
    /// never go stale without needing to close and reopen the card.
    /// </summary>
    local procedure SetControlStates()
    begin
        CanEscalate := (Rec."Resolution Type" <> Rec."Resolution Type"::Information) and
                       (Rec."Resolution Status" in [Rec."Resolution Status"::Raised, Rec."Resolution Status"::"Under Discussion"]);

        CanCloseVoting := Rec."Voting Status" = Rec."Voting Status"::Open;

        CanWithdraw := Rec."Voting Status" <> Rec."Voting Status"::Closed;

        CanMarkNoted := (Rec."Resolution Type" = Rec."Resolution Type"::Information) and
                        not (Rec."Resolution Status" in [
                            Rec."Resolution Status"::Approved,
                            Rec."Resolution Status"::Rejected,
                            Rec."Resolution Status"::Withdrawn,
                            Rec."Resolution Status"::Noted
                        ]);

        SpecialMajorityEditable := (Rec."Majority Type" = Rec."Majority Type"::"Special Majority") and not Rec."Posted";
    end;

    var
        CanEscalate: Boolean;
        CanCloseVoting: Boolean;
        CanWithdraw: Boolean;
        CanMarkNoted: Boolean;
        SpecialMajorityEditable: Boolean;
}
