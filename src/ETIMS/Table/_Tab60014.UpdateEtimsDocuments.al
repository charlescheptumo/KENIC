/// <summary>
/// Log table storing the eTIMS SCU (Sales Control Unit) signature information - invoice number, date/time, SCU ID, CU invoice number, internal data, receipt signature and QR code URL - returned when a document is submitted to eTIMS.
/// </summary>
table 60014 "Update Etims Documents"
{
    Caption = 'Update Etims Documents';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        //START Etims SCU INFORMATION
        field(3; "Invoice Number"; Code[30])
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
        field(10; "QRCodeUrl"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        //END Etims SCU INFORMATION
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
