table 58119 "Resolution Members"
{
    Caption = 'Resolution Member Criteria';
    DataClassification = CustomerContent;
    TableType = Temporary;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Generation Method"; Option)
        {
            Caption = 'Generation Method';
            OptionMembers = " ",Employee,"Responsibility Center","Operating Unit Type",Branch;
        }
        field(3; "Employee Filter"; Code[20])
        {
            Caption = 'Employee Filter';
            TableRelation = Employee."No." where(Status = const(Active));
        }
        field(4; "Responsibility Center Filter"; Code[10])
        {
            Caption = 'Responsibility Center Filter';
            TableRelation = "Responsibility Center".Code;
        }
        field(5; "Operating Unit Type Filter"; Option)
        {
            Caption = 'Operating Unit Type Filter';
            OptionMembers = " ","Board of Directors","Executive Committee",Department,Branch,Unit;
        }
        field(6; "Branch Filter"; Code[20])
        {
            Caption = 'Branch Filter';
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('BRANCH'));
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}