#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
table 58159 "Meeting Resolutions"
{
    Caption = 'Meeting Resolutions';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Title"; Text[250])
        {
            Caption = 'Title';
            DataClassification = ToBeClassified;
        }
        field(3; "Description"; Text[2048])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(4; "Resolution Type"; Option)
        {
            Caption = 'Resolution Type';
            DataClassification = ToBeClassified;
            OptionCaption = 'Election,Selection,Information,Approval';
            OptionMembers = Election,Selection,Information,Approval;

            trigger OnValidate()
            begin
                if (Rec."Resolution Type" = Rec."Resolution Type"::Information) and (Rec."Resolution Status" = Rec."Resolution Status"::Escalated) then
                    Error(InformationCannotEscalateErr);
            end;
        }
        field(5; "Committee Id"; Code[20])
        {
            Caption = 'Committee Id';
            DataClassification = ToBeClassified;
            TableRelation = "Board Committees".Code;
        }
        field(6; "Committee Description"; Text[200])
        {
            Caption = 'Committee Description';
            FieldClass = FlowField;
            CalcFormula = lookup("Board Committees".Description where(Code = field("Committee Id")));
            Editable = false;
        }
        // field(7; "Raised At Meeting Code") removed - which meeting a resolution was raised or
        // discussed at is now tracked entirely via Resolution Actions rows (see GetLastKnownMeetingCode),
        // so it isn't duplicated as a stored header field.
        field(8; "Resolution Status"; Option)
        {
            Caption = 'Resolution Status';
            DataClassification = ToBeClassified;
            OptionCaption = 'Raised,Under Discussion,Escalated,Voting Open,Approved,Rejected,Withdrawn,Noted';
            OptionMembers = Raised,"Under Discussion",Escalated,"Voting Open",Approved,Rejected,Withdrawn,Noted;
            Editable = false;
        }
        field(9; "Majority Type"; Option)
        {
            Caption = 'Majority Type';
            DataClassification = ToBeClassified;
            OptionCaption = 'Simple Majority,Special Majority,Unanimous';
            OptionMembers = "Simple Majority","Special Majority",Unanimous;
            InitValue = "Simple Majority";

            trigger OnValidate()
            begin
                if Rec."Voting Status" <> Rec."Voting Status"::"Not Started" then
                    Error(CannotChangeAfterVotingStartedErr);
            end;
        }
        field(10; "Special Majority Percentage"; Decimal)
        {
            Caption = 'Special Majority Percentage';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
            MinValue = 50;
            MaxValue = 100;

            trigger OnValidate()
            begin
                if Rec."Voting Status" <> Rec."Voting Status"::"Not Started" then
                    Error(CannotChangeAfterVotingStartedErr);
            end;
        }
        // field(11; "Voting Meeting Code") removed - same reasoning as "Raised At Meeting Code"
        // above. EscalateToBoard() still accepts a meeting code and logs it on the Resolution
        // Actions row; later steps (OpenVoting/CloseVoting/Withdraw) look it back up from there
        // via GetLastKnownMeetingCode() rather than duplicating it in a header field.
        field(12; "Voting Status"; Option)
        {
            Caption = 'Voting Status';
            DataClassification = ToBeClassified;
            OptionCaption = 'Not Started,Open,Closed';
            OptionMembers = "Not Started",Open,Closed;
            Editable = false;
        }
        field(13; "Voting Opened At"; DateTime)
        {
            Caption = 'Voting Opened At';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Voting Closed At"; DateTime)
        {
            Caption = 'Voting Closed At';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(24; "Voting Deadline"; DateTime)
        {
            // Optional. Editable any time up until voting actually closes - unlike the other
            // setup fields, extending a deadline for low turnout is a normal thing to want to do
            // even after voting has opened, so it isn't locked by "Posted".
            Caption = 'Voting Deadline';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Rec."Voting Status" = Rec."Voting Status"::Closed then
                    Error(CannotChangeDeadlineAfterClosedErr);

                if (Rec."Voting Deadline" <> 0DT) and (Rec."Voting Deadline" <= CurrentDateTime()) then
                    Error(DeadlineMustBeFutureErr);
            end;
        }
        field(15; "Outcome"; Option)
        {
            Caption = 'Outcome';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Approved,Rejected';
            OptionMembers = " ",Approved,Rejected;
            Editable = false;
        }
        field(16; "For Votes"; Integer)
        {
            Caption = 'For Votes';
            FieldClass = FlowField;
            CalcFormula = count("Resolution Votes" where("Resolution No." = field("No."), Vote = const(For)));
            Editable = false;
        }
        field(17; "Against Votes"; Integer)
        {
            Caption = 'Against Votes';
            FieldClass = FlowField;
            CalcFormula = count("Resolution Votes" where("Resolution No." = field("No."), Vote = const(Against)));
            Editable = false;
        }
        field(18; "Abstain Votes"; Integer)
        {
            Caption = 'Abstain Votes';
            FieldClass = FlowField;
            CalcFormula = count("Resolution Votes" where("Resolution No." = field("No."), Vote = const(Abstain)));
            Editable = false;
        }
        field(19; "Eligible Voters"; Integer)
        {
            Caption = 'Eligible Voters';
            FieldClass = FlowField;
            CalcFormula = count("Resolution Votes" where("Resolution No." = field("No.")));
            Editable = false;
        }
        field(20; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; "Created At"; DateTime)
        {
            Caption = 'Created At';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(23; "Posted"; Boolean)
        {
            Caption = 'Posted';
            DataClassification = ToBeClassified;
            Editable = false;
            // Set true the moment the resolution is escalated to the Full Board (see
            // EscalateToBoard). A simple, always-visible signal that this resolution has left
            // committee-level discussion, independent of its more granular Resolution Status.
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", "Title", "Resolution Type", "Resolution Status")
        {
        }
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            HRSet.Get();
            HRSet.TestField("Resolution Nos.");
            "No." := NoSeriesMgt.GetNextNo(HRSet."Resolution Nos.", WorkDate(), true);
        end;

        "Created By" := UserId();
        "Created At" := CurrentDateTime();
        "Resolution Status" := "Resolution Status"::Raised;
        "Voting Status" := "Voting Status"::"Not Started";
        "Outcome" := "Outcome"::" ";
    end;

    trigger OnDelete()
    var
        ResolutionAction: Record "Resolution Actions";
        ResolutionVote: Record "Resolution Votes";
    begin
        ResolutionAction.SetRange("Resolution No.", "No.");
        if not ResolutionAction.IsEmpty() then
            ResolutionAction.DeleteAll(true);

        ResolutionVote.SetRange("Resolution No.", "No.");
        if not ResolutionVote.IsEmpty() then
            ResolutionVote.DeleteAll(true);
    end;

    /// <summary>
    /// Escalates the resolution to the Full Board and opens voting in one atomic step: picks up
    /// the meeting once, generates a ballot for every current Board member, and opens voting
    /// immediately. There is deliberately no separate "Open Voting" step - once escalated, a
    /// resolution is posted and its core setup fields (Resolution Type, Committee Id, Majority
    /// Type, Special Majority Percentage) lock, per the Card's Editable rules.
    /// </summary>
    procedure EscalateToBoard(FullBoardMeetingCode: Code[20])
    begin
        if Rec."Resolution Type" = Rec."Resolution Type"::Information then
            Error(InformationCannotEscalateErr);

        if not (Rec."Resolution Status" in [Rec."Resolution Status"::Raised, Rec."Resolution Status"::"Under Discussion"]) then
            Error(CannotEscalateFromStatusErr);

        if Rec."Majority Type" = Rec."Majority Type"::"Special Majority" then
            Rec.TestField("Special Majority Percentage");

        GenerateBoardBallots();

        Rec."Resolution Status" := Rec."Resolution Status"::Escalated;
        Rec."Posted" := true;
        Rec.Modify(true);
        LogAction(ActionBuffer."Action Taken"::"Escalated to Board", FullBoardMeetingCode, '');

        Rec."Voting Status" := Rec."Voting Status"::Open;
        Rec."Voting Opened At" := CurrentDateTime();
        Rec."Resolution Status" := Rec."Resolution Status"::"Voting Open";
        Rec.Modify(true);
        LogAction(ActionBuffer."Action Taken"::"Voting Opened", FullBoardMeetingCode, '');
    end;

    procedure CloseVoting()
    var
        Approved: Boolean;
        OutcomeNotes: Text[2048];
    begin
        if Rec."Voting Status" <> Rec."Voting Status"::Open then
            Error(VotingNotOpenErr);

        Rec.CalcFields("For Votes", "Against Votes", "Abstain Votes");
        Approved := DetermineOutcome();

        Rec."Voting Status" := Rec."Voting Status"::Closed;
        Rec."Voting Closed At" := CurrentDateTime();
        if Approved then begin
            Rec."Outcome" := Rec."Outcome"::Approved;
            Rec."Resolution Status" := Rec."Resolution Status"::Approved;
        end else begin
            Rec."Outcome" := Rec."Outcome"::Rejected;
            Rec."Resolution Status" := Rec."Resolution Status"::Rejected;
        end;
        Rec.Modify(true);

        OutcomeNotes := StrSubstNo(VoteTallyTxt, Rec."For Votes", Rec."Against Votes", Rec."Abstain Votes");
        LogAction(ActionBuffer."Action Taken"::"Voting Closed", GetLastKnownMeetingCode(), OutcomeNotes);
    end;

    procedure Withdraw()
    begin
        if Rec."Voting Status" = Rec."Voting Status"::Closed then
            Error(CannotWithdrawAfterVotingClosedErr);

        Rec."Resolution Status" := Rec."Resolution Status"::Withdrawn;
        Rec.Modify(true);

        LogAction(ActionBuffer."Action Taken"::Withdrawn, GetLastKnownMeetingCode(), '');
    end;

    procedure MarkNoted()
    begin
        if Rec."Resolution Type" <> Rec."Resolution Type"::Information then
            Error(OnlyInformationCanBeNotedErr);

        if Rec."Resolution Status" in [Rec."Resolution Status"::Approved, Rec."Resolution Status"::Rejected, Rec."Resolution Status"::Withdrawn, Rec."Resolution Status"::Noted] then
            Error(AlreadyFinalizedErr);

        Rec."Resolution Status" := Rec."Resolution Status"::Noted;
        Rec.Modify(true);
    end;

    local procedure DetermineOutcome(): Boolean
    var
        DecisiveVotes: Integer;
    begin
        DecisiveVotes := Rec."For Votes" + Rec."Against Votes";

        case Rec."Majority Type" of
            Rec."Majority Type"::"Simple Majority":
                exit(Rec."For Votes" > Rec."Against Votes");
            Rec."Majority Type"::"Special Majority":
                begin
                    if DecisiveVotes = 0 then
                        exit(false);
                    exit((Rec."For Votes" / DecisiveVotes) * 100 >= Rec."Special Majority Percentage");
                end;
            Rec."Majority Type"::Unanimous:
                exit((Rec."For Votes" > 0) and (Rec."Against Votes" = 0));
        end;

        exit(false);
    end;

    local procedure GenerateBoardBallots()
    var
        CommitteeMember: Record "Committee Board Members";
        ResolutionVote: Record "Resolution Votes";
    begin
        CommitteeMember.Reset();
        CommitteeMember.SetRange(Type, CommitteeMember.Type::Board);
        if CommitteeMember.FindSet() then
            repeat
                if CommitteeMember."Director No" <> '' then begin
                    ResolutionVote.Reset();
                    ResolutionVote.SetRange("Resolution No.", Rec."No.");
                    ResolutionVote.SetRange("Member No.", CommitteeMember."Director No");
                    if ResolutionVote.IsEmpty() then begin
                        Clear(ResolutionVote);
                        ResolutionVote."Resolution No." := Rec."No.";
                        ResolutionVote."Member No." := CommitteeMember."Director No";
                        ResolutionVote."Member Name" := CommitteeMember.Names;
                        ResolutionVote.Insert(false);
                    end;
                end;
            until CommitteeMember.Next() = 0;
    end;

    /// <summary>
    /// Looks up the most recent meeting code logged against this resolution in Resolution
    /// Actions (typically set when it was escalated). Used so later steps (Open/Close Voting,
    /// Withdraw) can keep logging against the same meeting without it being duplicated as a
    /// separate stored field on the header.
    /// </summary>
    local procedure GetLastKnownMeetingCode(): Code[20]
    var
        ResolutionAction: Record "Resolution Actions";
    begin
        ResolutionAction.SetRange("Resolution No.", Rec."No.");
        ResolutionAction.SetFilter("Meeting Code", '<>%1', '');
        if ResolutionAction.FindLast() then
            exit(ResolutionAction."Meeting Code");

        exit('');
    end;

    local procedure LogAction(ActionTaken: Option "Discussed & Agreed",Deferred,"Escalated to Board","Voting Opened","Voting Closed",Withdrawn; MeetingCode: Code[20]; Notes: Text[2048])
    var
        ResolutionAction: Record "Resolution Actions";
    begin
        Clear(ResolutionAction);
        ResolutionAction."Resolution No." := Rec."No.";
        ResolutionAction."Meeting Code" := MeetingCode;
        ResolutionAction."Action Taken" := ActionTaken;
        ResolutionAction."Notes" := Notes;
        ResolutionAction.Insert(true);
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        HRSet: Record "Human Resources Setup";
        ActionBuffer: Record "Resolution Actions";
        InformationCannotEscalateErr: Label 'Information items are never escalated for voting. Use Mark Noted instead.';
        CannotEscalateFromStatusErr: Label 'This resolution cannot be escalated from its current status.';
        VotingNotOpenErr: Label 'Voting is not currently open for this resolution.';
        CannotChangeDeadlineAfterClosedErr: Label 'You cannot change the voting deadline after voting has closed.';
        DeadlineMustBeFutureErr: Label 'The voting deadline must be in the future.';
        CannotWithdrawAfterVotingClosedErr: Label 'You cannot withdraw a resolution after voting has closed.';
        OnlyInformationCanBeNotedErr: Label 'Only Information-type resolutions can be marked Noted.';
        AlreadyFinalizedErr: Label 'This resolution has already reached a final status.';
        CannotChangeAfterVotingStartedErr: Label 'You cannot change this once voting has started or closed.';
        VoteTallyTxt: Label 'For: %1, Against: %2, Abstain: %3', Comment = '%1 = For votes, %2 = Against votes, %3 = Abstain votes';
}
