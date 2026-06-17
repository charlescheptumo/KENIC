#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50079 "Incoming Correspondence Line"
{
    Caption = 'Incoming Correspondence Line';

    fields
    {
        field(1; "Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Recipient No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Recipient Type" = const(Office)) "Responsibility Center".Code where("Operating Unit Type" = filter(Region | Directorate | "Department/Center"))
            else if ("Recipient Type" = const(Individual)) Employee."No." where(Status = const(Active));

            trigger OnValidate()
            begin
                if "Recipient Type" = "recipient type"::Individual then begin
                    Employee.Reset;
                    Employee.SetRange(Employee."No.", "Recipient No");
                    if Employee.FindSet then begin
                        "Recipient No" := Employee."No.";
                        "Recipient Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        "Recipient Email" := Employee."E-Mail";
                        "Recipient Directorate Code" := Employee."Directorate Code";
                        Validate("Recipient Directorate Code");
                        "Recepient Region Code" := Employee."Global Dimension 1 Code";
                        Validate("Recepient Region Code");
                        "Recipient Department Code" := Employee."Department Code";
                        Validate("Recipient Department Code");
                        "Recipient Job ID" := Employee."Job ID";
                        Validate("Recipient Job ID");
                        "Recipient Address" := Employee.Address;
                        "Recipient Address 2" := Employee."Address 2";
                        "Recipient City" := Employee.City;
                        "Recipient Post Code" := Employee."Post Code";
                        "Receipient User ID" := Employee."User ID";
                    end;
                end
                else begin
                    ResponsibilityCenter.Reset;
                    ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Recipient No");
                    if ResponsibilityCenter.FindSet then begin
                        ResponsibilityCenter.TestField("Current Head");
                        "Recipient No" := ResponsibilityCenter.Code;
                        "Recipient Name" := ResponsibilityCenter.Name;
                        "Recipient Email" := ResponsibilityCenter."E-Mail";
                        "Recipient Address" := ResponsibilityCenter.Address;
                        "Recipient Address 2" := ResponsibilityCenter."Address 2";
                        "Recipient Post Code" := ResponsibilityCenter."Post Code";
                        "Recipient Job ID" := ResponsibilityCenter."Headed By (Title)";
                        Validate("Recipient Job ID");
                        Employee.Reset;
                        Employee.SetRange(Employee."No.", ResponsibilityCenter."Current Head");
                        if Employee.FindFirst() then begin
                            Employee.TestField("User ID");
                            "Receipient User ID" := Employee."User ID";
                        end;
                    end;
                end;
            end;
        }
        field(4; "Recipient Name"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Recipient Email"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Recipient Directorate Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Recipient Directorate Code");
                if ResponsibilityCenter.FindSet then begin
                    "Recipient Directorate Name" := ResponsibilityCenter.Name;
                    "Recipient Email" := ResponsibilityCenter."E-Mail";
                end;
            end;
        }
        field(7; "Recipient Directorate Name"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Recipient Directorate Email"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Recepient Region Code"; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Recepient Region Code");
                if ResponsibilityCenter.FindSet then begin
                    "Recepient Region Name" := ResponsibilityCenter.Name;
                end;
            end;
        }
        field(10; "Recepient Region Name"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Recipient Department Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Recipient Department Code");
                if ResponsibilityCenter.FindSet then begin
                    "Recipient Department Name" := ResponsibilityCenter.Name;
                end;
            end;
        }
        field(12; "Recipient Department Name"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Recipient Job ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                Positions.Reset;
                Positions.SetRange(Positions."Position ID", "Recipient Job ID");
                if Positions.FindSet then
                    "Recipient Job Title" := Positions."Job Title";
            end;
        }
        field(14; "Recipient Job Title"; Text[300])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "Recipient Address"; Text[100])
        {
            Caption = 'Address';
            DataClassification = ToBeClassified;
        }
        field(16; "Recipient Address 2"; Text[500])
        {
            Caption = 'Address 2';
            DataClassification = ToBeClassified;
        }
        field(17; "Recipient City"; Text[30])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(18; "Recipient Post Code"; Code[20])
        {
            Caption = 'Post Code';
            DataClassification = ToBeClassified;
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(19; "Recipient Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Individual,Office';
            OptionMembers = Individual,Office;
        }
        field(20; "Sender Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Notification Type"; Option)
        {
            DataClassification = ToBeClassified;
            InitValue = Receipient;
            OptionCaption = 'Receipient,CC';
            OptionMembers = Receipient,CC;
        }
        field(22; "Receipient User ID"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        /*GeneralCorrespondenceHeader.RESET;
        GeneralCorrespondenceHeader.SETRANGE(GeneralCorrespondenceHeader."Document No","Document No");
        GeneralCorrespondenceHeader.SETRANGE(GeneralCorrespondenceHeader."Document Type","Entry No");
        GeneralCorrespondenceHeader.SETRANGE(GeneralCorrespondenceHeader.Type,"Recipient No");
        IF GeneralCorrespondenceHeader.FINDSET THEN BEGIN
          "Sender Name":=GeneralCorrespondenceHeader."Sender Name";
          "Communication Subject":=GeneralCorrespondenceHeader."Communication Subject";
          "External Reference No":=GeneralCorrespondenceHeader."External Reference No";
          END;*/

    end;

    var
        Employee: Record Employee;
        ResponsibilityCenter: Record "Responsibility Center";
        Contact: Record Contact;
        Positions: Record Positions;
        PostCode: Record "Post Code";
        CorrespondenceContact: Record "Correspondence Contact";
        GeneralCorrespondenceHeader: Record "General Correspondence Header";
        UserSetup: Record "User Setup";
}

