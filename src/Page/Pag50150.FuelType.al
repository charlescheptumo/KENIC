page 50150 "Fuel Type"
{
    ApplicationArea = All;
    Caption = 'Fuel Type';
    PageType = List;
    SourceTable = "Fuel Type";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                    ApplicationArea = Basic;
                }
            }
        }
    }
}
