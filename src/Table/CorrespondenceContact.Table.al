#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 72056 "Correspondence Contact"
{
    DrillDownPageID = "Defect Detection&Rectificati C";
    LookupPageID = "Defect Detection&Rectificati C";

    fields
    {
        field(1; No; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Individual,Company';
            OptionMembers = Individual,Company;
        }
        field(3; "Company Name"; Text[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Address; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Address 2"; Code[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(6; City; Code[300])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Post Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Post Code".Code;

            trigger OnValidate()
            begin
                PostCode.Reset;
                PostCode.SetRange(PostCode.Code, "Post Code");
                if PostCode.FindSet then begin
                    City := PostCode.City;
                end;
            end;
        }
        field(8; "Phone No"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(9; "E-mail"; Text[300])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(10; Homepage; Text[300])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(11; "No Series"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Contact PersonTitle"; Text[700])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Contact Person Name"; Text[700])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Contact Person Email"; Text[300])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; No, Type, "Company Name", "Contact PersonTitle", "Contact Person Name")
        {
        }
        fieldgroup(Brick; No, Type, "Company Name", "Contact PersonTitle", "Contact Person Name")
        {
        }
    }

    trigger OnInsert()
    begin
        if No = '' then begin
            HumanResourcesSetup.Get();
            HumanResourcesSetup.TestField("Correspondence Contact Nos");
            no  := NoSeriesManagement.GetNextNo(HumanResourcesSetup."Correspondence Contact Nos", WorkDate(), true);
          //  NoSeriesManagement.InitSeries(HumanResourcesSetup."Correspondence Contact Nos", xRec."No Series", Today, No, "No Series");
        end;
    end;

    var
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeries: Record "No. Series";
        NoSeriesManagement: Codeunit "No. Series";
        PostCode: Record "Post Code";
}

