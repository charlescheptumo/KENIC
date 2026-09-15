#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006

Table 55002 "Board Meetings"
{
    fields
    {
        field(1; No; Code[20]) { }
        field(2; Title; Text[250]) { }
        field(3; "Start date"; Date) { }
        field(4; "Start time"; Time) { }
        field(5; "End Date"; Date) { }
        field(6; "End time"; Time) { }
        field(7; "Venue/Location"; Text[100]) { }
        field(8; "Convened by"; Code[20]) { }
        field(9; "Contact Tel. No"; Code[50]) { }
        field(10; "Contact Email"; Text[100]) { }
        field(11; Description; Text[250]) { }

        field(12; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Pending,Upcoming,In progress,Completed,Cancelled';
            OptionMembers = Open,"Pending Approval",Pending,Upcoming,"In progress",Completed,Cancelled;
        }

        field(13; Published; Boolean) { }

        field(14; "Meeting group Code"; Code[20])
        {
            TableRelation = "Board Committees";

            trigger OnValidate()
            begin
                Committees.Get("Meeting group Code");
                "Meeting group" := Committees.Description;
                "Meeting Type" := Committees.Type;

                Members.Reset;
                Members.SetRange(Members.Committee, "Meeting group Code");
                if Members.FindSet then begin
                    repeat
                        Atendance.Reset;
                        Atendance.SetRange("Meeting Code", No);
                        Atendance.SetRange("Member No", Members."Director No");
                        if Atendance.FindFirst then begin
                            Atendance."Meeting Name" := Title;
                            Atendance."Commitee No" := "Meeting group Code";
                            Atendance."Meeting Date" := "Start date";
                            Atendance."Committee  Name" := "Meeting group";
                            Atendance.Venue := "Venue/Location";
                            Atendance.Modify(true);
                        end else begin
                            Atendance.Init;
                            Atendance."Line No" := Atendance."Line No" + 1;
                            Atendance."Meeting Code" := No;
                            Atendance.Validate("Meeting Code");
                            Atendance."Commitee No" := "Meeting group Code";
                            Atendance."Meeting Name" := Title;
                            Atendance."Member No" := Members."Director No";
                            Atendance."Member Name" := Members.Names;
                            Atendance."Meeting Date" := "Start date";
                            Atendance."Committee  Name" := "Meeting group";
                            Atendance.Venue := "Venue/Location";
                            Atendance.Insert(true);
                        end;
                    until Members.Next = 0;
                end;
            end;
        }

        field(15; "Meeting group"; Text[100]) { }
        field(16; "Conference Venue"; Text[100]) { }
        field(17; "Parking Arrangement"; Text[100]) { }
        field(18; "Access requirement"; Text[100]) { }
        field(19; "No series"; Code[100]) { }

        field(20; "Meeting Type"; Option)
        {
            OptionCaption = 'Board,Committee';
            OptionMembers = Board,Committee;
        }

        field(21; Closed; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(22; "Financial Year"; Code[250])
        {
            TableRelation = "Financial Year Code";
        }

        field(23; "Date Confirmed"; Boolean)
        {
            Caption = 'Date Confirmed';
            DataClassification = ToBeClassified;
            Editable = false;
            // Set automatically by Meeting Plans.SyncConfirmedDateToMeeting() once a linked poll
            // closes with a winning date, or manually via the "Confirm Meeting Date" action on
            // the Board Meeting Card for meetings scheduled without a formal poll.
        }

        field(24; "Online Meeting Provider"; Option)
        {
            Caption = 'Online Meeting Provider';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Microsoft Teams,Zoom,Google Meet,Webex,Other';
            OptionMembers = " ","Microsoft Teams",Zoom,"Google Meet",Webex,Other;
        }

        field(25; "Online Meeting Link"; Text[500])
        {
            Caption = 'Online Meeting Link';
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;

            trigger OnValidate()
            begin
                if ("Online Meeting Link" <> '') and (not "Date Confirmed") then
                    Error(DateNotConfirmedErr);
            end;
        }
    }

    keys
    {
        key(Key1; No) { Clustered = true; }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        if Rec.No = '' then begin
            HRSet.Get();
            HRSet.TestField("Meeting Nos.");
            Rec.No := NoSeriesMgt.GetNextNo(HRSet."Meeting Nos.", WorkDate(), true);
        end;
    end;

    /// <summary>
    /// Manually marks the meeting date as confirmed, for meetings scheduled directly (without
    /// going through the Meeting Plans poll workflow). Meetings whose date was confirmed by a
    /// closed poll are already flagged automatically and don't need this.
    /// </summary>
    procedure ConfirmMeetingDate()
    begin
        if Rec."Date Confirmed" then
            Error(AlreadyConfirmedErr);

        Rec.TestField("Start date");

        if GuiAllowed then
            if not Confirm(ConfirmDateQst, true) then
                exit;

        Rec."Date Confirmed" := true;
        Rec.Modify(true);
    end;

    var
        Committees: Record "Board Committees";
        NoSeriesMgt: Codeunit "No. Series";
        HRSet: Record "Human Resources Setup";
        Atendance: Record "board meeting attendance";
        Members: Record "committee board members";
        DateNotConfirmedErr: Label 'You can only attach an online meeting link once the meeting date has been confirmed. Confirm the date via its poll (Meeting Plan) or the Confirm Meeting Date action.';
        AlreadyConfirmedErr: Label 'This meeting''s date is already confirmed.';
        ConfirmDateQst: Label 'Mark this meeting''s date and time as confirmed? Do this only once the schedule is final.';
}
