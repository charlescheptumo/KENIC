table 58202 "Board Facilitation Request"
{
    Caption = 'Board Facilitation Request';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Request No."; Code[20]) { Caption = 'Request No.'; }
        field(2; "Training Need No."; Code[20])
        {
            Caption = 'Training Need No.';
            TableRelation = "Board Training Needs"."Application No." where(Status = const(Approved));
        }
        field(3; "Member No."; Code[50])
        {
            Caption = 'Member No.';
            TableRelation = "Board Members"."Personal No";
        }
        field(4; "Member Name"; Text[300]) { Caption = 'Member Name'; }
        field(5; "Request Type"; Option)
        {
            Caption = 'Request Type';
            OptionCaption = 'Imprest,Per Diem,Mileage,Fuel Allowance';
            OptionMembers = Imprest,"Per Diem",Mileage,"Fuel Allowance";
        }
        field(6; "Amount Requested"; Decimal) { Caption = 'Amount Requested'; }
        field(7; Description; Text[250]) { Caption = 'Description'; }
        field(8; "Date Submitted"; Date) { Caption = 'Date Submitted'; }
        field(9; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Open,Pending Approval,Approved,Rejected';
            OptionMembers = Open,"Pending Approval",Approved,Rejected;
        }
        field(10; "Approver Comments"; Text[250]) { Caption = 'Approver Comments'; }
    }

    keys
    {
        key(PK; "Request No.") { Clustered = true; }
    }
}