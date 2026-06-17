#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 59027 "Fuel Topup Request"
{
    DrillDownPageID = "Fuel Top Up List";
    LookupPageID = "Fuel Top Up List";

    fields
    {
        field(1; No; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Vendor No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                if Vendor.Get("Vendor No") then
                    "Vendor Name" := Vendor.Name;
            end;
        }
        field(3; "Vendor Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Request Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Requested by"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,"Pending Approval",Approved,Cancelled,Rejected';
            OptionMembers = Open,"Pending Approval",Approved,Cancelled,Rejected;
        }
        field(11; "Card No."; code[90])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fuel Card";
            trigger OnValidate
            ()
            var
                fuel: Record "Fuel Card";
            begin
                if fuel.get("Card No.") then
                    "Last Top Up" := fuel."Total Amount Spend"
            end;
        }
        field(12; "Last Top Up"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(13; "Vehicle Registration No."; text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fleet Vehicles."."No.";

        }
        field(14; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
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
    }

    trigger OnInsert()
    begin
        if No = '' then begin
            FltMgtSetup.Get;
            FltMgtSetup.TestField(FltMgtSetup."Fuel Top up  No");
            rec."No"  := NoSeriesMgt.GetNextNo(FltMgtSetup."Fuel Top up  No", WorkDate(), true);
        end;
        "Request Date" := Today;
        "Requested by" := UserId;
    end;

    trigger OnModify()
    begin
        "Request Date" := Today;
        "Requested by" := UserId;
    end;

    var
        Vendor: Record Vendor;
        FltMgtSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit "No. Series";
}

