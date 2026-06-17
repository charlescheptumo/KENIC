table 99217 "Medical Specialties"
{
    Caption = 'Medical Specialties';
    DataClassification = ToBeClassified;
    LookupPageId = "Medical Specialties";
    DrillDownPageId = "Medical Specialties";
    fields
    {
        field(1; "Specialty Code"; Code[50])
        {
            Caption = 'Specialty Code';
        }
        field(2; Description; Text[150])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "Specialty Code")
        {
            Clustered = true;
        }
    }
}
