tableextension 58170 "Board Meetings Ext" extends "Board Meetings"
{
    fields
    {
        field(50100; "Convener No."; Code[50])
        {
            Caption = 'Convener No.';
            TableRelation = "Board Members"."Personal No";

            DataClassification = ToBeClassified;
        }
        field(50101; "Send Meeting Reminder"; Boolean)
        {
            Caption = 'Send Meeting Reminder';
            DataClassification = ToBeClassified;
            InitValue = true;
        }
        field(50102; "Meeting Reminder Sent"; Boolean)
        {
            Caption = 'Meeting Reminder Sent';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        // A new meeting date or time gets a new reminder
        modify("Start date")
        {
            trigger OnAfterValidate()
            begin
                Rec."Meeting Reminder Sent" := false;
            end;
        }
        modify("Start time")
        {
            trigger OnAfterValidate()
            begin
                Rec."Meeting Reminder Sent" := false;
            end;
        }
    }
}