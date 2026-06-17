#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69744 "Exit Plan Lines"
{

    fields
    {
        field(1; "Exit Header No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Exit Voucher,Hand Over Voucher,Final Dues Voucher';
            OptionMembers = " ","Exit Voucher","Hand Over Voucher","Final Dues Voucher";
        }
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4; "Primary Directorate"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(5; "Primary Directorate Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Primary Department"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Primary Directorate"));
        }
        field(7; "Primary Department Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Responsible Employee"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(9; "Planned Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Actual Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Cleared';
            OptionMembers = Open,Cleared;
        }
        field(12; "cleared By"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Hand Doc Over No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Final Due Doc No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Exit Header No", "Document Type", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

