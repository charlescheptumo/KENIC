#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50030 "Board Room Management Header"
{
    // DrillDownPageID = UnknownPage60075;
    // LookupPageID = UnknownPage60075;

    fields
    {
        field(1; No; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Requestor ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Employee No"; Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = true;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Employee No");
                if Employee.FindSet then
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Last Name";
            end;
        }
        field(4; "Employee Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Time Created"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Posted By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Posting Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = true;
            Enabled = true;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(12; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Draft,Submitted,Closed,Rejected';
            OptionMembers = Draft,Submitted,Closed,Rejected;
        }
        field(13; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Appointment,Reservation';
            OptionMembers = ,Appointment,Reservation;
        }
        field(14; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Additional Requests"; Code[250])
        {
            TableRelation = "Additional Requests";
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if No = '' then begin
            BoardRoomMgtSet.Get;
            BoardRoomMgtSet.TestField(BoardRoomMgtSet."Reservation Nos");
            rec.No := NoSeriesMgt.GetNextNo(BoardRoomMgtSet."Reservation Nos", WorkDate(), true);
        end;
        //Usersetup.RESET();
        "Requestor ID" := UserId;
        // if UserId <> 'CUEHQ\ADMINISTRATOR' then begin
        //     if Usersetup.Get(UserId) then begin
        //         Rec.Validate("Employee No", Usersetup."Employee No.");
        //     end;
        // end;
    end;

    var
        Employee: Record Employee;
        NoSeriesMgt: Codeunit "No. Series";
        BoardRoomMgtSet: Record "Board Room Management Setup";
        Usersetup: Record "User Setup";
}

