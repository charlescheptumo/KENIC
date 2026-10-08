/// <summary>
/// Log table capturing eTIMS credit note push requests and responses, including the JSON payload, SCU/invoice signature data, QR code URL, and whether the credit note was successfully posted to eTIMS.
/// </summary>
table 60013 eTimsPushCredit
{
    Caption = 'eTimsPushCredit';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Integer)
        {
            Caption = 'No';
            AutoIncrement = true;
        }
        field(2; Json; Text[2048])
        {
            Caption = 'Json';
        }
        field(3; Code; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Date"; DateTime)
        {
            Caption = '';
            DataClassification = ToBeClassified;
        }
        field(5; "Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "SCU ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "CU Invoice Number"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Internal Data"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Receipt Signature"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Posted to Etims"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Invoice Number"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "QRCodeUrl"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Request; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Request Message"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }
}
