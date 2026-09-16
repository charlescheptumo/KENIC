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
    }
}