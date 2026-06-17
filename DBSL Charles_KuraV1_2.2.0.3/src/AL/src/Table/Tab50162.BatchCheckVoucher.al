table 50162 "Batch Check Voucher"
{
    Caption = 'Batch Check Voucher';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(3; "Paying Bank Account"; Code[20])
        {
            Caption = 'Paying Bank Account';
            TableRelation = "Bank Account";
            trigger OnValidate()
            var
                BankAccount: Record "Bank Account";
            begin
                If BankAccount.Get("Paying Bank Account") then
                    "Paying Bank Account Name" := BankAccount.Name;
            end;
        }
        field(4; "Paying Bank Account Name"; Text[100])
        {
            Caption = 'Paying Bank Account Name';
        }
        field(5; "Pay Mode"; Code[20])
        {
            Caption = 'Pay Mode ';
            TableRelation = "Pay Mode";
        }
        field(6; "Cheque No"; Code[50])
        {
            Caption = 'Cheque No';
        }
        field(7; "Created By"; Code[50])
        {
            Caption = 'Created By';
        }
        field(8; "Check Printed"; Boolean)
        {
            Caption = 'Check Printed';
        }
        field(9; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(10; Amount; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Batch Check Lines"."Net Amount" where("Document No" = field("No.")));

        }
        field(11; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Check Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; Payee; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Shortcut Dimension 1 Code"; Code[50])
        {
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(15; "Shortcut Dimension 2 Code"; Code[50])
        {
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));
            trigger OnValidate()
            begin
                // ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(16; "Check No"; Code[20])
        {
            Caption = 'Check No.';
        }
        field(17; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDocDim;
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
            end;
        }
        field(18; "Physical Check No"; Code[20])
        {
            Caption = 'Physical Check No.';
        }



    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "No.", "Date", "Paying Bank Account", "Paying Bank Account Name", "Payee")
        {
        }
    }
    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
  DimMgt.EditDimensionSet(
    "Dimension Set ID", STRSUBSTNO('%1 %2', "No.", "Date"),
    "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
            MODIFY;



        END;

    end;




    var
        DimMgt: Codeunit DimensionManagement;


}
