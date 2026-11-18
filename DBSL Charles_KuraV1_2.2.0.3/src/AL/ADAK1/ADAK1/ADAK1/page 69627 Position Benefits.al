page 79697 "Position Benefits"
{
    Caption = 'Benefits';
    PageType = ListPart;
    SourceTable = "Position Benefit";
    ApplicationArea = All;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Benefit Category"; Rec."Benefit Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the category of the benefit.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the benefit attached to this position.';
                }
            }
        }
    }
}
