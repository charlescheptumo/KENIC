#pragma warning disable AA0005, AA0008, AA0018,AL0603, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings

tableextension 50073 StandardSalesCodeExt extends "Standard Sales Code"
{
    fields
    {
        field(50000; "Method of Disposal"; Option)
        {
            Caption = 'Method of Disposal';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Transfer to Public Entity,Sale by Public Tender,Sale by Public Auction,Trade-in,Dispose to Employee,Waste Disposal Management';
            OptionMembers = "Transfer to Public Entity","Sale by Public Tender","Sale by Public Auction","Trade-in","Dispose to Employee","Waste Disposal Management";
        }
        field(50001; "Disposal Type"; Code[50])
        {
            Caption = 'Disposal Type';
            DataClassification = ToBeClassified;
            TableRelation = "Disposal Types";
        }
        field(50002; "External Document No"; Code[100])
        {
            Caption = 'External Document No';
            DataClassification = ToBeClassified;
        }
        field(50003; "Project ID"; Code[100])
        {
            Caption = 'Project ID';
            DataClassification = ToBeClassified;
        }
        field(50004; "Assigned Procurement Officer"; Code[100])
        {
            Caption = 'Assigned Procurement Officer';
            DataClassification = ToBeClassified;
        }
        field(50005; "Requesting Directorate"; Code[100])
        {
            Caption = 'Requesting Directorate';
            DataClassification = ToBeClassified;
        }
        field(50006; "Requesting Department"; Code[100])
        {
            Caption = 'Requesting Department';
            DataClassification = ToBeClassified;
        }
        field(50007; "Tender Name"; Text[100])
        {
            Caption = 'Tender Name';
            DataClassification = ToBeClassified;
        }
        field(50008; "Tender Summary"; Text[100])
        {
            Caption = 'Tender Summary';
            DataClassification = ToBeClassified;
        }
        field(50009; "Status"; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            OptionCaption = ',Open,Pending Approval,Approved,Disposed,Released';
            OptionMembers = "Open","Pending Approval","Approved","Disposed","Released";
        }
        field(50010; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = ToBeClassified;
        }
        field(50011; "Disposal Requisition No"; code[50])
        {
            Caption = 'Disposal Requisition No';
            DataClassification = ToBeClassified;
            TableRelation = "Disposal Header".No;

            trigger OnValidate()
            var
                StdSaleLine: Record "Standard Sales Line";
                StdSaleLine1: Record "Standard Sales Line";
            begin
                StdSaleLine.Reset();
                StdSaleLine.SetRange("Standard Sales Code", Code);
                if StdSaleLine.FindSet() then
                    StdSaleLine.DeleteAll();

                DispLines.Reset;
                DispLines.SetRange("Document No.", "Disposal Requisition No");
                if DispLines.FindSet() then begin
                    repeat
                        StdSaleLine1.Init;
                        StdSaleLine1."Standard Sales Code" := Rec.Code;
                        // StdSaleLine1."Line No." := DispLines."Line No.";
                        StdSaleLine1.Type := DispLines.Type;
                        StdSaleLine1."No." := DispLines."Fixed Asset/Item No.";
                        StdSaleLine1.Description := DispLines."Description of Item";
                        StdSaleLine1."Disposal Type" := DispLines."Disposal Type";
                        StdSaleLine1."Disposal Methods" := DispLines."Disposal Methods";
                        StdSaleLine1.Quantity := DispLines.Quantity;
                        StdSaleLine1."Unit of Measure Code" := DispLines."Unit of Issue";
                        StdSaleLine1."Amount Excl. VAT" := DispLines."Estimated current value";
                        StdSaleLine1.Insert();
                    until DispLines.Next() = 0;
                end;
            end;
        }
        field(50013; "Disposal  Plan ID"; code[50])
        {
            Caption = 'Disposal Plan ID';
            DataClassification = ToBeClassified;
            TableRelation = "Annual Disposal plan Header".No;
        }
        field(50014; "Created Date/Time"; DateTime)
        {
            Caption = 'Created Date/Time';
            DataClassification = ToBeClassified;
        }
        field(50015; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
        }
        field(50016; "Cancel Reason Code"; Code[50])
        {
            Caption = 'Cancel Reason Code ';
            DataClassification = ToBeClassified;
        }
        field(50017; "Location Code"; Code[50])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(50018; "Cancellation Date"; Date)
        {
            Caption = 'Cancellation Date';
            DataClassification = ToBeClassified;
        }
        field(50019; "Cancellation Secret Code"; code[80])
        {
            Caption = 'Cancellation Secret Code';
            DataClassification = ToBeClassified;
        }
        field(50020; "No. of Submission"; code[80])
        {
            Caption = 'No. of Submission';
            DataClassification = ToBeClassified;
        }
        field(50021; "Disposal  Plan Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50022; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(50023; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
            DataClassification = ToBeClassified;
        }
        field(50024; Address; Text[100])
        {
            Caption = 'Address';
            DataClassification = ToBeClassified;
        }
        field(50025; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
            DataClassification = ToBeClassified;
        }
        field(50026; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            DataClassification = ToBeClassified;
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(50027; City; Text[30])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(50028; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty(City, "Post Code", County, "Country/Region Code", xRec."Country/Region Code");
            end;
        }
        field(50029; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;

            trigger OnValidate()
            var
                Char: Char;
                i: Integer;
            begin
                // FOR i := 1 TO STRLEN("Phone No.") DO
                //  IF Char.IsLetter("Phone No."[i]) THEN
                //    ERROR(PhoneNoCannotContainLettersErr);
            end;
        }
        field(50030; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            DataClassification = ToBeClassified;
            Description = 'Copy default Procurement Email from E-Procurement Setup Table';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(50031; "Submission Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50032; "Submission Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(50033; "Submission End Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Tender Validity Expiry Date" := CalcDate("Tender Validity Duration", "Submission End Date");
                "Bid Security Expiry Date" := CalcDate("Bid Security Validity Duration", "Submission End Date");
            end;
        }
        field(50034; "Submission End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(50035; "Tender Box Location Code"; Code[250])
        {
            Caption = 'Tender Box Location Code';
            DataClassification = ToBeClassified;
        }
        field(50036; "Tender Validity Duration"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50037; "Tender Validity Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50038; "Bid Security Validity Duration"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50039; "Bid Security Expiry Date"; Date)
        {
            Caption = 'Bid Security Validity Expiry Date';
            DataClassification = ToBeClassified;
            Description = 'Bid Security Validity Expiry Date';
            Editable = false;
        }
        field(50040; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
            DataClassification = ToBeClassified;
        }
        field(50041; "Procuring Entity Name/Contact"; Text[80])
        {
            DataClassification = ToBeClassified;
        }


    }

    var
        PostCode: Record "Post Code";
        DispHeader: Record "Disposal Header";
        DispLines: Record "Disposal Lines";
}
