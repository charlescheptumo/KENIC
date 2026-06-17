table 50104 "Store Returns Lines"
{
    Caption = 'Store Returns Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
        }
        field(3; "Type"; Enum "Purchase Line Type")
        {
            Caption = 'Type';
        }
        field(4; "No."; Code[20])
        {
            Caption = 'FA No.';
            TableRelation = "Fixed Asset";

            trigger OnValidate()
            begin
                FA.Reset();
                FA.SetRange("No.", Rec."No.");
                if FA.FindFirst() then begin
                    Rec.Description := FA.Description;
                    Rec."Serial No." := FA."Serial No.";
                end;
            end;
        }
        field(5; Description; Text[2048])
        {
            Caption = 'Description';
            TableRelation = "Fixed Asset".Description;
            ValidateTableRelation = false;
        }
        field(6; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Receipt';
            TableRelation = "Unit of Measure";
        }
        field(7; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(8; "Direct Unit Cost"; Decimal)
        {
            Caption = 'Direct Unit Cost';
        }
        field(9; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(10; "Estimated Residual Value"; Decimal)
        {
            Caption = 'Estimated Residual Value';
        }
        field(11; "Estimated Residual Amount"; Decimal)
        {
            Caption = 'Estimated Residual Amount';
        }
        field(12; "Current Status"; Text[2048])
        {
            Caption = 'Current Status';
        }
        field(13; Recommendations; Option)
        {
            Caption = 'Recommendations By Tech. Unit';
            OptionMembers = ,Dispose,"Re-use",Repair;
            OptionCaption = ',Dispose,Re-use,Repair';
        }
        field(14; "Serial No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."Serial No.";
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
    var
        NextLineNo: Integer;
    begin
        ItemLines.Reset();
        if ItemLines.FindLast() then
            NextLineNo := ItemLines."Line No." + 1
        else
            NextLineNo := 1;

        Rec."Line No." := NextLineNo;
    end;

    var
        ItemLines: Record "Store Returns Lines";
        StoreReturnsHeader: Record "Store Returns Header";
        FA: Record "Fixed Asset";
}
