table 99464 "Work Plan Bill Item"
{
    DrillDownPageID = "Work Plan Bill Items";
    LookupPageID = "Work Plan Bill Items";

    fields
    {
        field(1; "Workplan Type"; Enum "WorkPlan Type")
        {
            DataClassification = ToBeClassified;
            // OptionCaption = 'Constituency,Regional,Consolidated,Consolidated East,Consolidated West';
            // OptionMembers = Constituency,Regional,Consolidated,"Consolidated East","Consolidated West";
        }
        field(2; "Workplan No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "BoQ Template Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BoQ Template Bill Code"."BoQ Template Code";
        }
        field(4; "Bill Item Category Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BoQ Template Bill Code"."Bill Item Category Code";
        }
        field(5; "Activity Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Requisition Template Line" WHERE (Type=FILTER(Item))';
            TableRelation = Item."No.";

            trigger OnValidate()
            begin
                Item.RESET;
                Item.SETRANGE("No.", "Activity Code");
                IF Item.FINDSET THEN
                    Description := Item.Description;
            end;
        }
        field(6; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Technology Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Technology".Code;

            trigger OnValidate()
            begin
                RoadTechnology.RESET;
                RoadTechnology.SETRANGE(RoadTechnology.Code, "Technology Type");
                IF RoadTechnology.FINDSET THEN
                    "Labour %" := RoadTechnology."Labour Percentage";
            end;
        }
        field(8; "Labour %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Unit of Measure Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '20';
        }
        field(10; "Planned Rate (Unit Cost)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Planned Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Line Amount Excl. VAT" := "Planned Quantity" * "Engineer's Rate (Unit Cost)";
                "Line Amount Incl. VAT" := "Line Amount Excl. VAT" + "VAT Amount";
            end;
        }
        field(12; "Contingency %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Engineer's Rate (Unit Cost)"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                VALIDATE("Planned Quantity");
            end;
        }
        field(14; "Packaged Quantity"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                VALIDATE("Planned Quantity");
            end;
        }
        field(15; "Line Amount Excl. VAT"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Gen. Prod. Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "VAT Prod. Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "VAT %"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "VAT Amount" := "VAT %" * "Line Amount Excl. VAT" / 100;
                "Line Amount Incl. VAT" := "Line Amount Excl. VAT" + "VAT Amount";
            end;
        }
        field(19; "VAT Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                VALIDATE("VAT %");
            end;
        }
        field(20; "Line Amount Incl. VAT"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Line Amount Excl. VAT" := (100 + "VAT %") / 100 * "Line Amount Incl. VAT";
                VALIDATE("VAT %");
            end;
        }
        field(21; "Shortcut Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Shortcut Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Variant Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Default Job Task No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(27; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Contract Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Construction,PBRM';
            OptionMembers = " ",Construction,PBRM;
        }
        field(29; "Reversion Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'To Contractor,To Authority';
            OptionMembers = "To Contractor","To Authority";
        }
        field(30; "Funding Source Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Funding Source Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Regular,Savings';
            OptionMembers = " ",Regular,Savings;
        }
        field(32; "Constituency Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code WHERE("Region Code" = FIELD("Region Code"));
        }
        field(33; "Region Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code WHERE(Blocked = FILTER(false),
                                                               "Operating Unit Type" = FILTER(Region));
        }
        field(34; Revised; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Revision No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Workplan Type", "Workplan No", "Line No", "Entry No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        WorkPlanBillItem: Record "Work Plan Bill Item";
    begin
        WorkPlanBillItem.Reset();
        WorkPlanBillItem.SetRange("Workplan Type", Rec."Workplan Type");
        WorkPlanBillItem.SetRange("Workplan No", Rec."Workplan No");
        WorkPlanBillItem.SetRange("Line No", Rec."Line No");
        if WorkPlanBillItem.FindLast() then
            Rec."Entry No" := WorkPlanBillItem."Entry No" + 1
        ELSE
            Rec."Entry No" := 1;
        RAMWorkplanLine.RESET;
        RAMWorkplanLine.SETRANGE(RAMWorkplanLine."Document No", "Workplan No");
        RAMWorkplanLine.SETRANGE(RAMWorkplanLine."Workplan Type", RAMWorkplanLine."Workplan Type"::Constituency);
        IF RAMWorkplanLine.FindFirst() THEN BEGIN

            "Region Code" := RAMWorkplanLine."Region Code";
            "Constituency Code" := RAMWorkplanLine."Constituency Code";
            "Funding Source Code" := RAMWorkplanLine."Global Dimension 2 Code";
            "Funding Source Type" := RAMWorkplanLine."Funding Source Type";

        END;

    end;

    var
        RoadTechnology: Record "Road Technology";
        Item: Record Item;
        RAMWorkplanLine: Record "RAM Workplan Line";
}

