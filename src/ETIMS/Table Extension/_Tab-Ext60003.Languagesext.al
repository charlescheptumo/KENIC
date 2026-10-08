tableextension 60003 "Languages ext" extends Language
{
    fields
    {
        field(60000; UseYN; Option)
        {
            Caption = 'UseYN';
            OptionMembers = "","Y","N";
        }
        field(60001; "Code Description"; Text[200])
        {
            Caption = 'Code Description';
            DataClassification = ToBeClassified;
        }
        field(60002; "Sort Order"; Integer)
        {
            Caption = 'Sort Order';
            DataClassification = ToBeClassified;
        }
    }
}
