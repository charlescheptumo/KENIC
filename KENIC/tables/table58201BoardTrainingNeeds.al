table 58201 "Board Training Needs"
{
    Caption = 'Board Training Needs';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Application No."; Code[20]) { Caption = 'Application No.'; }
        field(2; "Member No."; Code[50])
        {
            Caption = 'Member No.';
            TableRelation = "Board Members"."Personal No";
        }
        field(3; "Member Name"; Text[300]) { Caption = 'Member Name'; }
        field(4; "Training Title"; Text[250]) { Caption = 'Training Title'; }
        field(5; Justification; Text[500]) { Caption = 'Justification'; }
        field(6; "Date Submitted"; Date) { Caption = 'Date Submitted'; }
        field(7; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Open,Pending Approval,Approved,Rejected';
            OptionMembers = Open,"Pending Approval",Approved,Rejected;

            trigger OnValidate()
            begin
                if (Status = Status::Approved) or (Status = Status::Rejected) then
                    "Date Actioned" := Today;
            end;
        }
        field(8; "Approver Comments"; Text[250]) { Caption = 'Approver Comments'; }
        field(9; "Date Actioned"; Date) { Caption = 'Date Actioned'; }
    }

    keys
    {
        key(PK; "Application No.") { Clustered = true; }
    }
}