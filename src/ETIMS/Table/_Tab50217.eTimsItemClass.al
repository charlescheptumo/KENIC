/// <summary>
/// Stores the KRA eTIMS item classification codes (class code/name/level, associated taxation type, frequently-used/in-use flags) used to classify items for eTIMS reporting.
/// </summary>
table 50217 "eTims-Item Class"
{
    Caption = 'eTims-Item Class';
    DataClassification = ToBeClassified;
    DrillDownPageId = "eTims-Item Class List";
    LookupPageId = "eTims-Item Class List";

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            AutoIncrement = true;
        }
        field(2; "Frequently Used"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "In Use"; Option)
        {
            OptionMembers = "","Y","N";
        }
        field(4; "Item Class Code"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Item Class Level"; Text[10])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Item Class Name"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Manual Entry"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Taxation Type Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No.", "Item Class Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Item Class Code", "Item Class Name")
        {
        }
    }
}
