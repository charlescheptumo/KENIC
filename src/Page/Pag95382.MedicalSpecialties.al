page 95382 "Medical Specialties"
{
    ApplicationArea = All;
    Caption = 'Medical Specialties';
    PageType = List;
    SourceTable = "Medical Specialties";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Specialty Code"; Rec."Specialty Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Specialty Code field.';
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
