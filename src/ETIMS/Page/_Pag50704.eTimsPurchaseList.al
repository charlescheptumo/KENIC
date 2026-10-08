/// <summary>
/// Read-only list of supplier purchase invoices as reported to KRA eTIMS (supplier TIN/name, invoice no., sales date, totals), drilling into the eTims-Purchase Card for line detail.
/// </summary>
page 50704 "eTims-Purchase List"
{
    ApplicationArea = Basic;
    Caption = 'eTims-Purchase List';
    PageType = List;
    SourceTable = "eTims-Purchase Header";
    UsageCategory = Administration;
    CardPageId = "eTims-Purchase Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Supplier TIN"; Rec."Supplier TIN") { }
                field("Invoice No"; Rec."Invoice No") { }
                field("Supplier Name"; Rec."Supplier Name") { }
                field("Sales Date"; Rec."Sales Date") { }
                field("Total Amount"; Rec."Total Amount") { }
                field("Total Tax"; Rec."Total Tax") { }
            }
        }
    }
}
