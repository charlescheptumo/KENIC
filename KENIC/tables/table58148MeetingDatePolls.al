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
        field(2; "Meeting Date Option Id"; Integer)
        {
            Caption = 'Meeting Date Option Id';
            DataClassification = ToBeClassified;
            TableRelation = "Meeting Date Options".Id;
        }
        field(3; "Member No."; Code[20])
        {
            Caption = 'Member No.';
            DataClassification = ToBeClassified;
            TableRelation = "Committee Board Members"."Director No";
        }
        field(4; "Member Name"; Text[250])
        {
            Caption = 'Member Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "User Id"; Code[50])
        {
            Caption = 'User Id';
            DataClassification = ToBeClassified;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
        }
        field(6; "Has Voted"; Boolean)
        {
            Caption = 'Has Voted';
            DataClassification = ToBeClassified;
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
        key(PK; "Id")
        {
            Clustered = true;
        }
        key(OptionMember; "Meeting Date Option Id", "Member No.")
        {
            Unique = true;
        }
    }

    trigger OnInsert()
    begin
        if "Has Voted" and ("Voted At" = 0DT) then
            "Voted At" := CurrentDateTime();
    end;
}