table 58260 "Board Data Consent Log"
{
    Caption = 'Board Data Consent Log';
    DataClassification = CustomerContent;
    LookupPageId = "Board Data Consent Log";
    DrillDownPageId = "Board Data Consent Log";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Personal No"; Code[50])
        {
            Caption = 'Personal No';
            TableRelation = "Board Members"."Personal No";
            ValidateTableRelation = false;
        }
        field(3; "Full Name"; Text[100])
        {
            Caption = 'Full Name';
        }
        field(4; "Action"; Option)
        {
            Caption = 'Action';
            OptionMembers = Accepted,Declined;
            OptionCaption = 'Accepted,Declined';
        }
        field(5; "Consent Date Time"; DateTime)
        {
            Caption = 'Consent Date/Time';
        }
        field(6; "Consent Date"; Date)
        {
            Caption = 'Consent Date';
        }
        field(7; "Consent Version"; Text[50])
        {
            Caption = 'Consent Version';
        }
        field(8; "Portal User"; Text[100])
        {
            Caption = 'Portal User';
        }
        field(9; "IP Address"; Text[50])
        {
            Caption = 'IP Address';
        }
        field(10; "User Agent"; Text[250])
        {
            Caption = 'User Agent';
        }
        field(11; "Recorded By"; Code[50])
        {
            Caption = 'Recorded By';
            DataClassification = EndUserIdentifiableInformation;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(Member; "Personal No", "Consent Date Time")
        {
        }
    }

    trigger OnModify()
    begin
        Error('Consent log entries cannot be changed.');
    end;

    trigger OnDelete()
    begin
        Error('Consent log entries cannot be deleted.');
    end;

    trigger OnRename()
    begin
        Error('Consent log entries cannot be renamed.');
    end;
}