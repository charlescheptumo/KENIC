table 50052 "Item Brand"
{
    Caption = 'Item Brand';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[200])
        {
            Caption = 'Code';
        }
        field(2; Brand; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
}
