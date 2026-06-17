#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70220 "Purchase Contract Milestone"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = const("Blanket Order"));
        }
        field(3; "Milestone Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Payment Instalment Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Contract Payment Term"."Instalment Code" where("No." = field("No."));
        }
        field(6; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(7; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Milestone Deliverables"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Date Notified"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Select; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "No of IPCs"; Integer)
        {
            CalcFormula = count("Measurement &  Payment Header" where("Milestone Code" = field("Milestone Code")));
            FieldClass = FlowField;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Milestone Code", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

