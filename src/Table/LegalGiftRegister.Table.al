#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56100 "Legal Gift Register"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "No series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(4; "Process Type"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Legal Case,Legal Application,Pleading,Complaint,Legal Action';
            OptionMembers = "Legal Case","Legal Application",Pleading,Complaint,"Legal Action";
        }
        field(5; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; Department; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(9; Division; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(10; CEO; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(11; "Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Unit of Measure"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            CrmGeneralSetup.Get;
            CrmGeneralSetup.TestField(CrmGeneralSetup."Gifts Nos");
            rec.Code := NoSeriesMgt.GetNextNo(CrmGeneralSetup."Gifts Nos", WorkDate(), true);
        end;
        "Created By" := UserId;
        "Created On" := CreateDatetime(Today, Time);
    end;

    var
        CrmGeneralSetup: Record "Crm General Setup.";
        NoSeriesMgt: Codeunit "No. Series";
}

