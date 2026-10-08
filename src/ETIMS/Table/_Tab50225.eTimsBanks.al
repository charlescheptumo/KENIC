/// <summary>
/// Lookup table of bank codes (with name, description, active flag and sort order) used for eTIMS-related bank reference data.
/// </summary>
table 50225 "eTims-Banks"
{
    Caption = 'eTims-Banks';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; "Code Name"; Text[200])
        {
            Caption = 'Code Name';
        }
        field(3; "Code Description"; Text[200])
        {
            Caption = 'Code Description';
        }
        field(4; UseYN; Option)
        {
            Caption = 'UseYN';
            OptionMembers = "","Y","N";
        }
        field(5; sortOder; Integer)
        {
            Caption = 'sortOder';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
