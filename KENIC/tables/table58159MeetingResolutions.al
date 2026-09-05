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
                if (Rec."Resolution Type" = Rec."Resolution Type"::Information) and (Rec."Status" = Rec."Status"::Escalated) then
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
        field(7; "Raised At Meeting Code"; Code[20])
        {
            Caption = 'Raised At Meeting Code';
            DataClassification = ToBeClassified;
            TableRelation = "Board Meetings".No;
        }
        field(8; "Status"; Option)
        {
            Caption = 'Status';
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
        field(11; "Voting Meeting Code"; Code[20])
        {
            Caption = 'Voting Meeting Code';
            DataClassification = ToBeClassified;
            TableRelation = "Board Meetings".No;
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
        fieldgroup(DropDown; "No.", "Title", "Resolution Type", "Status")
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
        "Status" := "Status"::Raised;
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

    procedure EscalateToBoard(FullBoardMeetingCode: Code[20])
    begin
        if Rec."Resolution Type" = Rec."Resolution Type"::Information then
            Error(InformationCannotEscalateErr);

        if not (Rec."Status" in [Rec."Status"::Raised, Rec."Status"::"Under Discussion"]) then
            Error(CannotEscalateFromStatusErr);

        Rec."Voting Meeting Code" := FullBoardMeetingCode;
        Rec."Status" := Rec."Status"::Escalated;
        Rec.Modify(true);

        LogAction(ActionBuffer."Action Taken"::"Escalated to Board", FullBoardMeetingCode, '');
    end;

    procedure OpenVoting()
    begin
        if Rec."Status" <> Rec."Status"::Escalated then
            Error(MustBeEscalatedErr);

        if Rec."Voting Status" <> Rec."Voting Status"::"Not Started" then
            Error(VotingAlreadyStartedErr);

        if Rec."Majority Type" = Rec."Majority Type"::"Special Majority" then
            Rec.TestField("Special Majority Percentage");

        GenerateBoardBallots();

        Rec."Voting Status" := Rec."Voting Status"::Open;
        Rec."Voting Opened At" := CurrentDateTime();
        Rec."Status" := Rec."Status"::"Voting Open";
        Rec.Modify(true);

        LogAction(ActionBuffer."Action Taken"::"Voting Opened", Rec."Voting Meeting Code", '');
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
            Rec."Status" := Rec."Status"::Approved;
        end else begin
            Rec."Outcome" := Rec."Outcome"::Rejected;
            Rec."Status" := Rec."Status"::Rejected;
        end;
        Rec.Modify(true);

        OutcomeNotes := StrSubstNo(VoteTallyTxt, Rec."For Votes", Rec."Against Votes", Rec."Abstain Votes");
        LogAction(ActionBuffer."Action Taken"::"Voting Closed", Rec."Voting Meeting Code", OutcomeNotes);
    end;

    procedure Withdraw()
    begin
        if Rec."Voting Status" = Rec."Voting Status"::Closed then
            Error(CannotWithdrawAfterVotingClosedErr);

        Rec."Status" := Rec."Status"::Withdrawn;
        Rec.Modify(true);

        LogAction(ActionBuffer."Action Taken"::Withdrawn, Rec."Voting Meeting Code", '');
    end;

    procedure MarkNoted()
    begin
        if Rec."Resolution Type" <> Rec."Resolution Type"::Information then
            Error(OnlyInformationCanBeNotedErr);

        if Rec."Status" in [Rec."Status"::Approved, Rec."Status"::Rejected, Rec."Status"::Withdrawn, Rec."Status"::Noted] then
            Error(AlreadyFinalizedErr);

        Rec."Status" := Rec."Status"::Noted;
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
        MustBeEscalatedErr: Label 'The resolution must be escalated to the Full Board before voting can be opened.';
        VotingAlreadyStartedErr: Label 'Voting has already been started for this resolution.';
        VotingNotOpenErr: Label 'Voting is not currently open for this resolution.';
        CannotWithdrawAfterVotingClosedErr: Label 'You cannot withdraw a resolution after voting has closed.';
        OnlyInformationCanBeNotedErr: Label 'Only Information-type resolutions can be marked Noted.';
        AlreadyFinalizedErr: Label 'This resolution has already reached a final status.';
        CannotChangeAfterVotingStartedErr: Label 'You cannot change this once voting has started or closed.';
        VoteTallyTxt: Label 'For: %1, Against: %2, Abstain: %3', Comment = '%1 = For votes, %2 = Against votes, %3 = Abstain votes';
}