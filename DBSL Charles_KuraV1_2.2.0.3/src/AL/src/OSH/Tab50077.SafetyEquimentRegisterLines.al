table 50077 "Safety Equiment Register Lines"
{
    Caption = 'Safety Equiment Register Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Equipment ID"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Maintenance Vendor No."; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(4; "Maintenance Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Insured; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Maintenance Type"; Option)
        {
            OptionMembers = ,Service,Replishment,Replacement;
        }
        field(7; "Next Service Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Line No.")
        {
            Clustered = true;
        }
    }
}
