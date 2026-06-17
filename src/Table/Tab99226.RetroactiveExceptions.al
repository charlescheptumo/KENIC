table 99226 "Retroactive Exceptions"
{
    Caption = 'Retroactive Exceptions';
    DataClassification = ToBeClassified;
    LookupPageId = "Retroactive Exceptions";
    DrillDownPageId = "Retroactive Exceptions";
    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; Exception; Text[500])
        {
            Caption = 'Exception';
        }
    }
    keys
    {
        key(PK; "Entry No.", Exception)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; Exception)
        {

        }
        fieldgroup(Brick; Exception)
        {

        }
    }
}
