table 50132 "Core Values & Attributes"
{
    Caption = 'Core Values & Attributes';
    DataClassification = ToBeClassified;
    
    fields
    {
      field(1; "Code"; Code[50])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(3; "Effective Date";Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Effective Date';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
