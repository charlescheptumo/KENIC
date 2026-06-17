table 50089 "Additional Requests"
{
    Caption = 'Additional Requests';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Item No."; Code[250])
        {
            TableRelation = Item;

            trigger OnValidate()
            begin
                Item.Reset();
                Item.SetRange("No.", "Item No.");
                if Item.Find('-') then begin
                    "Item Description" := Item.Description;
                end
            end;
        }
        field(4; "Item Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Quantity; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; Code, "Line No")
        {
            Clustered = true;
        }
    }

    var
        Item: Record Item;
}
