table 50158 "Subtype Categories"
{
    Caption = 'Subtype Categories';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[50])
        {
            Caption = 'Code';
        }
        field(2; "File Category Code"; Code[50])
        {
            Caption = 'File Category Code';
            TableRelation = "Memo Departments";
        }
        field(3; "Subtype "; Code[50])
        {
            Caption = 'Subtype ';
        }
        field(4; Decsription; Text[250])
        {
            Caption = 'Decsription';
        }
        field(5; "No series"; Code[50])
        {
            Caption = 'No series';
            TableRelation = "No. Series";
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
