table 50163 "Batch Check Lines"
{
    Caption = 'Batch Check Lines';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Document No"; Code[50])
        {
            Caption = 'Document No';
        }
        field(2; "Line No"; Integer)
        {
            Caption = 'Line No';
        }
        field(3; "Vendor No"; Code[50])
        {
            Caption = 'Vendor No';
            TableRelation = Vendor;
            trigger OnValidate()
            var
                VendorRec: Record Vendor;
            begin
                if VendorRec.Get("Vendor No") then
                    "Vedor Name" := VendorRec.Name;
            end;
        }
        field(4; "Vedor Name"; Text[150])
        {
            Caption = 'Vedor Name';
            editable = false;
        }
        field(5; "PV No"; Code[50])
        {
            Caption = 'PV No';
        }
        field(6; "Net Amount"; Decimal)
        {
            Caption = 'Net Amount';
        }
    }
    keys
    {
        key(PK; "Document No","Line No")
        {
            Clustered = true;
        }
    }
}
