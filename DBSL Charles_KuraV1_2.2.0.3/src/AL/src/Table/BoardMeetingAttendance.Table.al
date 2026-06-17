#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006

Table 55009 "Board Meeting Attendance"
{
    fields
    {
        field(1; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Meeting Code"; Code[200])
        {
            TableRelation = "Board Meetings";

            trigger OnValidate()
            begin
                if Meeting.Get("Meeting Code") then begin
                    "Meeting Name" := Meeting.Title;
                    "Meeting Date" := Meeting."Start date";
                    "Commitee No" := Meeting."Meeting group Code";
                    "Committee  Name" := Meeting."Meeting group";
                    Venue := Meeting."Venue/Location";
                end;
            end;
        }
        field(3; "Member No"; Code[200])
        {
            TableRelation = "Board Members"."Personal No";

            trigger OnValidate()
            begin
                if Memb.Get("Member No") then
                    "Member Name" := Memb."First Name" + ' ' + Memb."Last Name";
            end;
        }
        field(4; "Commitee No"; Code[200])
        {
            TableRelation = "Board Committees".Code;
        }
        field(5; "Meeting Name"; Text[300])
        {
        }
        field(6; "Member Name"; Text[300])
        {
        }
        field(7; "Committee  Name"; Text[300])
        {
        }
        field(8; "Meeting Date"; Date)
        {
        }
        field(9; Venue; Text[300])
        {
        }
        field(10; Attendance; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Present,Apology,Absent';
            OptionMembers = " ",Present,Apology,Absent;
        }
        field(11; "Attendance Confirmation"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Not confirmed,Confirmed,Apologetic Decline';
            OptionMembers = "Not confirmed",Confirmed,"Apologetic Decline";
        }
        field(12; "Has Attended"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Meeting Code", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    var
        ExistingLine: Record "Board Meeting Attendance";
        NextLineNo: Integer;
    begin
        NextLineNo := 1;
        ExistingLine.SetRange("Meeting Code", "Meeting Code");
        if ExistingLine.FindLast() then
            NextLineNo := ExistingLine."Line No" + 1;
        "Line No" := NextLineNo;

        if Meeting.Get("Meeting Code") then begin
            "Meeting Name" := Meeting.Title;
            "Meeting Date" := Meeting."Start date";
            "Commitee No" := Meeting."Meeting group Code";
            "Committee  Name" := Meeting."Meeting group";
            Venue := Meeting."Venue/Location";
        end;
    end;

    var
        Memb: Record "Board Members";
        Meeting: Record "Board Meetings";
}