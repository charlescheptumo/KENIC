/// <summary>
/// Stores eTIMS refund reason setup codes (code, name, description, sort order, active flag) used to classify refund reasons for eTIMS credit note submissions.
/// </summary>
table 50222 "eTims-Refund Reasons"
{
    Caption = 'eTims-Refund Reasons';
    DataClassification = ToBeClassified;
    LookupPageId = "eTims-Refund Reasons List";
    DrillDownPageId = "eTims-Refund Reasons List";

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; "Code Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Code Description"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Sort Order"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "UseYN"; Option)
        {
            OptionMembers = "",Y,N;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Code", "Code Name")
        {
        }
    }
}
