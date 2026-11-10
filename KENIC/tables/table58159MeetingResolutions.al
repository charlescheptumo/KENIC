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
        field(4; "Resolution Type"; Enum "Resolution Typess")
        {
            Caption = 'Resolution Type';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                Candidate: Record "Resolution Candidates";
            begin
                if (Rec."Resolution Type" = Rec."Resolution Type"::Information) and (Rec."Resolution Status" = Rec."Resolution Status"::Escalated) then
                    Error(InformationCannotEscalateErr);

                if (Rec."Resolution Type" <> xRec."Resolution Type") and (Rec."Voting Status" <> Rec."Voting Status"::"Not Started") then
                    Error(CannotChangeAfterVotingStartedErr);

                if (xRec."Resolution Type" = xRec."Resolution Type"::"Candidate Election") and not Rec.IsCandidateElection() then begin
                    Candidate.SetRange("Resolution No.", Rec."No.");
                    if not Candidate.IsEmpty() then
                        Error(RemoveCandidatesFirstErr);
                end;
            end;
        }
        // field(5; "Committee Id"; Code[20])
        // {
        //     Caption = 'Committee Id';
        //     DataClassification = ToBeClassified;
        //     TableRelation = "Board Committees".Code;
        // }
        field(5; "Committee Id"; Code[20])
        {
            Caption = 'Committee Id';
            DataClassification = ToBeClassified;
            TableRelation = "Board Committees".Code;

            trigger OnValidate()
            begin
                if Rec."Committee Id" = xRec."Committee Id" then
                    exit;

                if Rec."Voting Status" <> Rec."Voting Status"::"Not Started" then
                    Error(CannotChangeAfterVotingStartedErr);


                if Rec."No." = '' then
                    Rec.Insert(true);

                GenerateCommitteeBallots();
            end;
        }
        field(6; "Committee Description"; Text[200])
        {
            Caption = 'Committee Description';
            FieldClass = FlowField;
            CalcFormula = lookup("Board Committees".Description where(Code = field("Committee Id")));
            Editable = false;
        }

        field(8; "Resolution Status"; Option)
        {
            Caption = 'Resolution Status';
            DataClassification = ToBeClassified;
            OptionCaption = 'Raised,Under Discussion,Escalated,Voting Open,Approved,Rejected,Withdrawn,Noted,Elected,Tie - Re-vote Required';
            OptionMembers = Raised,"Under Discussion",Escalated,"Voting Open",Approved,Rejected,Withdrawn,Noted,Elected,"Tie - Re-vote Required";
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
            OptionCaption = ' ,Approved,Rejected,Elected,Tie';
            OptionMembers = " ",Approved,Rejected,Elected,Tie;
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

        }
        field(30; "Seats"; Integer)
        {
            Caption = 'Seats';
            DataClassification = ToBeClassified;
            InitValue = 1;
            MinValue = 1;

            trigger OnValidate()
            begin
                if Rec."Voting Status" <> Rec."Voting Status"::"Not Started" then
                    Error(CannotChangeAfterVotingStartedErr);
            end;
        }
        field(31; "Hide Vote Count"; Boolean)
        {
            Caption = 'Hide Vote Count from Members';
            DataClassification = ToBeClassified;
        }
        field(32; "Elected Candidates"; Text[2048])
        {
            Caption = 'Election Result';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(33; "Ballots Cast"; Integer)
        {
            Caption = 'Ballots Cast';
            FieldClass = FlowField;
            CalcFormula = count("Resolution Votes" where("Resolution No." = field("No."), "Election Voted" = const(true)));
            Editable = false;
        }
        field(34; "No. of Candidates"; Integer)
        {
            Caption = 'No. of Candidates';
            FieldClass = FlowField;
            CalcFormula = count("Resolution Candidates" where("Resolution No." = field("No.")));
            Editable = false;
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
        Candidate: Record "Resolution Candidates";
        Ballot: Record "Election Ballots";
    begin
        Ballot.SetRange("Resolution No.", "No.");
        if not Ballot.IsEmpty() then
            Ballot.DeleteAll();

        Candidate.SetRange("Resolution No.", "No.");
        if not Candidate.IsEmpty() then
            Candidate.DeleteAll(false);

        ResolutionAction.SetRange("Resolution No.", "No.");
        if not ResolutionAction.IsEmpty() then
            ResolutionAction.DeleteAll(true);

        ResolutionVote.SetRange("Resolution No.", "No.");
        if not ResolutionVote.IsEmpty() then
            ResolutionVote.DeleteAll(true);
    end;

    local procedure GenerateCommitteeBallots()
    var
        CommitteeMember: Record "Committee Board Members";
        ResolutionVote: Record "Resolution Votes";
    begin

        ResolutionVote.Reset();
        ResolutionVote.SetRange("Resolution No.", Rec."No.");
        if not ResolutionVote.IsEmpty() then
            ResolutionVote.DeleteAll(true);

        if Rec."Committee Id" = '' then
            exit;

        CommitteeMember.Reset();
        CommitteeMember.SetRange(Committee, Rec."Committee Id");
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
                        ResolutionVote.Insert(true);
                    end;
                end;
            until CommitteeMember.Next() = 0;
    end;

    // procedure EscalateToBoard(FullBoardMeetingCode: Code[20])
    // begin
    //     if Rec."Resolution Type" = Rec."Resolution Type"::Information then
    //         Error(InformationCannotEscalateErr);

    //     if not (Rec."Resolution Status" in [Rec."Resolution Status"::Raised, Rec."Resolution Status"::"Under Discussion"]) then
    //         Error(CannotEscalateFromStatusErr);

    //     if Rec."Majority Type" = Rec."Majority Type"::"Special Majority" then
    //         Rec.TestField("Special Majority Percentage");

    //     GenerateBoardBallots();

    //     Rec."Resolution Status" := Rec."Resolution Status"::Escalated;
    //     Rec."Posted" := true;
    //     Rec.Modify(true);
    //     LogAction(ActionBuffer."Action Taken"::"Escalated to Board", FullBoardMeetingCode, '');

    //     Rec."Voting Status" := Rec."Voting Status"::Open;
    //     Rec."Voting Opened At" := CurrentDateTime();
    //     Rec."Resolution Status" := Rec."Resolution Status"::"Voting Open";
    //     Rec.Modify(true);
    //     LogAction(ActionBuffer."Action Taken"::"Voting Opened", FullBoardMeetingCode, '');
    // end;

    procedure EscalateToBoard()
    var
        ResolutionVote: Record "Resolution Votes";
        MeetingCode: Code[20];
    begin
        if Rec."Resolution Type" = Rec."Resolution Type"::Information then
            Error(InformationCannotEscalateErr);

        if not (Rec."Resolution Status" in [Rec."Resolution Status"::Raised, Rec."Resolution Status"::"Under Discussion"]) then
            Error(CannotEscalateFromStatusErr);

        Rec.TestField("Committee Id");

        if Rec.IsCandidateElection() then
            CheckElectionReady();

        if Rec."Majority Type" = Rec."Majority Type"::"Special Majority" then
            Rec.TestField("Special Majority Percentage");


        ResolutionVote.SetRange("Resolution No.", Rec."No.");
        if ResolutionVote.IsEmpty() then
            Error(NoVotersErr);


        MeetingCode := GetLastKnownMeetingCode();

        Rec."Resolution Status" := Rec."Resolution Status"::Escalated;
        Rec."Posted" := true;
        Rec.Modify(true);
        LogAction(ActionBuffer."Action Taken"::"Escalated to Board", MeetingCode, '');

        Rec."Voting Status" := Rec."Voting Status"::Open;
        Rec."Voting Opened At" := CurrentDateTime();
        Rec."Resolution Status" := Rec."Resolution Status"::"Voting Open";
        Rec.Modify(true);
        LogAction(ActionBuffer."Action Taken"::"Voting Opened", MeetingCode, '');
    end;

    procedure CloseVoting()
    var
        Approved: Boolean;
        OutcomeNotes: Text[2048];
    begin
        if Rec."Voting Status" <> Rec."Voting Status"::Open then
            Error(VotingNotOpenErr);

        if Rec.IsCandidateElection() then begin
            CloseElection();
            exit;
        end;

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

    // local procedure GenerateBoardBallots()
    // var
    //     CommitteeMember: Record "Committee Board Members";
    //     ResolutionVote: Record "Resolution Votes";
    // begin
    //     CommitteeMember.Reset();
    //     CommitteeMember.SetRange(Type, CommitteeMember.Type::Board);
    //     if CommitteeMember.FindSet() then
    //         repeat
    //             if CommitteeMember."Director No" <> '' then begin
    //                 ResolutionVote.Reset();
    //                 ResolutionVote.SetRange("Resolution No.", Rec."No.");
    //                 ResolutionVote.SetRange("Member No.", CommitteeMember."Director No");
    //                 if ResolutionVote.IsEmpty() then begin
    //                     Clear(ResolutionVote);
    //                     ResolutionVote."Resolution No." := Rec."No.";
    //                     ResolutionVote."Member No." := CommitteeMember."Director No";
    //                     ResolutionVote."Member Name" := CommitteeMember.Names;
    //                     ResolutionVote.Insert(false);
    //                 end;
    //             end;
    //         until CommitteeMember.Next() = 0;
    // end;


    procedure IsCandidateElection(): Boolean
    begin
        exit(Rec."Resolution Type" = Rec."Resolution Type"::"Candidate Election");
    end;

    procedure GetSeats(): Integer
    begin
        if Rec.Seats < 1 then
            exit(1);
        exit(Rec.Seats);
    end;

    local procedure CheckElectionReady()
    var
        Candidate: Record "Resolution Candidates";
    begin
        Candidate.SetRange("Resolution No.", Rec."No.");
        Candidate.SetRange("Candidate Name", '');
        if not Candidate.IsEmpty() then
            Error(CandidateNameMissingErr);

        Candidate.SetRange("Candidate Name");
        if Candidate.Count() <= Rec.GetSeats() then
            Error(NotEnoughCandidatesErr, Rec.GetSeats() + 1, Rec.GetSeats());
    end;

    local procedure CloseElection()
    var
        Candidate: Record "Resolution Candidates";
        Votes: List of [Integer];
        SeatCount: Integer;
        Cutoff: Integer;
        AboveCount: Integer;
        AtCount: Integer;
        OpenSeats: Integer;
        i: Integer;
        j: Integer;
        Tmp: Integer;
        ElectedTxt: Text;
        TiedTxt: Text;
        ResultTxt: Text;
        IsTie: Boolean;
    begin
        SeatCount := Rec.GetSeats();

        // Freeze each candidate's total
        Candidate.SetRange("Resolution No.", Rec."No.");
        if Candidate.FindSet() then
            repeat
                Candidate.CalcFields("Vote Count");
                Candidate."Final Votes" := Candidate."Vote Count";
                Candidate.Elected := false;
                Candidate.Modify(false);
                Votes.Add(Candidate."Vote Count");
            until Candidate.Next() = 0;

        // Highest first
        for i := 1 to Votes.Count() - 1 do
            for j := i + 1 to Votes.Count() do
                if Votes.Get(j) > Votes.Get(i) then begin
                    Tmp := Votes.Get(i);
                    Votes.Set(i, Votes.Get(j));
                    Votes.Set(j, Tmp);
                end;

        // Cutoff = votes of the last seat. Nobody is elected with zero votes.
        Cutoff := 0;
        if Votes.Count() >= SeatCount then
            Cutoff := Votes.Get(SeatCount);

        if Cutoff > 0 then begin
            Candidate.SetFilter("Final Votes", '>%1', Cutoff);
            AboveCount := Candidate.Count();
            Candidate.SetRange("Final Votes", Cutoff);
            AtCount := Candidate.Count();
            Candidate.SetRange("Final Votes");
            IsTie := (AboveCount + AtCount) > SeatCount;
        end;

        if Candidate.FindSet() then
            repeat
                if ((Cutoff = 0) and (Candidate."Final Votes" > 0)) or
                   ((Cutoff > 0) and (Candidate."Final Votes" > Cutoff)) or
                   ((Cutoff > 0) and (not IsTie) and (Candidate."Final Votes" = Cutoff))
                then begin
                    Candidate.Elected := true;
                    Candidate.Modify(false);
                    if ElectedTxt <> '' then
                        ElectedTxt += ', ';
                    ElectedTxt += StrSubstNo(CandidateVotesTxt, Candidate."Candidate Name", Candidate."Final Votes");
                end else
                    if IsTie and (Candidate."Final Votes" = Cutoff) then begin
                        if TiedTxt <> '' then
                            TiedTxt += ', ';
                        TiedTxt += StrSubstNo(CandidateVotesTxt, Candidate."Candidate Name", Candidate."Final Votes");
                    end;
            until Candidate.Next() = 0;

        if IsTie then begin
            OpenSeats := SeatCount - AboveCount;
            if ElectedTxt <> '' then
                ResultTxt := StrSubstNo(ElectedResultTxt, ElectedTxt) + '. ';
            ResultTxt += StrSubstNo(TieResultTxt, OpenSeats, TiedTxt);
            Rec."Outcome" := Rec."Outcome"::Tie;
            Rec."Resolution Status" := Rec."Resolution Status"::"Tie - Re-vote Required";
        end else
            if ElectedTxt <> '' then begin
                ResultTxt := StrSubstNo(ElectedResultTxt, ElectedTxt);
                Rec."Outcome" := Rec."Outcome"::Elected;
                Rec."Resolution Status" := Rec."Resolution Status"::Elected;
            end else begin
                ResultTxt := NoVotesResultTxt;
                Rec."Outcome" := Rec."Outcome"::Rejected;
                Rec."Resolution Status" := Rec."Resolution Status"::Rejected;
            end;

        Rec."Elected Candidates" := CopyStr(ResultTxt, 1, MaxStrLen(Rec."Elected Candidates"));
        Rec."Voting Status" := Rec."Voting Status"::Closed;
        Rec."Voting Closed At" := CurrentDateTime();
        Rec.Modify(true);

        LogAction(ActionBuffer."Action Taken"::"Voting Closed", GetLastKnownMeetingCode(), CopyStr(ResultTxt, 1, 2048));
    end;

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
        NoVotersErr: Label 'This resolution has no voters. Select a Committee Id first so its members are added.';
        RemoveCandidatesFirstErr: Label 'Delete the candidates before changing the type from Candidate Election.';
        CandidateNameMissingErr: Label 'Every candidate must have a Candidate Name.';
        NotEnoughCandidatesErr: Label 'A candidate election needs at least %1 candidates for %2 seat(s).', Comment = '%1 = minimum candidates, %2 = seats';
        CandidateVotesTxt: Label '%1 (%2 votes)', Comment = '%1 = candidate name, %2 = votes';
        ElectedResultTxt: Label 'Elected - %1', Comment = '%1 = list of elected candidates';
        TieResultTxt: Label 'Tie for %1 seat(s) between %2 - re-vote required', Comment = '%1 = open seats, %2 = tied candidates';
        NoVotesResultTxt: Label 'No candidate received a vote';
}
