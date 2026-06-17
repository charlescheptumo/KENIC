table 50088 UploadedSharepointDocuments
{
    Caption = 'UploadedSharepointDocuments';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; EntryNo; Integer)
        {
            Caption = 'EntryNo';
            AutoIncrement = true;
        }
        field(2; ApplicationNo; Code[50])
        {
            Caption = 'ApplicationNo';
        }
        field(3; FileName; Text[250])
        {
            Caption = 'FileName';
        }
        field(4; FileLink; Text[500])
        {
            Caption = 'FileLink';
            ExtendedDatatype = URL;
            Editable = false;
        }
    }
    keys
    {
        key(PK; EntryNo)
        {
            Clustered = true;
        }
    }
}
