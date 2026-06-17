table 50129 "Managerial Attributes Lines"
{
    Caption = 'Managerial Attributes Lines';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Managerial Template ID"; Code[30])
        {

            TableRelation = "Managerial Attributes".Code;
        }
        field(2; "Line No."; Integer)
        {
            //AutoIncrement = true;
        }
        field(4; "Description"; Text[250])
        {

        }
    }
    keys
    {
        key(PK; "Managerial Template ID","Line No.")
        {
            Clustered = true;
        }
    }
}
