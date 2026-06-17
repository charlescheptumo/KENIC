table 99228 "Substance Sub Category"
{
    Caption = 'Substance Sub Category';
    DrillDownPageId = "Substance SubCategory";
    LookupPageId = "Substance SubCategory";
    fields
    {
        field(1; Category; Code[100])
        {
            Caption = 'Category';
        }
        field(2; "Sub Category"; Code[100])
        {
            Caption = 'Sub Category';
        }
        field(3; Description; Text[200])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; Category, "Sub Category")
        {
            Clustered = true;
        }
    }
}
