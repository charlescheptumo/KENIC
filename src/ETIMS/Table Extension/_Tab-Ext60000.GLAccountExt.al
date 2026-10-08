tableextension 60000 "G/L Account Ext" extends "G/L Account"
{
    fields
    {
        field(60000; "Country of Origin"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Country of Origin';
            TableRelation = "eTims-Country Codes".Code;
        }
        field(60001; "Service Type"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Product Type';
            TableRelation = "eTims-Product Type"."Code";
        }
        field(60002; "Packaging Unit code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "eTims-Packaging Unit".Code;
            Caption = 'Packaging Unit code';
        }
        field(60003; "Quantity Unit Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "eTims-Quantity Unit Code".Code;
            Caption = 'Quantity Unit Code';
            trigger OnValidate()
            begin
                generateItemCode();
            end;
        }
        field(60004; "Etims Item Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60005; "Branch Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "eTims-Branch"."Branch Id";
            Caption = 'Branch Code';
        }
        field(60006; "Item Class"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "eTims-Item Class"."Item Class Code";
        }
        field(60007; "Tax Type"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "eTims-Taxation Type".Code;
        }
        field(60008; "Insuarance Applicable"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","Y","N";
        }
        field(60009; "Posted to Etims"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        //END ETims
    }

    procedure generateItemCode()
    var
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "No. Series";
        NextTimsNo: Text;
    begin
        if "Etims Item Code" = '' then begin
            "Country of Origin" := 'KE';
            "Service Type" := '3';
            "Packaging Unit code" := 'OU';
            "Quantity Unit Code" := 'NO';
            SalesReceivablesSetup.Get();
            SalesReceivablesSetup.TestField("Etims Nos.");
            NextTimsNo := NoSeriesMgt.GetNextNo(SalesReceivablesSetup."Etims Nos.", 0D, TRUE);

            "Etims Item Code" := "Country of Origin" + "Service Type" + "Packaging Unit code" + "Quantity Unit Code" + NextTimsNo;
            Rec.Modify();
        end
    end;
}
