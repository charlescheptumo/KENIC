table 50107 ContractRenewal
{
    Caption = 'Contract Renewal';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
            trigger OnValidate()
            var
                PurchaseHeader: Record "Purchase Header";
                RandomNumber: Integer;
                RandomDigit: Text[50];
                DocNo: Text[50];
            begin
                PurchaseHeader.Reset();
                PurchaseHeader.SetRange("Document Type", PurchaseHeader."Document Type"::"Blanket Order");
                PurchaseHeader.SetRange("No.", Rec."Contract No.");
                if PurchaseHeader.FindFirst() then begin

                    RandomDigit := CreateGuid;
                    RandomDigit := DelChr(RandomDigit, '=', '{}-01');
                    RandomDigit := CopyStr(RandomDigit, 1, 8);
                    DocNo := RandomDigit;

                    Rec."Document No." := Rec."Contract No." + RandomDigit;
                    Rec.Description := PurchaseHeader.Description;
                    Rec."Current Contract Start Date" := PurchaseHeader."Contract Start Date";
                    Rec."Current Contract End Date" := PurchaseHeader."Contract End Date";
                    Rec."Contractor No" := PurchaseHeader."Buy-from Vendor No.";
                    Rec."Contractor Name" := PurchaseHeader."Buy-from Vendor Name";
                end;
            end;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(3; "Contract Start Date"; Date)
        {
            Caption = 'Contract Start Date';
        }
        field(4; "Contract End Date"; Date)
        {
            Caption = 'Contract End Date';
        }
        field(5; "Approval Status"; Enum "App Status")
        {
            Caption = 'Approval Status';
            Editable = false;
        }
        field(6; "Contractor No"; Code[20])
        {
            Caption = 'Contractor No';
        }
        field(7; "Contractor Name"; Text[100])
        {
            Caption = 'Contractor Name';
        }
        field(8; "Renewal Date"; date)
        {
            Caption = 'Renewal Date';
        }
        field(9; "Current Contract Start Date"; Date)
        {
            Caption = 'Contract Start Date';
            Editable = false;
        }
        field(10; "Current Contract End Date"; Date)
        {
            Caption = 'Contract End Date';
            Editable = false;
        }
        field(11; "Document No."; Code[50])
        {
            Caption = 'Document No.';
        }
    }
    keys
    {
        key(PK; "Contract No.", "Document No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin

    end;
}
