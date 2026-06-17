#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69747 "Hand over Item Lines"
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
        field(4; "Temp Id"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Asset,Item,File,Other';
            OptionMembers = Asset,Item,File,Other;
        }
        field(6; No; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Return Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Received By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(69000; "Primary Directorate"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(Code, "Primary Directorate");
                if ResponsibilityCenter.Find('-') then begin
                    "Primary Directorate Name" := ResponsibilityCenter.Name;
                end;
            end;
        }
        field(69001; "Primary Department"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Primary Directorate"));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(Code, "Primary Department");
                if ResponsibilityCenter.Find('-') then begin
                    "Primary Department Name" := ResponsibilityCenter.Name;
                    //"Responsible Employee":=ResponsibilityCenter."Current Head";
                end;
            end;
        }
        field(69002; "Primary Directorate Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(69003; "Primary Department Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(69004; "Received Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(69005; "Recievied Time"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(69006; Receiveved; Boolean)
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

    var
        ResponsibilityCenter: Record "Responsibility Center";
}

