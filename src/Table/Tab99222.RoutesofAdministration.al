table 99222 "Routes of Administration"
{
    Caption = 'Routes of Administration';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Routes of Administration";
    LookupPageId = "Routes of Administration";
    fields
    {
        field(1; "Route of Administration"; Code[100])
        {
            Caption = 'Route of Administration';
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(3; "Main Category"; Code[50])
        {
            Caption = 'Main Category';
        }
    }
    keys
    {
        key(PK; "Route of Administration")
        {
            Clustered = true;
        }
    }
}
