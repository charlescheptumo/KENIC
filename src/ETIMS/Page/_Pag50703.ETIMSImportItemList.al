/// <summary>
/// Read-only list of import item declarations synced from KRA eTIMS (declaration no., HS code, quantities, weights, supplier/agent, invoice amount) for imported goods.
/// </summary>
page 50703 "eTims-Import Item List"
{
    ApplicationArea = Basic;
    Caption = 'ETIMS Import Item List';
    PageType = List;
    SourceTable = "eTims-Import Item";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Task Code"; Rec."Task Code") { }
                field("Item Seq"; Rec."Item Seq") { }
                field("Declaration No"; Rec."Declaration No") { }
                field("Item Name"; Rec."Item Name") { }
                field("HS Code"; Rec."HS Code") { }
                field(Quantity; Rec.Quantity) { }
                field("Qty Unit"; Rec."Qty Unit") { }
                field("Total Weight"; Rec."Total Weight") { }
                field("Net Weight"; Rec."Net Weight") { }
                field(Supplier; Rec.Supplier) { }
                field(Agent; Rec.Agent) { }
                field("Invoice Amount"; Rec."Invoice Amount") { }
                field(Currency; Rec.Currency) { }
            }
        }
    }
}
