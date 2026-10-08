/// <summary>
/// Card view of a single KRA eTIMS purchase invoice (supplier, receipt/payment type, dates, totals) with its item lines shown in the eTims-Purchase Line List subpage.
/// </summary>
page 50705 "eTims-Purchase Card"
{
    ApplicationArea = All;
    Caption = 'eTims-Purchase Card';
    PageType = Card;
    SourceTable = "eTims-Purchase Header";

    layout
    {
        area(content)
        {

            group(General)
            {
                field("Supplier TIN"; Rec."Supplier TIN") { }
                field("Invoice No"; Rec."Invoice No") { }
                field("Supplier Name"; Rec."Supplier Name") { }
                field("Branch Id"; Rec."Branch Id") { }
                field("Receipt Type"; Rec."Receipt Type") { }
                field("Payment Type"; Rec."Payment Type") { }
                field("Confirm Date"; Rec."Confirm Date") { }
                field("Sales Date"; Rec."Sales Date") { }
                field("Total Amount"; Rec."Total Amount") { }
                field("Total Tax"; Rec."Total Tax") { }
                field(Remark; Rec.Remark) { }
            }


            part(Lines; "eTims-Purchase Line List")
            {
                SubPageLink =
                    "Supplier TIN" = field("Supplier TIN"),
                    "Invoice No" = field("Invoice No");
            }

        }
    }
}
