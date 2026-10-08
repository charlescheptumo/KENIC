/// <summary>
/// Card view of a single KRA eTIMS stock adjustment (SAR) header - customer/branch, occurrence date, totals, remark - with its item lines shown in the eTims-Stock Lines subpage.
/// </summary>
page 50708 "eTims-Stock Card"
{
    ApplicationArea = All;
    Caption = 'eTims-Stock Card';
    PageType = Card;
    SourceTable = "eTims-Stock Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Customer TIN"; Rec."Customer TIN") { }
                field("Customer Branch ID"; Rec."Customer Branch ID") { }
                field("SAR No"; Rec."SAR No") { }

                field("Occurrence Date"; Rec."Occurrence Date") { }

                field("Total Item Count"; Rec."Total Item Count") { }
                field("Total Taxable Amount"; Rec."Total Taxable Amount") { }
                field("Total Tax Amount"; Rec."Total Tax Amount") { }
                field("Total Amount"; Rec."Total Amount") { }

                field(Remark; Rec.Remark) { }
            }

            part(Lines; "eTims-Stock Lines")
            {
                SubPageLink =
                    "Customer TIN" = field("Customer TIN"),
                    "Customer Branch ID" = field("Customer Branch ID"),
                    "SAR No" = field("SAR No");
            }
        }
    }
}
