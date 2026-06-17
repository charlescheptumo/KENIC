page 95381 "Licensing Bodies"
{
    ApplicationArea = All;
    Caption = 'Licensing Bodies';
    PageType = List;
    SourceTable = "Licensing Bodies";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Licensing Body"; Rec."Licensing Body")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Licensing Body field.';
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
