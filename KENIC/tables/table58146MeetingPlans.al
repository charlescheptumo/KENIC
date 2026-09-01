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


                // if (Rec."Committee Id" <> xRec."Committee Id") and (xRec."Committee Id" <> '') then
                //     RegeneratePollVotes();
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

        "Created By" := UserId();
        "Created At" := CurrentDateTime();
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

   procedure CreatePollsForOption(OptionId: Integer)
var
    CommitteeMember: Record "Committee Board Members";
    DatePoll: Record "Meeting Date Polls";
begin
    if (Rec."Id" = '') or (Rec."Committee Id" = '') then
        exit;

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

local procedure RegeneratePollVotes()
var
    DateOption: Record "Meeting Date Options";
    CommitteeMember: Record "Committee Board Members";
    DatePoll: Record "Meeting Date Polls";
    ConfirmQst: Label 'Changing the Committee will reset existing vote records. Continue?';
begin
    if Rec."Id" = '' then
        exit;

    DateOption.Reset();
    DateOption.SetRange("Meeting Plan Id", Rec."Id");
    if DateOption.IsEmpty() then
        exit;

    if xRec."Committee Id" <> '' then
        if GuiAllowed then
            if not Confirm(ConfirmQst, false) then
                Error('Committee change aborted.');

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

    var
        NoSeriesMgt: Codeunit "No. Series";
        HRSet: Record "Human Resources Setup";
}