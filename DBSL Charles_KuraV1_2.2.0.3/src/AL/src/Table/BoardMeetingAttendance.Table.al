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
            Editable = false;

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
        field(3; "Member No"; Code[50])
        {
            TableRelation = "Board Members"."Personal No";

            trigger OnValidate()
            var
                Memb: Record "Board Members";
            begin
               
                if (xRec."Member No" <> '') and ("Member No" <> xRec."Member No") then
                    Error(CannotReassignMemberErr);

                if Memb.Get(Rec."Member No") then begin
                    Rec."Member Name" := Memb."First Name" + ' ' + Memb."Last Name";
                    Rec."E-mail" := Memb."Company E-Mail";
                end else begin
                    Rec."Member Name" := '';
                    Rec."E-mail" := '';
                end;
            end;
        }
        field(4; "Commitee No"; Code[200])
        {
            TableRelation = "Board Committees".Code;
            Editable = false;
        }
        field(5; "Meeting Name"; Text[300])
        {
            Editable = false;
        }
        field(6; "Member Name"; Text[300])
        {
            Editable = false;
        }
        field(7; "Committee  Name"; Text[300])
        {
            Editable = false;
        }
        field(8; "Meeting Date"; Date)
        {
            Editable = false;
        }
        field(9; Venue; Text[300])
        {
            Editable = false;
        }
        field(10; Attendance; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Present,Apology,Absent';
            OptionMembers = " ",Present,Apology,Absent;

            trigger OnValidate()
            begin
                
                "Has Attended" := Attendance = Attendance::Present;
            end;
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
            Editable = false;
        }

        field(13; "E-mail"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(14; "Attendance Mode"; Option)
        {
            Caption = 'Attendance Mode';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,In-Person,Virtual';
            OptionMembers = " ","In-Person",Virtual;
        }

        field(15; "Online Meeting Link"; Text[500])
        {
            Caption = 'Online Meeting Link';
            FieldClass = FlowField;
            CalcFormula = lookup("Board Meetings"."Online Meeting Link" where(No = field("Meeting Code")));
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Meeting Code", "Line No")
        {
            Clustered = true;
        }
        key(ByMember; "Meeting Code", "Member No")
        {
        }
    }

    fieldgroups { }

    trigger OnInsert()
    var
        ExistingLine: Record "Board Meeting Attendance";
        NextLineNo: Integer;
    begin
        if "Member No" <> '' then begin
            ExistingLine.Reset();
            ExistingLine.SetRange("Meeting Code", "Meeting Code");
            ExistingLine.SetRange("Member No", "Member No");
            if not ExistingLine.IsEmpty() then
                Error(DuplicateMemberErr, "Member No", "Meeting Code");
        end;

        NextLineNo := 1;
        ExistingLine.Reset();
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
        CannotReassignMemberErr: Label 'You cannot change the member on an existing attendance line. Delete this line and add a new one instead.';
        DuplicateMemberErr: Label 'Member %1 already has an attendance line for meeting %2.', Comment = '%1 = Member No, %2 = Meeting Code';
}
