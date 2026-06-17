table 50151 "Meals Subform"
{
    Caption = 'Meals Subform';
    DataClassification = ToBeClassified;

    fields
    {
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Purchase Header"."No.";
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
        }
        field(4; "Meals Type"; Option)
        {
            Caption = 'Meals Type (Old)';
            OptionMembers = Breakfast,"Morning tea",Lunch,"High tea";
            ObsoleteState = Removed;
            ObsoleteReason = 'Replaced by Meal Type Code';
        }

        field(5; Cost; Decimal)
        {
            Caption = 'Cost';
            trigger OnValidate()
            begin
                Amount := Quantity * Cost;
            end;
        }
        field(6; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(7; "Meal Type Code"; Code[30])
        {
            Caption = 'Meal Type';
            TableRelation = "Meal Type"."No.";

            trigger OnValidate()
            var
                MealType: Record "Meal Type";
            begin
                if "Meal Type Code" = '' then begin
                    Description := '';
                    Cost := 0;
                    exit;
                end;

                if MealType.Get("Meal Type Code") then begin
                    Description := MealType.Description;
                    Cost := MealType.Cost;
                end;
                Amount := Quantity * Cost;
            end;
        }
        field(8; Quantity; Integer)
        {
            Caption = 'Quantity';
            trigger OnValidate()
            begin
                Amount := Quantity * Cost;
            end;
        }
        field(9; Amount; Decimal)
        {
            Caption = 'Amount';

        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}