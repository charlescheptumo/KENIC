table 50117 "Memo Departments"
{
    Caption = 'Memo Departments';
    DataClassification = ToBeClassified;
    LookupPageId = "Memo Departments";

    fields
    {
        field(1; Code; Code[100])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[2048])
        {

        }
        field(3;Directorate; code[50])
        {
         TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Directorate"));
        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
}
