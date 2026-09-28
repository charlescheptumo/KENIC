table 50187 "Batch EFT Lines"
{
    Caption = 'Batch EFT Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No"; Code[20])
        {
            Caption = 'Document No';
        }
        field(2; "Line No"; Integer)
        {
            Caption = 'Line No';
        }
        field(3; "Vendor No"; Code[20])
        {
            Caption = 'Vendor No';
            TableRelation = Vendor;

            trigger OnValidate()
            var
                Vendor: Record Vendor;
            begin
                if Vendor.Get("Vendor No") then begin
                    "Vendor Name" := Vendor.Name;
                    "Vendor Bank Account No." := Vendor."Bank Account Number";
                end;
            end;
        }
        field(4; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
        }
        field(5; "PV No"; Code[20])
        {
            Caption = 'PV No';
        }
        field(6; "Net Amount"; Decimal)
        {
            Caption = 'Net Amount';
        }
        field(7; "Vendor Bank Account No."; Code[30])
        {
            Caption = 'Vendor Bank Account No.';
        }
        field(8; "Vendor Bank Name"; Text[100])
        {
            Caption = 'Vendor Bank Name';
        }
    }

    keys
    {
        key(PK; "Document No", "Line No")
        {
            Clustered = true;
        }
    }
}
