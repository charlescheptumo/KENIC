table 99221 "Prohibited Substances"
{
    Caption = 'Prohibited Substances';
    DataClassification = AccountData;
    DrillDownPageId = "Prohibited Substances";
    LookupPageId = "Prohibited Substances";
    fields
    {
        field(1; "Substance Code"; Code[70])
        {
            Caption = 'Substance Code';
        }
        field(2; "Substance Description"; Text[200])
        {
            Caption = 'Substance Description';
        }
        field(3; Category; Code[100])
        {
            TableRelation = "Prohibited substance Category".Category;
        }
        field(4; "Sub Category"; Code[200])
        {
            TableRelation = "Substance Sub Category"."Sub Category" where(Category = field(Category));
        }
    }
    keys
    {
        key(PK; "Substance Code")
        {
            Clustered = true;
        }
    }
}
