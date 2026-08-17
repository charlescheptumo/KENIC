table 57213 "Document Agreement"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer)
        {

            Caption = 'No.';
            AutoIncrement = true;

        }

        field(2; "Document Number"; Code[50])
        {
            Caption = 'Document Number';
        }

        field(3; "Agreement ID"; Text[2048])
        {
            Caption = 'Agreement ID';
        }

        field(4; "Status"; Text[2048])
        {
            Caption = 'Status';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }



}