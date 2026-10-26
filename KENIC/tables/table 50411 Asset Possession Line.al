/// <summary>
/// Table Asset Possession Line (ID 50411).
/// One table for Part II (Office Equipment), Part III (Furniture), Part IV (Keys) and Part V (Phones).
/// </summary>
table 50411 "Asset Possession Line"
{
    Caption = 'Asset Possession Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Asset Possession Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Line Type"; Enum "Asset Possession Line Type")
        {
            Caption = 'Part';
        }
        field(4; "Item Code"; Code[20])
        {
            Caption = 'Item Code';
        }
        field(5; Description; Text[100])
        {
            Caption = 'Type';
        }
        field(6; Issued; Boolean)
        {
            Caption = 'Tick';
        }
        field(7; Model; Text[50])
        {
            Caption = 'Model';
        }
        field(8; "Serial No."; Text[50])
        {
            Caption = 'Serial Number';

            trigger OnValidate()
            begin
                if ("Line Type" = "Line Type"::Phone) and ("Serial No." <> '') then
                    Issued := true;
            end;
        }
        field(9; "Asset Tag No."; Code[20])
        {
            Caption = 'Asset Tag Number';
            TableRelation = "Fixed Asset";
            ValidateTableRelation = false;

            trigger OnValidate()
            var
                FixedAsset: Record "Fixed Asset";
            begin
                if "Asset Tag No." = '' then
                    exit;

                Issued := true;
                if FixedAsset.Get("Asset Tag No.") then
                    if "Serial No." = '' then
                        "Serial No." := FixedAsset."Serial No.";
            end;
        }
        field(10; Condition; Enum "Asset Condition")
        {
            Caption = 'Condition (New/Reallocation)';
        }
        field(11; Quantity; Integer)
        {
            Caption = 'Quantity';
            MinValue = 0;
        }
        field(12; "Phone Type"; Enum "Asset Phone Type")
        {
            Caption = 'Phone Type (Mobile or Desk Phone)';

            trigger OnValidate()
            begin
                if "Phone Type" <> "Phone Type"::" " then
                    Issued := true;
            end;
        }
        field(13; Details; Text[250])
        {
            Caption = 'Details';
        }
        field(14; "Track By Quantity"; Boolean)
        {
            Caption = 'Track By Quantity';
            Editable = false;
        }
        field(15; "Details Required"; Boolean)
        {
            Caption = 'Details Required';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        TestHeaderOpen();
        if "Line No." = 0 then
            "Line No." := GetNextLineNo();
    end;

    trigger OnModify()
    begin
        TestHeaderOpen();
    end;

    trigger OnDelete()
    begin
        TestHeaderOpen();
    end;

    procedure CheckLineBeforeIssue()
    begin
        if "Track By Quantity" then
            TestField(Quantity)
        else
            case "Line Type" of
                "Line Type"::"Office Equipment", "Line Type"::Furniture:
                    begin
                        TestField("Asset Tag No.");
                        TestField(Condition);
                    end;
                "Line Type"::Phone:
                    begin
                        TestField("Phone Type");
                        TestField("Asset Tag No.");
                    end;
            end;

        if "Details Required" then
            TestField(Details);
    end;

    local procedure GetNextLineNo(): Integer
    var
        AssetLine: Record "Asset Possession Line";
    begin
        AssetLine.SetRange("Document No.", "Document No.");
        if AssetLine.FindLast() then
            exit(AssetLine."Line No." + 10000);
        exit(10000);
    end;

    local procedure TestHeaderOpen()
    var
        AssetHeader: Record "Asset Possession Header";
    begin
        // The header may not exist yet while it is being created (lines are populated from its OnInsert).
        if AssetHeader.Get("Document No.") then
            AssetHeader.TestField(Status, AssetHeader.Status::Open);
    end;
}
