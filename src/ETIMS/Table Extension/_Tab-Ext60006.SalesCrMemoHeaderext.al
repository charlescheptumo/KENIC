tableextension 60006 "Sales Cr.Memo Header ext1" extends "Sales Cr.Memo Header"
{
    fields
    {
        field(50029; "GRN NO"; Code[50])
        {
            Caption = 'GRN NO';
            DataClassification = ToBeClassified;
        }
        //START Etims SCU INFORMATION     
        // new
        field(50150; "SCU ID"; Text[250])
        {
            //TableRelation = "Bank Account";
        }
        field(50151; "CU Invoice Number"; Text[250])
        {
            //TableRelation = "Bank Account";
        }
        field(50152; EtimsDate; Date)
        {
            //TableRelation = "Bank Account";
        }
        field(50153; EtimsTime; time)
        {
            //TableRelation = "Bank Account";
        }
        field(50154; "Internal Data"; Text[250])
        {
            //TableRelation = "Bank Account";
        }
        field(50155; "Receipt Signature"; Text[250])
        {
            //TableRelation = "Bank Account";
        }
        field(50156; "QRCodeUrl"; Text[250])
        {
            //TableRelation = "Bank Account";
        }
        field(50157; "Posted To Etims"; Boolean)
        {
            //TableRelation = "Bank Account";
        }
        field(50158; "KRA QR Code"; Blob)
        {
            //TableRelation = "Bank Account";
            Caption = 'KRA QR Code';
            Subtype = Bitmap;
        }
        field(50159; "Invoice Number"; Decimal)
        {
            //TableRelation = "Bank Account";
        }
        field(50160; "ETIMS Local Invoice Number"; Integer)
        {
            //TableRelation = "Bank Account";
        }
        // field(60002; "Date"; Date)
        // {
        //     Caption = '';
        //     DataClassification = ToBeClassified;
        // }
        // field(60003; "Time"; Time)
        // {
        //     DataClassification = ToBeClassified;
        // }
        //END Etims SCU INFORMATION
    }
}
