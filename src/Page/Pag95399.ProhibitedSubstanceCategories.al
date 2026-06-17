page 95399 "Prohibited SubstanceCategories"
{
    ApplicationArea = All;
    Caption = 'Prohibited Substance Categories';
    PageType = List;
    SourceTable = "Prohibited substance Category";
    UsageCategory = Lists;
    CardPageId = "Substance Category";
    layout
    {
        area(content)
        {
            repeater(General)
            {
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
        }
    }
}
