/// <summary>
/// Read-only list of item lines for a KRA eTIMS stock adjustment (SAR) header - item, quantity, price, total amount - shown as the Lines subpage on the eTims-Stock Card.
/// </summary>
page 50707 "eTims-Stock Lines"
{
    PageType = List;
    SourceTable = "eTims-Stock Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer TIN"; Rec."Customer TIN") { }
                field("SAR No"; Rec."SAR No") { }
                field("Item Seq"; Rec."Item Seq") { }

                field("Item Code"; Rec."Item Code") { }
                field("Item Name"; Rec."Item Name") { }

                field("Quantity"; Rec."Quantity") { }
                field("Price"; Rec."Price") { }
                field("Total Amount"; Rec."Total Amount") { }
            }
        }
    }
}
