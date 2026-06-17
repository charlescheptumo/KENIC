page 95391 MedicalPractitionersCategories
{
    ApplicationArea = All;
    Caption = 'Medical Practitioners Categories';
    PageType = List;
    SourceTable = "Medical Practioner Categories";
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
