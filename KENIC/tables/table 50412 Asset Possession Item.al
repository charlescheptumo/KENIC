/// <summary>
/// Table Asset Possession Item (ID 50412).
/// Setup of the standard rows printed on the Asset Possession Form (Laptop, Monitor, Desk, Office Keys...).
/// </summary>
table 50412 "Asset Possession Item"
{
    Caption = 'Asset Possession Item';
    DataClassification = CustomerContent;
    LookupPageId = "Asset Possession Items";
    DrillDownPageId = "Asset Possession Items";

    fields
    {
        field(1; "Line Type"; Enum "Asset Possession Line Type")
        {
            Caption = 'Part';
        }
        field(2; Code; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Type';
        }
        field(4; "Track By Quantity"; Boolean)
        {
            Caption = 'Track By Quantity';
        }
        field(5; "Details Required"; Boolean)
        {
            Caption = 'Details Required';
        }
    }

    keys
    {
        key(PK; "Line Type", Code)
        {
            Clustered = true;
        }
    }

    procedure InsertDefaultItems()
    var
        LineType: Enum "Asset Possession Line Type";
    begin
        // PART II: OFFICE EQUIPMENT
        AddItem(LineType::"Office Equipment", 'LAPTOP', 'Laptop', false, false);
        AddItem(LineType::"Office Equipment", 'MONITOR', 'Monitor', false, false);
        AddItem(LineType::"Office Equipment", 'CPU', 'CPU', false, false);
        AddItem(LineType::"Office Equipment", 'KEYBOARD', 'Keyboard', false, false);
        AddItem(LineType::"Office Equipment", 'MOUSE', 'Mouse', false, false);
        AddItem(LineType::"Office Equipment", 'HARDDISK', 'Hard Disk', false, false);
        AddItem(LineType::"Office Equipment", 'MODEM', 'Modem', false, false);
        AddItem(LineType::"Office Equipment", 'CONNECTORS', 'Connectors', false, false);
        AddItem(LineType::"Office Equipment", 'LAPTOPSTAND', 'Laptop stand', false, false);
        AddItem(LineType::"Office Equipment", 'CHARGER', 'Laptop Charger', false, false);
        AddItem(LineType::"Office Equipment", 'AIO', 'All-in-One Desktop', false, false);

        // PART III: FURNITURE
        AddItem(LineType::Furniture, 'DESK', 'Desk', false, false);
        AddItem(LineType::Furniture, 'SEAT', 'Seat', false, false);
        AddItem(LineType::Furniture, 'PEDESTAL', 'Pedestal', false, false);
        AddItem(LineType::Furniture, 'PEDESTALKEY', 'Pedestal key (Qty)', true, false);

        // PART IV: KEYS
        AddItem(LineType::"Keys", 'OFFICEKEY', 'Office Keys', false, false);
        AddItem(LineType::"Keys", 'SERVERKEY', 'Server Room Keys', false, false);
        AddItem(LineType::"Keys", 'STOREKEY', 'Store Keys', false, false);
        AddItem(LineType::"Keys", 'BANKTOKEN', 'Bank token (state the bank)', false, true);
        AddItem(LineType::"Keys", 'POSTALKEY', 'Postal Keys (State the post office)', false, true);
        AddItem(LineType::"Keys", 'BANKSAFE', 'Bank safe Keys (State the bank)', false, true);
        AddItem(LineType::"Keys", 'OFFICESAFE', 'Office safe Keys', false, false);
        AddItem(LineType::"Keys", 'CARKEY', 'Car Keys (State the Car)', false, true);
    end;

    local procedure AddItem(NewLineType: Enum "Asset Possession Line Type"; NewCode: Code[20]; NewDescription: Text[100]; NewTrackByQty: Boolean; NewDetailsRequired: Boolean)
    var
        AssetItem: Record "Asset Possession Item";
    begin
        if AssetItem.Get(NewLineType, NewCode) then
            exit;

        AssetItem.Init();
        AssetItem."Line Type" := NewLineType;
        AssetItem.Code := NewCode;
        AssetItem.Description := NewDescription;
        AssetItem."Track By Quantity" := NewTrackByQty;
        AssetItem."Details Required" := NewDetailsRequired;
        AssetItem.Insert();
    end;
}
