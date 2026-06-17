table 50087 "Sharepoint File List"
{
    DataClassification = ToBeClassified;


    fields
    {
        field(1; Id; Integer)
        {
            Caption = 'Id';
        }
        field(2; Title; Text[250])
        {
            Caption = 'Title';
        }
        field(3; Created; DateTime)
        {
            Caption = 'Created';
        }
        field(4; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(5; "Server Relative Url"; Text[2048])
        {
            Caption = 'Server Relative Url';
        }
        field(6; OdataId; Text[2048])
        {
            Caption = 'Odata.Id';
        }
        field(7; Folder; Boolean)
        {
            Caption = 'Folder';
        }
        field(9; "No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Document Type"; Enum "Approval Document Type")
        {
            DataClassification = ToBeClassified;
        }
        field(11; CreatedBy; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Id, "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        CreatedBy := UserID;
    end;
}