table 58203 "Board Pack Document"
{
    Caption = 'Board Pack Document';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer) { Caption = 'Entry No.'; AutoIncrement = true; }
        field(2; "Meeting Code"; Code[200])
        {
            Caption = 'Meeting Code';
            TableRelation = "Board Meetings";
        }
        field(3; "File Name"; Text[250]) { Caption = 'File Name'; }
        field(4; "SharePoint Link"; Text[500])
        {
            Caption = 'SharePoint Link';
            ExtendedDatatype = URL;
        }
        field(5; "Uploaded By"; Code[50])
        {
            Caption = 'Uploaded By';
            TableRelation = "Board Members"."Personal No";
        }
        field(6; "Date Uploaded"; Date) { Caption = 'Date Uploaded'; }
    }

    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
        key(ByMeeting; "Meeting Code") { }
    }
}