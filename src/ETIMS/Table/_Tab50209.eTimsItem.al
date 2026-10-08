/// <summary>
/// Stores item master data (item code, TIN, name, item class/type, origin country, package/quantity unit, tax type, barcode, default price, active flag) synced with the eTIMS item registry.
/// </summary>
table 50209 "ETIMS Item"
{
    fields
    {
        field(1; "Item Code"; Code[30]) { }
        field(2; "TIN"; Code[20]) { }
        field(3; "Item Name"; Text[150]) { }
        field(4; "Item Class Code"; Code[20]) { }
        field(5; "Item Type Code"; Code[10]) { }
        field(6; "Origin Country"; Code[10]) { }
        field(7; "Package Unit"; Code[10]) { }
        field(8; "Quantity Unit"; Code[10]) { }
        field(9; "Tax Type Code"; Code[10]) { }
        field(10; Barcode; Text[50]) { }
        field(11; "Default Price"; Decimal) { }
        field(12; "Use YN"; Option)
        {
            OptionMembers = "",Y,N;
        }
    }

    keys
    {
        key(PK; "Item Code")
        {
            Clustered = true;
        }
    }
}
