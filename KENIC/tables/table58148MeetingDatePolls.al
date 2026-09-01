#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
table 58148 "Meeting Date Polls"
{
    Caption = 'Meeting Date Polls';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Id"; Integer)
        {
            Caption = 'Id';
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Meeting Plan Id"; Code[20])
        {
            Caption = 'Meeting Plan Id';
            DataClassification = ToBeClassified;
            TableRelation = "Meeting Plans".Id;
        }
        field(3; "Meeting Date Option Id"; Integer)
        {
            Caption = 'Meeting Date Option Id';
            DataClassification = ToBeClassified;
            TableRelation = "Meeting Date Options".Id where("Meeting Plan Id" = field("Meeting Plan Id"));
        }
        field(4; "Member No."; Code[20])
        {
            Caption = 'Member No.';
            DataClassification = ToBeClassified;
            TableRelation = "Committee Board Members"."Director No";
        }
        field(5; "Member Name"; Text[250])
        {
            Caption = 'Member Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "User Id"; Code[50])
        {
            Caption = 'User Id';
            DataClassification = ToBeClassified;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
        }
        field(7; "Has Voted"; Boolean)
        {
            Caption = 'Has Voted';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Has Voted" then begin
                    "Voted At" := CurrentDateTime();
                    if "User Id" = '' then
                        "User Id" := UserId();
                end else begin
                    "Voted At" := 0DT;
                    "User Id" := '';
                end;
            end;
        }
        field(8; "Voted At"; DateTime)
        {
            Caption = 'Voted At';
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
        key(OptionMember; "Meeting Plan Id", "Meeting Date Option Id", "Member No.")
        {
            Unique = true;
        }
      
        key(VoteCountIndex; "Meeting Plan Id", "Meeting Date Option Id", "Has Voted")
        {
        }
    }

    trigger OnInsert()
    begin
        if "Has Voted" and ("Voted At" = 0DT) then begin
            "Voted At" := CurrentDateTime();
            if "User Id" = '' then
                "User Id" := UserId();
        end;
    end;

    trigger OnModify()
    begin
        if "Has Voted" and ("Voted At" = 0DT) then begin
            "Voted At" := CurrentDateTime();
            if "User Id" = '' then
                "User Id" := UserId();
        end;
    end;
}