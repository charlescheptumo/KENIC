table 50159 "Memo subtypeII"
{
    Caption = 'Memo subtypeII';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[50])
        {
            Caption = 'Code';
            TableRelation = "Subtype Categories";
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
           
        }
        field(3; Subtype; Code[500])
        {
            Caption = 'Subtype ';
        }
        field(5; "No series"; Code[50])
        {
            Caption = 'No series';
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "Code","Line No.",Subtype)
        {
            Clustered = true;
        }

       
    }

    fieldgroups{
    fieldgroup(DropDown;Subtype)
    {}
    }
}
