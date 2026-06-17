table 99219 "Medical Practioner Categories"
{
    Caption = 'Medical Practioner Catgories';
    DataClassification = AccountData;
    LookupPageId = MedicalPractitionersCategories;
    DrillDownPageId = MedicalPractitionersCategories;
    fields
    {
        field(1; Category; Code[50])
        {
            Caption = 'Category';
        }
        field(2; Description; Text[150])
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
