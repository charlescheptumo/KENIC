table 50185 "Offense Details"
{
    Caption = 'Offense Details';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Offense Code"; Code[20])
        {
            Caption = 'Offense Code';
            DataClassification = ToBeClassified;
        }
        field(2; "Offense Description"; Text[100])
        {
            Caption = 'Offense Description';
            DataClassification = ToBeClassified;
        }
        field(3; "Offense Date"; Date)
        {
            Caption = 'Offense Date';
            DataClassification = ToBeClassified;
        }
        field(4; "Offense Type"; Option)
        {
            Caption = 'Offense Type';
            DataClassification = ToBeClassified;
            OptionMembers = Minor,Major,Severe;
        }
        field(5; "HR Models Code"; Code[20])
        {
            Caption = 'HR Model Code';
            DataClassification = ToBeClassified;
            TableRelation = "HR Models".Code;
        }
    }
    keys
    {
        key(PK; "HR Models Code", "Offense Code")
        {
            Clustered = true;
        }
    }
}