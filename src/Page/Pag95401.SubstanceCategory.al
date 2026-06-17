page 95401 "Substance Category"
{
    Caption = 'Substance Category';
    PageType = Card;
    SourceTable = "Prohibited substance Category";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(Category; Rec.Category)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
            part("Substance SubCategories"; "Substance SubCategory")
            {
                SubPageLink = Category = field(Category);
                ApplicationArea = All;
            }
        }
    }
}
