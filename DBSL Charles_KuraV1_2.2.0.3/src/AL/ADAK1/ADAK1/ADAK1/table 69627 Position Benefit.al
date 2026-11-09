table 79627 "Position Benefit"
{
    Caption = 'Position Benefit';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Position ID"; Code[30])
        {
            Caption = 'Position ID';
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";
        }
        field(2; "Line No"; Integer)
        {
            Caption = 'Line No';
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Benefit Category"; Option)
        {
            Caption = 'Benefit Category';
            DataClassification = ToBeClassified;
            OptionCaption = 'Allowance,Insurance,Leave,Retirement,Training & Development,Other';
            OptionMembers = Allowance,Insurance,Leave,Retirement,"Training & Development",Other;
        }
        field(4; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Position ID", "Line No")
        {
            Clustered = true;
        }
    }
}
