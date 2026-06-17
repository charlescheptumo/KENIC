page 95408 "Routes of Administration"
{
    ApplicationArea = All;
    Caption = 'Routes of Administration';
    PageType = List;
    SourceTable = "Routes of Administration";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Route of Administration"; Rec."Route of Administration")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Route of Administration field.';
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
