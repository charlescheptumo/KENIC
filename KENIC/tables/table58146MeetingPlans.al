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
        // field(2; "Committee Id"; Code[20])
        // {
        //     Caption = 'Committee Id';
        //     DataClassification = ToBeClassified;
        //     TableRelation = "Board Committees".Code;

        //     trigger OnValidate()
        //     begin
        //         CalcFields("Committee Description");

        //         if "Committee Id" <> xRec."Committee Id" then
        //             RegeneratePollVotes();
        //     end;
        // }
        field(2; "Committee Id"; Code[20])
        {
            Caption = 'Committee Id';
            DataClassification = ToBeClassified;
            //TableRelation = "Committee Board Members".Committee;
            TableRelation = "Board Committees".Code;

            trigger OnValidate()
            var
                MeetingOption: Record "Meeting Date Options";
                CommitteeMember: Record "Committee Board Members";
                DatePoll: Record "Meeting Date Polls";
            begin
                if Rec."Committee Id" <> xRec."Committee Id" then begin

                    MeetingOption.Reset();
                    MeetingOption.SetRange("Meeting Plan Id", Rec.Id);
                    if MeetingOption.FindSet() then
                        repeat

                            DatePoll.Reset();
                            DatePoll.SetRange("Meeting Date Option Id", MeetingOption.Id);
                            DatePoll.DeleteAll(true);


                            if Rec."Committee Id" <> '' then begin
                                CommitteeMember.Reset();
                                CommitteeMember.SetRange(Committee, Rec."Committee Id");
                                if CommitteeMember.FindSet() then
                                    repeat
                                        DatePoll.Init();
                                        DatePoll."Meeting Date Option Id" := MeetingOption.Id;
                                        DatePoll."Member No." := CommitteeMember."Director No";
                                        DatePoll."Member Name" := CommitteeMember.Names;
                                        DatePoll."Has Voted" := false;
                                        DatePoll.Insert(true);
                                    until CommitteeMember.Next() = 0;
                            end;
                        until MeetingOption.Next() = 0;
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

        "Created By" := CopyStr(UserId(), 1, MaxStrLen("Created By"));
        "Created At" := CurrentDateTime();
    end;

    local procedure RegeneratePollVotes()
    var
        DateOption: Record "Meeting Date Options";
        CommitteeMember: Record "Committee Board Members";
        DatePoll: Record "Meeting Date Polls";
        ConfirmQst: Label 'Changing the Committee will reset all existing vote records for this meeting plan. Do you want to continue?';
    begin
        if Rec."Id" = '' then
            exit;

        // Check if any date options exist before processing
        DateOption.Reset();
        DateOption.SetRange("Meeting Plan Id", Rec."Id");
        if DateOption.IsEmpty() then
            exit;

        // Safety prompt when interactive
        if GuiAllowed then
            if not Confirm(ConfirmQst, false) then
                Error('Committee change aborted.');

        if DateOption.FindSet() then
            repeat
                // 1. Remove existing poll entries for this date option line
                DatePoll.Reset();
                DatePoll.SetRange("Meeting Date Option Id", DateOption.Id);
                if not DatePoll.IsEmpty() then
                    DatePoll.DeleteAll(true);

                // 2. Populate new committee members if a committee is assigned
                if Rec."Committee Id" <> '' then begin
                    CommitteeMember.Reset();
                    CommitteeMember.SetRange(Committee, Rec."Committee Id");
                    if CommitteeMember.FindSet() then
                        repeat
                            DatePoll.Init();
                            DatePoll."Meeting Date Option Id" := DateOption.Id;
                            DatePoll."Member No." := CommitteeMember."Director No";
                            DatePoll."Member Name" := CommitteeMember.Names;
                            DatePoll."Has Voted" := false;
                            DatePoll.Insert(true);
                        until CommitteeMember.Next() = 0;
                end;
            until DateOption.Next() = 0;
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
        HRSet: Record "Human Resources Setup";
}