/// <summary>
/// Read-only list of item lines for a KRA eTIMS purchase invoice (item, quantity, price, tax and total amounts), shown as the Lines subpage on the eTims-Purchase Card.
/// </summary>
page 50711 "eTims-Purchase Line List"
{
    ApplicationArea = All;
    Caption = 'eTims-Purchase Line List';
    PageType = List;
    SourceTable = "eTims-Purchase Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Supplier TIN"; Rec."Supplier TIN") { }
                field("Invoice No"; Rec."Invoice No") { }
                field("Item Seq"; Rec."Item Seq") { }
                field("Item Code"; Rec."Item Code") { }
                field("Item Name"; Rec."Item Name") { }
                field(Qty; Rec.Qty) { }
                field(Price; Rec.Price) { }
                field("Supply Amount"; Rec."Supply Amount") { }
                field("Tax Amount"; Rec."Tax Amount") { }
                field("Total Amount"; Rec."Total Amount") { }
            }
        }
    }
}
