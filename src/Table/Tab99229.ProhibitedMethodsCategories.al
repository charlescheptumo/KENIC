table 99229 "Prohibited Methods Categories"
{
    Caption = 'Prohibited Methods Categories';
    DataClassification = CustomerContent;
    LookupPageId = "Prohibited Methods Categories";
    DrillDownPageId = "Prohibited Methods Categories";
    fields
    {
        field(1; Category; Code[150])
        {
            Caption = 'Category';
        }
        field(2; Description; Text[400])
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
