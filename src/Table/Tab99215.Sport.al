table 99215 Sport
{
    Caption = 'Sport';
    DataClassification = CustomerContent;
    LookupPageId = Sports;
    DrillDownPageId = Sports;
    fields
    {
        field(1; "Sport Code"; Code[50])
        {
            Caption = 'Sport Code';
        }
        field(2; Description; Text[150])
        {
            Caption = 'Description';
        }
        field(3; Discipline; Code[50])
        {
            Caption = 'Discipline';
            TableRelation = "Sport Discipline"."Discipline Code";
        }
        field(4; "Discipline Description"; Text[150])
        {
            fieldClass = flowfield;
            Calcformula = Lookup("Sport Discipline".Description where("Discipline Code" = field(Discipline)));
            Caption = 'Discipline Description';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Sport Code")
        {
            Clustered = true;
        }
    }
}
