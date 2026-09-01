#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
table 58147 "Meeting Date Options"
{
    Caption = 'Meeting Date Options';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Id"; Integer)
        {
            Caption = 'Id';
            DataClassification = ToBeClassified;
        }
        field(2; "Meeting Plan Id"; Code[20])
        {
            Caption = 'Meeting Plan Id';
            DataClassification = ToBeClassified;
            TableRelation = "Meeting Plans".Id;
        }
        field(3; "Proposed Date"; Date)
        {
            Caption = 'Proposed Date';
            DataClassification = ToBeClassified;
        }
        field(4; "Start Time"; Time)
        {
            Caption = 'Start Time';
            DataClassification = ToBeClassified;
        }
        field(5; "End Time"; Time)
        {
            Caption = 'End Time';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if ("Start Time" <> 0T) and ("End Time" <> 0T) then
                    if "End Time" <= "Start Time" then
                        Error('End Time must be later than Start Time.');
            end;
        }
        field(6; "Venue"; Text[250])
        {
            Caption = 'Venue';
            DataClassification = ToBeClassified;
        }
        field(7; "Created At"; DateTime)
        {
            Caption = 'Created At';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Vote Count"; Integer)
        {
            Caption = 'Vote Count';
            FieldClass = FlowField;
            CalcFormula = count("Meeting Date Polls" where("Meeting Plan Id" = field("Meeting Plan Id"),
                                                           "Meeting Date Option Id" = field("Id"),
                                                           "Has Voted" = const(true)));
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Meeting Plan Id", "Id")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        MeetingPlan: Record "Meeting Plans";
        LastOption: Record "Meeting Date Options";
    begin
        "Created At" := CurrentDateTime();

        if "Id" = 0 then begin
            LastOption.SetRange("Meeting Plan Id", "Meeting Plan Id");
            if LastOption.FindLast() then
                "Id" := LastOption."Id" + 10000
            else
                "Id" := 10000;
        end;

        // if MeetingPlan.Get("Meeting Plan Id") then
        //     CreatePollsForThisOption(MeetingPlan."Committee Id");
    end;

    local procedure CreatePollsForThisOption(CommitteeId: Code[20])
    var
        CommitteeMember: Record "Committee Board Members";
        DatePoll: Record "Meeting Date Polls";
    begin
        if (CommitteeId = '') or ("Meeting Plan Id" = '') or ("Id" = 0) then
            exit;

        CommitteeMember.SetRange(Committee, CommitteeId);
        if CommitteeMember.FindSet() then
            repeat
                if CommitteeMember."Director No" <> '' then begin
                    DatePoll.Reset();
                    DatePoll.SetRange("Meeting Plan Id", Rec."Meeting Plan Id");
                    DatePoll.SetRange("Meeting Date Option Id", Rec."Id");
                    DatePoll.SetRange("Member No.", CommitteeMember."Director No");

                    if DatePoll.IsEmpty() then begin
                        Clear(DatePoll); 
                        DatePoll."Meeting Plan Id" := Rec."Meeting Plan Id";
                        DatePoll."Meeting Date Option Id" := Rec."Id";
                        DatePoll."Member No." := CommitteeMember."Director No";
                        DatePoll."Member Name" := CommitteeMember.Names;
                        DatePoll."Has Voted" := false;
                        DatePoll.Insert(false); 
                    end;
                end;
            until CommitteeMember.Next() = 0;
    end;

    trigger OnDelete()
    var
        DatePoll: Record "Meeting Date Polls";
    begin
        DatePoll.Reset();
        DatePoll.SetRange("Meeting Plan Id", "Meeting Plan Id");
        DatePoll.SetRange("Meeting Date Option Id", "Id");
        if not DatePoll.IsEmpty() then
            DatePoll.DeleteAll(true);
    end;
}