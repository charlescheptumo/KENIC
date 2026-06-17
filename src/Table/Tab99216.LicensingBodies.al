table 99216 "Licensing Bodies"
{
    Caption = 'Licensing Bodies';
    DataClassification = CustomerContent;
    LookupPageId = "Licensing Bodies";
    DrillDownPageId = "Licensing Bodies";
    fields
    {
        field(1; "Licensing Body"; Code[50])
        {
            Caption = 'Licensing Body';
        }
        field(2; Description; Text[150])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "Licensing Body")
        {
            Clustered = true;
        }
    }
}
