table 99214 "Sport Discipline"
{
    Caption = 'Sport Discipline';
    DataClassification = CustomerContent;
    LookupPageId = "Sport Disciplines";
    DrillDownPageId = "Sport Disciplines";
    fields
    {
        field(1; "Discipline Code"; Code[50])
        {
            Caption = 'Discipline Code';
        }
        field(2; Description; Text[150])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "Discipline Code")
        {
            Clustered = true;
        }
    }
}
