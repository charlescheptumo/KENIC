tableextension 58171 "Board Members Consent Ext" extends "Board Members"
{
    fields
    {
        field(50100; "Data Consent Given"; Boolean)
        {
            Caption = 'Data Consent Given';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50101; "Data Consent Date"; Date)
        {
            Caption = 'Data Consent Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}