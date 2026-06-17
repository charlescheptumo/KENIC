page 95402 "Prohibited Methods Categories"
{
    ApplicationArea = All;
    Caption = 'Prohibited Methods Categories';
    PageType = List;
    SourceTable = "Prohibited Methods Categories";
    UsageCategory = Lists;

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
