table 99227 "Prohibited substance Category"
{
    Caption = 'Prohibited substance Category';
    DataClassification = AccountData;
    LookupPageId = "Prohibited SubstanceCategories";
    DrillDownPageId = "Prohibited SubstanceCategories";
    fields
    {
        field(1; Category; Code[150])
        {
            Caption = 'Category';
        }
        field(2; Description; Text[200])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; Category)
        {
            Clustered = true;
        }
    }
}
