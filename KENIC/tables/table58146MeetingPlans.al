#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
table 58146 "Meeting Plans"
{
    Caption = 'Meeting Plans';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Id"; Code[20])
        {
            Caption = 'Id';
            DataClassification = ToBeClassified;
        }
        field(2; "Committee Id"; Code[20])
        {
            Caption = 'Committee Id';
            DataClassification = ToBeClassified;
            TableRelation = "Board Committees".Code;

            trigger OnValidate()
            begin
                CalcFields("Committee Description");

                if (Rec."Committee Id" <> xRec."Committee Id") and (xRec."Committee Id" <> '') then begin
                    if Rec."Voting Status" <> Rec."Voting Status"::"Not Started" then
                        Error(CannotChangeCommitteeErr);

                    RegeneratePollVotes();
                end;
            end;
        }
        field(3; "Committee Description"; Text[200])
        {
            Caption = 'Committee Description';
            FieldClass = FlowField;
            CalcFormula = lookup("Board Committees".Description where(Code = field("Committee Id")));
            Editable = false;
        }
        field(4; "Year"; Integer)
        {
            Caption = 'Year';
            DataClassification = ToBeClassified;
        }
        field(5; "Quarter"; Option)
        {
            Caption = 'Quarter';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Q1,Q2,Q3,Q4';
            OptionMembers = " ",Q1,Q2,Q3,Q4;
        }
        field(6; "Title"; Text[250])
        {
            Caption = 'Title';
            DataClassification = ToBeClassified;
        }
        field(7; "Description"; Text[2048])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(8; "Status"; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            OptionCaption = 'Draft,Posted,Approved,Cancelled,Completed,Closed';
            OptionMembers = Draft,Posted,Approved,Cancelled,Completed,Closed;
        }
        field(9; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = User."User Name";
        }
        field(10; "Created At"; DateTime)
        {
            Caption = 'Created At';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(12; "Posted"; Boolean)
        {
            Caption = 'Posted';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Voting Status"; Option)
        {
            Caption = 'Voting Status';
            DataClassification = ToBeClassified;
            OptionCaption = 'Not Started,Open,Closed';
            OptionMembers = "Not Started",Open,Closed;
            Editable = false;
        }
        field(14; "Allow Multiple Date Votes"; Boolean)
        {
            Caption = 'Allow Multiple Date Votes';
            DataClassification = ToBeClassified;
            InitValue = true;

            trigger OnValidate()
            begin
                if Rec."Voting Status" <> Rec."Voting Status"::"Not Started" then
                    Error(CannotChangeVoteModeErr);
            end;
        }
        field(15; "Poll Opened At"; DateTime)
        {
            Caption = 'Poll Opened At';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16; "Poll Closed At"; DateTime)
        {
            Caption = 'Poll Closed At';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17; "Selected Meeting Date Option Id"; Integer)
        {
            Caption = 'Selected Meeting Date Option Id';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Meeting Date Options"."Id" where("Meeting Plan Id" = field("Id"));
        }
        field(18; "Selected Meeting Date"; Date)
        {
            Caption = 'Selected Meeting Date';
            FieldClass = FlowField;
            CalcFormula = lookup("Meeting Date Options"."Proposed Date" where("Meeting Plan Id" = field("Id"),
                                                                               "Id" = field("Selected Meeting Date Option Id")));
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Id", "Title", "Committee Id", "Year", "Quarter")
        {
        }
    }

    trigger OnInsert()
    begin
        if "Id" = '' then begin
            HRSet.Get();
            HRSet.TestField("Meeting Plan Nos.");
            "Id" := NoSeriesMgt.GetNextNo(HRSet."Meeting Plan Nos.", WorkDate(), true);
        end;

        "Created By" := UserId();
        "Created At" := CurrentDateTime();
        "Voting Status" := "Voting Status"::"Not Started";
    end;

    trigger OnDelete()
    var
        DateOption: Record "Meeting Date Options";
        DatePoll: Record "Meeting Date Polls";
    begin
        DateOption.Reset();
        DateOption.SetRange("Meeting Plan Id", "Id");
        if not DateOption.IsEmpty() then
            DateOption.DeleteAll(true);

        DatePoll.Reset();
        DatePoll.SetRange("Meeting Plan Id", "Id");
        if not DatePoll.IsEmpty() then
            DatePoll.DeleteAll(true);
    end;

    /// <summary>
    /// Generates one poll row per eligible committee member for a single Meeting Date Option.
    /// Called from Meeting Date Options.OnInsert whenever a new proposed date is added.
    /// </summary>
    procedure CreatePollsForOption(OptionId: Integer)
    var
        CommitteeMember: Record "Committee Board Members";
        DatePoll: Record "Meeting Date Polls";
    begin
        if (Rec."Id" = '') or (Rec."Committee Id" = '') then
            exit;

        CommitteeMember.Reset();
        CommitteeMember.SetRange(Committee, Rec."Committee Id");
        if CommitteeMember.FindSet() then
            repeat
                if CommitteeMember."Director No" <> '' then begin
                    DatePoll.Reset();
                    DatePoll.SetRange("Meeting Plan Id", Rec."Id");
                    DatePoll.SetRange("Meeting Date Option Id", OptionId);
                    DatePoll.SetRange("Member No.", CommitteeMember."Director No");

                    if DatePoll.IsEmpty() then begin
                        Clear(DatePoll);
                        DatePoll."Meeting Plan Id" := Rec."Id";
                        DatePoll."Meeting Date Option Id" := OptionId;
                        DatePoll."Member No." := CommitteeMember."Director No";
                        DatePoll."Member Name" := CommitteeMember.Names;
                        DatePoll."Has Voted" := false;
                        DatePoll.Insert(false);
                    end;
                end;
            until CommitteeMember.Next() = 0;
    end;

    /// <summary>
    /// Rebuilds every poll row for every existing date option against the current committee.
    /// Only intended to run when the Committee itself changes on a plan that has no votes yet
    /// (guarded by the "Not Started" check in the "Committee Id" OnValidate trigger).
    /// </summary>
    local procedure RegeneratePollVotes()
    var
        DateOption: Record "Meeting Date Options";
        CommitteeMember: Record "Committee Board Members";
        DatePoll: Record "Meeting Date Polls";
    begin
        if Rec."Id" = '' then
            exit;

        DateOption.Reset();
        DateOption.SetRange("Meeting Plan Id", Rec."Id");
        if DateOption.IsEmpty() then
            exit;

        if GuiAllowed then
            if not Confirm(ConfirmCommitteeChangeQst, false) then
                Error(CommitteeChangeAbortedErr);

        if DateOption.FindSet() then
            repeat
                DatePoll.Reset();
                DatePoll.SetRange("Meeting Plan Id", Rec."Id");
                DatePoll.SetRange("Meeting Date Option Id", DateOption."Id");
                if not DatePoll.IsEmpty() then
                    DatePoll.DeleteAll(true);

                if Rec."Committee Id" <> '' then begin
                    CommitteeMember.Reset();
                    CommitteeMember.SetRange(Committee, Rec."Committee Id");
                    if CommitteeMember.FindSet() then
                        repeat
                            if CommitteeMember."Director No" <> '' then begin
                                Clear(DatePoll);
                                DatePoll."Meeting Plan Id" := Rec."Id";
                                DatePoll."Meeting Date Option Id" := DateOption."Id";
                                DatePoll."Member No." := CommitteeMember."Director No";
                                DatePoll."Member Name" := CommitteeMember.Names;
                                DatePoll."Has Voted" := false;
                                DatePoll.Insert(false);
                            end;
                        until CommitteeMember.Next() = 0;
                end;
            until DateOption.Next() = 0;
    end;

    /// <summary>
    /// Opens the poll for voting. Requires a committee, at least two date options, and that
    /// polls have already been generated for every option (they are generated automatically
    /// as each option is inserted, so this mainly validates and stamps the open time).
    /// </summary>
    procedure OpenPoll()
    var
        DateOption: Record "Meeting Date Options";
    begin
        Rec.TestField("Committee Id");
        if Rec."Voting Status" <> Rec."Voting Status"::"Not Started" then
            Error(PollAlreadyStartedErr);

        DateOption.SetRange("Meeting Plan Id", Rec."Id");
        if DateOption.Count() < 2 then
            Error(NeedAtLeastTwoDatesErr);

        Rec."Voting Status" := Rec."Voting Status"::Open;
        Rec."Poll Opened At" := CurrentDateTime();
        Rec.Modify(true);
    end;

    /// <summary>
    /// Closes the poll. If a single date option has the strictly highest vote count it is
    /// selected automatically; otherwise the caller must resolve the tie with SelectWinningDate.
    /// </summary>
    procedure ClosePoll()
    var
        WinningOptionId: Integer;
        IsTie: Boolean;
    begin
        if Rec."Voting Status" <> Rec."Voting Status"::Open then
            Error(PollNotOpenErr);

        Rec."Voting Status" := Rec."Voting Status"::Closed;
        Rec."Poll Closed At" := CurrentDateTime();

        DetermineWinningOption(WinningOptionId, IsTie);
        if not IsTie then
            Rec."Selected Meeting Date Option Id" := WinningOptionId;

        Rec.Modify(true);

        if IsTie and GuiAllowed then
            Message(TieDetectedMsg);
    end;

    /// <summary>
    /// Manually sets (or overrides) the winning date option, for use when ClosePoll() reported
    /// a tie, or when the chairperson wants to override the calculated result.
    /// </summary>
    procedure SelectWinningDate(OptionId: Integer)
    var
        DateOption: Record "Meeting Date Options";
    begin
        if Rec."Voting Status" <> Rec."Voting Status"::Closed then
            Error(MustCloseFirstErr);

        DateOption.SetRange("Meeting Plan Id", Rec."Id");
        DateOption.SetRange("Id", OptionId);
        if not DateOption.FindFirst() then
            Error(OptionNotFoundErr);

        Rec."Selected Meeting Date Option Id" := OptionId;
        Rec.Modify(true);
    end;

    /// <summary>
    /// Finds the date option(s) with the highest Vote Count. Sets IsTie := true when two or
    /// more options share the maximum, in which case WinningOptionId is not meaningful.
    /// </summary>
    local procedure DetermineWinningOption(var WinningOptionId: Integer; var IsTie: Boolean)
    var
        DateOption: Record "Meeting Date Options";
        MaxVotes: Integer;
        TieCount: Integer;
    begin
        WinningOptionId := 0;
        IsTie := false;
        MaxVotes := -1;
        TieCount := 0;

        DateOption.SetRange("Meeting Plan Id", Rec."Id");
        if DateOption.FindSet() then
            repeat
                DateOption.CalcFields("Vote Count");
                if DateOption."Vote Count" > MaxVotes then begin
                    MaxVotes := DateOption."Vote Count";
                    WinningOptionId := DateOption."Id";
                    TieCount := 1;
                end else
                    if DateOption."Vote Count" = MaxVotes then
                        TieCount += 1;
            until DateOption.Next() = 0;

        IsTie := TieCount > 1;
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        HRSet: Record "Human Resources Setup";
        ConfirmCommitteeChangeQst: Label 'Changing the Committee will reset existing vote records. Continue?';
        CommitteeChangeAbortedErr: Label 'Committee change aborted.';
        CannotChangeCommitteeErr: Label 'You cannot change the Committee once voting has started or closed.';
        CannotChangeVoteModeErr: Label 'You cannot change the voting mode once voting has started or closed.';
        PollAlreadyStartedErr: Label 'The poll has already been started for this Meeting Plan.';
        NeedAtLeastTwoDatesErr: Label 'At least two proposed dates are required before opening the poll.';
        PollNotOpenErr: Label 'The poll is not currently open.';
        MustCloseFirstErr: Label 'The poll must be closed before a winning date can be selected.';
        OptionNotFoundErr: Label 'The selected date option does not belong to this Meeting Plan.';
        TieDetectedMsg: Label 'Two or more dates received the same highest number of votes. Please use Select Winning Date to resolve the tie.';
}
