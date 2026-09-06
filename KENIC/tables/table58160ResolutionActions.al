#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006
table 58160 "Resolution Actions"
{
    Caption = 'Resolution Actions';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Resolution No."; Code[20])
        {
            Caption = 'Resolution No.';
            DataClassification = ToBeClassified;
            TableRelation = "Meeting Resolutions"."No.";
            Editable = false;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(3; "Meeting Code"; Code[20])
        {
            // The specific meeting (committee or Full Board) this discussion/action happened at.
            // Optional - a manual "logged after the fact" note doesn't strictly need one.
            Caption = 'Meeting Code';
            DataClassification = ToBeClassified;
            TableRelation = "Board Meetings".No;
        }
        field(4; "Action Taken"; Option)
        {
            Caption = 'Action Taken';
            DataClassification = ToBeClassified;
            OptionCaption = 'Discussed & Agreed,Deferred,Escalated to Board,Voting Opened,Voting Closed,Withdrawn';
            OptionMembers = "Discussed & Agreed",Deferred,"Escalated to Board","Voting Opened","Voting Closed",Withdrawn;
        }
        field(5; "Chaired By"; Code[20])
        {
            Caption = 'Chaired By';
            DataClassification = ToBeClassified;
            TableRelation = "Board Members";
        }
        field(6; "Notes"; Text[2048])
        {
            Caption = 'Notes';
            DataClassification = ToBeClassified;
        }
        field(7; "Action Date"; DateTime)
        {
            Caption = 'Action Date';
            DataClassification = ToBeClassified;
        }
        field(8; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Meeting Title"; Text[250])
        {
            Caption = 'Meeting Title';
            FieldClass = FlowField;
            CalcFormula = lookup("Board Meetings".Title where(No = field("Meeting Code")));
            Editable = false;
        }
        field(10; "Meeting Description"; Text[250])
        {
            Caption = 'Meeting Description';
            FieldClass = FlowField;
            CalcFormula = lookup("Board Meetings".Description where(No = field("Meeting Code")));
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Resolution No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        ExistingLine: Record "Resolution Actions";
    begin
        if "Line No." = 0 then begin
            ExistingLine.SetRange("Resolution No.", "Resolution No.");
            if ExistingLine.FindLast() then
                "Line No." := ExistingLine."Line No." + 10000
            else
                "Line No." := 10000;
        end;

        if "Action Date" = 0DT then
            "Action Date" := CurrentDateTime();

        "Created By" := UserId();
    end;
}
