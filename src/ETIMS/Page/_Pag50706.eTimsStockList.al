/// <summary>
/// Read-only list of KRA eTIMS stock adjustment/movement (SAR) headers - customer, branch, occurrence date, item count and totals - drilling into the eTims-Stock Card for line detail.
/// </summary>
page 50706 "eTims-Stock List"
{
    PageType = List;
    UsageCategory = Administration;
    SourceTable = "eTims-Stock Header";
    ApplicationArea = All;
    CardPageId = "eTims-Stock Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer TIN"; Rec."Customer TIN") { }
                field("Customer Branch ID"; Rec."Customer Branch ID") { }
                field("SAR No"; Rec."SAR No") { }
                field("Occurrence Date"; Rec."Occurrence Date") { }

                field("Total Item Count"; Rec."Total Item Count") { }
                field("Total Taxable Amount"; Rec."Total Taxable Amount") { }
                field("Total Tax Amount"; Rec."Total Tax Amount") { }
                field("Total Amount"; Rec."Total Amount") { }
            }
        }
    }
}
