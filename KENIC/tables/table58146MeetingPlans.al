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

                if Rec."Committee Id" = xRec."Committee Id" then
                    exit;

                if (xRec."Committee Id" <> '') and (Rec."Voting Status" <> Rec."Voting Status"::"Not Started") then
                    Error(CannotChangeCommitteeErr);

                SyncCommitteeMembers();
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
        field(19; "Meeting Code"; Code[20])
        {
            Caption = 'Meeting Code';
            DataClassification = ToBeClassified;
            TableRelation = "Board Meetings".No;

            trigger OnValidate()
            var
                BoardMeeting: Record "Board Meetings";
            begin
                if Rec."Meeting Code" = xRec."Meeting Code" then
                    exit;

                if (xRec."Meeting Code" <> '') and (Rec."Voting Status" <> Rec."Voting Status"::"Not Started") then
                    Error(CannotChangeMeetingErr);

                if Rec."Meeting Code" = '' then
                    exit;

                if not BoardMeeting.Get(Rec."Meeting Code") then
                    exit;

                // Auto-populate from the linked Board Meeting, mirroring how selecting a
                // Committee auto-populates its members. Only fills blanks - never overwrites
                // values the user already entered by hand.
                if Rec."Title" = '' then
                    Rec."Title" := BoardMeeting.Title;

                if BoardMeeting."Meeting group Code" <> '' then
                    Rec.Validate("Committee Id", BoardMeeting."Meeting group Code");

                if BoardMeeting."Start date" <> 0D then begin
                    if Rec."Year" = 0 then
                        Rec."Year" := Date2DMY(BoardMeeting."Start date", 3);
                    if Rec."Quarter" = Rec."Quarter"::" " then
                        Rec."Quarter" := GetQuarter(BoardMeeting."Start date");
                end;
            end;
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
    begin
        if (Rec."Id" = '') or (Rec."Committee Id" = '') then
            exit;

        CommitteeMember.Reset();
        CommitteeMember.SetRange(Committee, Rec."Committee Id");
        if CommitteeMember.FindSet() then
            repeat
                if CommitteeMember."Director No" <> '' then
                    InsertPollRowIfMissing(OptionId, CommitteeMember."Director No", CommitteeMember.Names);
            until CommitteeMember.Next() = 0;
    end;

    /// <summary>
    /// Re-syncs the per-option poll rows for every date option that already exists, whenever
    /// "Committee Id" changes on the Meeting Plan. Does NOT populate any members by itself -
    /// members are only ever generated per proposed date, via CreatePollsForOption (called from
    /// Meeting Date Options.OnInsert). If no dates exist yet, this simply clears old votes and
    /// does nothing else; members will appear once dates are typed in.
    /// </summary>
    local procedure SyncCommitteeMembers()
    var
        DateOption: Record "Meeting Date Options";
        DatePoll: Record "Meeting Date Polls";
    begin
        if Rec."Id" = '' then
            exit;

        DatePoll.Reset();
        DatePoll.SetRange("Meeting Plan Id", Rec."Id");
        if not DatePoll.IsEmpty() then
            if GuiAllowed then
                if not Confirm(ConfirmCommitteeChangeQst, false) then
                    Error(CommitteeChangeAbortedErr);

        // Wipe every existing poll row for this plan (old committee's votes no longer apply).
        DatePoll.Reset();
        DatePoll.SetRange("Meeting Plan Id", Rec."Id");
        if not DatePoll.IsEmpty() then
            DatePoll.DeleteAll(true);

        if Rec."Committee Id" = '' then
            exit;

        // Regenerate per-option poll rows for every date option that already exists, against
        // the new committee. If no date options exist yet, this loop simply does nothing.
        DateOption.Reset();
        DateOption.SetRange("Meeting Plan Id", Rec."Id");
        if DateOption.FindSet() then
            repeat
                CreatePollsForOption(DateOption."Id");
            until DateOption.Next() = 0;
    end;

    /// <summary>
    /// Shared insert used when generating per-date poll rows. Idempotent: does nothing if a row
    /// for this plan/option/member already exists.
    /// </summary>
    local procedure InsertPollRowIfMissing(OptionId: Integer; MemberNo: Code[20]; MemberName: Text[250])
    var
        DatePoll: Record "Meeting Date Polls";
    begin
        DatePoll.Reset();
        DatePoll.SetRange("Meeting Plan Id", Rec."Id");
        DatePoll.SetRange("Meeting Date Option Id", OptionId);
        DatePoll.SetRange("Member No.", MemberNo);
        if not DatePoll.IsEmpty() then
            exit;

        Clear(DatePoll);
        DatePoll."Meeting Plan Id" := Rec."Id";
        DatePoll."Meeting Date Option Id" := OptionId;
        DatePoll."Member No." := MemberNo;
        DatePoll."Member Name" := MemberName;
        DatePoll."Has Voted" := false;
        DatePoll.Insert(false);
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
        SyncConfirmedDateToMeeting();

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
        SyncConfirmedDateToMeeting();
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

    /// <summary>
    /// Pushes the winning date option's date/time/venue into the linked Board Meeting and marks
    /// it confirmed. Called from ClosePoll (automatic winner) and SelectWinningDate (manual
    /// tie-break or override). Does nothing if this plan isn't linked to a Board Meeting, or if
    /// no winner has been selected yet.
    /// </summary>
    local procedure SyncConfirmedDateToMeeting()
    var
        BoardMeeting: Record "Board Meetings";
        WinningOption: Record "Meeting Date Options";
    begin
        if (Rec."Meeting Code" = '') or (Rec."Selected Meeting Date Option Id" = 0) then
            exit;

        if not BoardMeeting.Get(Rec."Meeting Code") then
            exit;

        if not WinningOption.Get(Rec."Id", Rec."Selected Meeting Date Option Id") then
            exit;

        BoardMeeting."Start date" := WinningOption."Proposed Date";
        BoardMeeting."Start time" := WinningOption."Start Time";
        BoardMeeting."End Date" := WinningOption."Proposed Date";
        BoardMeeting."End time" := WinningOption."End Time";
        if WinningOption."Venue" <> '' then
            BoardMeeting."Venue/Location" := WinningOption."Venue";

        BoardMeeting."Date Confirmed" := true;
        BoardMeeting.Modify(true);
    end;

    local procedure GetQuarter(ForDate: Date): Option " ",Q1,Q2,Q3,Q4
    var
        MonthNo: Integer;
    begin
        MonthNo := Date2DMY(ForDate, 2);
        case true of
            MonthNo <= 3:
                exit("Quarter"::Q1);
            MonthNo <= 6:
                exit("Quarter"::Q2);
            MonthNo <= 9:
                exit("Quarter"::Q3);
            else
                exit("Quarter"::Q4);
        end;
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        HRSet: Record "Human Resources Setup";
        ConfirmCommitteeChangeQst: Label 'Changing the Committee will reset existing vote records. Continue?';
        CommitteeChangeAbortedErr: Label 'Committee change aborted.';
        CannotChangeCommitteeErr: Label 'You cannot change the Committee once voting has started or closed.';
        CannotChangeMeetingErr: Label 'You cannot change the linked Board Meeting once voting has started or closed.';
        CannotChangeVoteModeErr: Label 'You cannot change the voting mode once voting has started or closed.';
        PollAlreadyStartedErr: Label 'The poll has already been started for this Meeting Plan.';
        NeedAtLeastTwoDatesErr: Label 'At least two proposed dates are required before opening the poll.';
        PollNotOpenErr: Label 'The poll is not currently open.';
        MustCloseFirstErr: Label 'The poll must be closed before a winning date can be selected.';
        OptionNotFoundErr: Label 'The selected date option does not belong to this Meeting Plan.';
        TieDetectedMsg: Label 'Two or more dates received the same highest number of votes. Please use Select Winning Date to resolve the tie.';
}
