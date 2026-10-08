tableextension 60002 "Sales Invoice Header Ext1" extends "Sales Invoice Header"
{
    
    fields
    {
        field(50029; "GRN No."; Code[20])
        {
            FieldClass = Normal;

        }
        //START Etims SCU INFORMATION      

        // new
        field(50150; "SCU ID"; Text[250])
        {
            //TableRelation = "Bank Account";
        }
        field(50152; "CU Invoice Number"; Text[250])
        {
            //TableRelation = "Bank Account";
        }
        field(50153; EtimsDate; Date)
        {
            //TableRelation = "Bank Account";
        }
        field(50154; EtimsTime; time)
        {
            //TableRelation = "Bank Account";
        }
        field(50155; "Internal Data"; Text[250])
        {
            //TableRelation = "Bank Account";
        }
        field(50156; "Receipt Signature"; Text[250])
        {
            //TableRelation = "Bank Account";
        }
        field(50157; "QRCodeUrl"; Text[250])
        {
            //TableRelation = "Bank Account";
        }
        field(50158; "Posted To Etims"; Boolean)
        {
            //TableRelation = "Bank Account";
        }
        field(50159; "KRA QR Code"; Blob)
        {
            Caption = 'KRA QR Code';
            Subtype = Bitmap;
            //TableRelation = "Bank Account";
        }
        field(50160; "Invoice Number"; Decimal)
        {
            //TableRelation = "Bank Account";
        }
        field(50161; "ETIMS Local Invoice Number"; Integer)
        {
            //TableRelation = "Bank Account";
        }
        // field(60000; "Date"; Date)
        // {
        //     Caption = '';
        //     DataClassification = ToBeClassified;
        // }
        // field(60001; "Time"; Time)
        // {
        //     DataClassification = ToBeClassified;
        // }       

        field(60009; "Sales Type Code"; Code[20])
        {
            TableRelation = "Sales Type Code".Code;
        }
        field(60010; "Invoice Status Code"; Code[30])
        {
            TableRelation = "Invoice Status Code".Code;
        }
        //END Etims SCU INFORMATION
    }

}
