#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
table 58148 "Meeting Date Polls"
{
    Caption = 'Meeting Date Polls';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Meeting Plan Id"; Code[20])
        {
            Caption = 'Meeting Plan Id';
            DataClassification = ToBeClassified;
            TableRelation = "Meeting Plans".Id;
            Editable = false;
        }
        field(2; "Meeting Date Option Id"; Integer)
        {
            Caption = 'Meeting Date Option Id';
            DataClassification = ToBeClassified;
            TableRelation = "Meeting Date Options"."Id" where("Meeting Plan Id" = field("Meeting Plan Id"));
            Editable = false;
        }
        field(3; "Member No."; Code[20])
        {
            Caption = 'Member No.';
            DataClassification = ToBeClassified;
            TableRelation = "Board Members";
            Editable = false;
        }
        field(4; "Member Name"; Text[250])
        {
            Caption = 'Member Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Proposed Date"; Date)
        {
            Caption = 'Proposed Date';
            FieldClass = FlowField;
            CalcFormula = lookup("Meeting Date Options"."Proposed Date" where("Meeting Plan Id" = field("Meeting Plan Id"),
                                                                               "Id" = field("Meeting Date Option Id")));
            Editable = false;
        }
        field(6; "Has Voted"; Boolean)
        {
            Caption = 'Has Voted';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                MeetingPlan: Record "Meeting Plans";
                OtherPoll: Record "Meeting Date Polls";
            begin
                if "Has Voted" = xRec."Has Voted" then
                    exit;

                MeetingPlan.Get("Meeting Plan Id");
                if MeetingPlan."Voting Status" <> MeetingPlan."Voting Status"::Open then
                    Error(VotingNotOpenErr);

                if "Has Voted" then begin
                    "Voted At" := CurrentDateTime();

                    if not MeetingPlan."Allow Multiple Date Votes" then begin
                        OtherPoll.Reset();
                        OtherPoll.SetRange("Meeting Plan Id", "Meeting Plan Id");
                        OtherPoll.SetRange("Member No.", "Member No.");
                        OtherPoll.SetFilter("Meeting Date Option Id", '<>%1', "Meeting Date Option Id");
                        OtherPoll.SetRange("Has Voted", true);
                        if OtherPoll.FindSet() then
                            repeat
                                OtherPoll."Has Voted" := false;
                                OtherPoll."Voted At" := 0DT;
                                OtherPoll.Modify();
                            until OtherPoll.Next() = 0;
                    end;
                end else
                    "Voted At" := 0DT;
            end;
        }
        field(7; "Voted At"; DateTime)
        {
            Caption = 'Voted At';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Meeting Plan Id", "Meeting Date Option Id", "Member No.")
        {
            Clustered = true;
        }
        key(ByMember; "Meeting Plan Id", "Member No.")
        {
        }
    }

    var
        VotingNotOpenErr: Label 'Voting is not currently open for this Meeting Plan.';
}
