/// <summary>
/// Read-only list of item master data as registered with KRA eTIMS (item code/name/class/type, tax type, packaging/quantity units, pricing), used to review data synced from the eTIMS middleware.
/// </summary>
page 50702 "eTims-Item List"
{
    ApplicationArea = Basic;
    Caption = 'eTIMS Item List';
    PageType = List;
    SourceTable = "ETIMS Item";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Item Code"; Rec."Item Code") { }
                field("TIN"; Rec."TIN") { }
                field("Item Name"; Rec."Item Name") { }
                field("Item Class Code"; Rec."Item Class Code") { }
                field("Item Type Code"; Rec."Item Type Code") { }
                field("Origin Country"; Rec."Origin Country") { }
                field("Package Unit"; Rec."Package Unit") { }
                field("Quantity Unit"; Rec."Quantity Unit") { }
                field("Tax Type Code"; Rec."Tax Type Code") { }
                field(Barcode; Rec.Barcode) { }
                field("Default Price"; Rec."Default Price") { }
                field("Use YN"; Rec."Use YN") { }
            }
        }
    }
}
